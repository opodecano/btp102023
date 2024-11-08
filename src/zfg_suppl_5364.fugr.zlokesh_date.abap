FUNCTION ZLOKESH_DATE.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(INPUT)
*"  EXPORTING
*"     VALUE(OUTPUT)
*"----------------------------------------------------------------------

  DATA: h_datum_input       LIKE sy-datum VALUE '00000000',
        h_datum(60)         TYPE c,
        h_datum_output(50)  TYPE c,
        h_lang_text         TYPE c LENGTH 20,
        h_length            TYPE i VALUE '50'.

  DATA: year   TYPE c LENGTH 4,
        month  TYPE c LENGTH 2,
        day    TYPE c LENGTH 2,
        h_day  TYPE c LENGTH 3.

  DATA: user_return   TYPE TABLE OF bapiret2,
        user_defaults TYPE bapidefaul,
        l_datfm       TYPE xudatfm.


* SPACE is not converted

  h_datum = input.

  IF input = space OR h_datum(8) = h_datum_input.
    output = space.
    EXIT.
  ENDIF.

* check plausibility

  h_datum_input = input.

  CALL FUNCTION 'DATE_CHECK_PLAUSIBILITY'
    EXPORTING
      date                      = h_datum_input
    EXCEPTIONS
      plausibility_check_failed = 01.

  IF sy-subrc <> 0.
    output = space.
    MESSAGE s885.      " invalid format
    EXIT.
  ENDIF.

* fill the internal tables with English month names

  IF h_monat_buffer NE space.
    PERFORM fill_h_monat_tab.
    h_monat_buffer = space.
  ENDIF.

* fill the buffer if initial

  IF buffer_control NE space.
    IF sy-langu NE h_langu_save
       OR h_counter EQ 0.
      h_langu_save = sy-langu.
      PERFORM fill_buffer.
    ENDIF.
  ENDIF.

* dissect date

  year  = h_datum_input(4).
  month = h_datum_input+4(2).
  day   = h_datum_input+6(2).

* get date format according to user settings
* treat Islamic calendars as international standard ones
  if g_user_defaults is initial. "1848500
    g_user_defaults = cl_suid_user_runtime=>get_defaults( ).
  endif.

  IF g_user_defaults-datfm NA '123456'.      "#EC DATFM "#EC SYNTCHAR
    l_datfm = '5'.                           "#EC DATFM
  ELSE.                                      "#EC DATFM
    l_datfm = g_user_defaults-datfm.         "#EC DATFM
  ENDIF.                                     "#EC DATFM

* get month name

  IF buffer_control = space.
    SELECT SINGLE * FROM t247 WHERE spras = sy-langu
                              AND   mnr   = month.
    IF sy-subrc = 0.
      h_lang_text = t247-ltx.
    ELSE.
      h_monat_tab-spras = 'E'.
      h_monat_tab-mnr   = month.
      READ TABLE h_monat_tab WITH KEY h_monat_tab(3) BINARY SEARCH.
      h_lang_text = h_monat_tab-ltx.
    ENDIF.
  ELSE.
    IF h_language NE space.
      t247_tab-spras = h_language.
    ELSE.
      t247_tab-spras = h_langu_save.
    ENDIF.
    t247_tab-mnr   = month.
    READ TABLE t247_tab WITH KEY t247_tab(3) BINARY SEARCH.
    h_lang_text = t247_tab-ltx.
  ENDIF.

* make up date in the external format

  CASE l_datfm.                            "#EC DATFM

    WHEN '1'.

      CONCATENATE day '.' INTO h_day.
      CONCATENATE h_day h_lang_text year INTO h_datum_output
        SEPARATED BY space.

    WHEN '2' OR '3'.

      CONCATENATE day ',' INTO h_day.
      CONCATENATE h_lang_text h_day year INTO h_datum_output
        SEPARATED BY space.

    WHEN '4' OR '5' OR '6'.

      CONCATENATE year h_lang_text day INTO h_datum_output
        SEPARATED BY space.

  ENDCASE.

  output = h_datum_output.

  CONDENSE output. " NO-GAPS.


ENDFUNCTION.
.
