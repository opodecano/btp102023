FUNCTION Z_TB_SUPP_5364.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IT_SUPPLEMENTS) TYPE  ZTT_TB_SUPPL_5364
*"     REFERENCE(IV_OP_TYPE) TYPE  ZDE_FLAG
*"  EXPORTING
*"     REFERENCE(EV_UPDATED) TYPE  ZDE_FLAG
*"----------------------------------------------------------------------
  CASE iv_op_type.
    WHEN 'C'.
      INSERT ztb_booksup_5364 FROM TABLE @it_supplements.
    WHEN 'U'.
      UPDATE ztb_booksup_5364 FROM TABLE @it_supplements.
    WHEN 'D'.
      DELETE ztb_booksup_5364 FROM TABLE @it_supplements.

  ENDCASE.


  IF sy-subrc EQ 0.
    ev_updated = abap_true.
  ENDIF.


ENDFUNCTION.
