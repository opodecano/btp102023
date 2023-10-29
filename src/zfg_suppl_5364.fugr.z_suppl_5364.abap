FUNCTION z_suppl_5364.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IT_SUPPLEMENTS) TYPE  ZTT_SUPPL_5364
*"     REFERENCE(IV_OP_TYPE) TYPE  ZDE_FLAG
*"  EXPORTING
*"     REFERENCE(EV_UPDATED) TYPE  ZDE_FLAG
*"----------------------------------------------------------------------
  CASE iv_op_type.
    WHEN 'C'.
      INSERT zbooksuppl_5364 FROM TABLE @it_supplements.
    WHEN 'U'.
      UPDATE zbooksuppl_5364 FROM TABLE @it_supplements.
    WHEN 'D'.
      DELETE zbooksuppl_5364 FROM TABLE @it_supplements.

  ENDCASE.


  IF sy-subrc EQ 0.
    ev_updated = abap_true.
  ENDIF.

ENDFUNCTION.
