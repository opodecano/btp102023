FUNCTION zfunction_modules.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(EMPLOYEE_ID) TYPE  ZEMPLOYEE_01-EMPLOYEE_ID
*"  EXPORTING
*"     VALUE(E_DATA) TYPE  ZEMPLOYEEE
*"----------------------------------------------------------------------
  DATA: wa_tab TYPE ZEMPLOYEE_01,
        it_tab type STANDARD TABLE OF zemployee_01.

  SELECT *
    FROM ZEMPLOYEE_01
    WHERE employee_id = @EMPLOYEE_ID
     INTO table @it_tab.

  IF sy-subrc = 0.
     e_DATA = IT_TAB.
  ELSE.
  ENDIF.

ENDFUNCTION.
