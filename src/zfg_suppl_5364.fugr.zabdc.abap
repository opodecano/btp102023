FUNCTION zabdc.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(VAGE) TYPE  ZEMPLOYEE_01-AGE
*"  EXPORTING
*"     VALUE(E_DATA) TYPE  ZEMPLOYEEE
*"----------------------------------------------------------------------
  DATA: wa_tab TYPE ZEMPLOYEE_01,
        it_tab type STANDARD TABLE OF zemployee_01.

  SELECT *
    FROM ZEMPLOYEE_01
    WHERE age > 30
     INTO table @it_tab.

  IF sy-subrc = 0.
     e_DATA = IT_TAb.
  ELSE.
  ENDIF.

ENDFUNCTION.
