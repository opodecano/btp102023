CLASS lhc_Header DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Header RESULT result.
    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE header.
    METHODS earlynumbering_create_item FOR NUMBERING
      IMPORTING entities FOR CREATE header\_Items.


ENDCLASS.

CLASS lhc_Header IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.


  METHOD earlynumbering_create.

    SELECT MAX( id ) FROM ztb_header_5364 INTO @DATA(lv_header_id).

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<ls_entity>).
      INSERT VALUE #( %cid            = <ls_entity>-%cid
                      id  = lv_header_id + 1 ) INTO TABLE mapped-header.
    ENDLOOP.

  ENDMETHOD.

  METHOD earlynumbering_create_item.
    SELECT MAX( id ) FROM ztb_items_5364 INTO @DATA(lv_items_id).

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<ls_entity>).
      LOOP AT <ls_entity>-%target ASSIGNING FIELD-SYMBOL(<ls_item_create>).
        INSERT VALUE #( %cid            = <ls_item_create>-%cid
                        orderid = <ls_entity>-Id
                        id  = lv_items_id + 1 ) INTO TABLE mapped-items.
      ENDLOOP.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
