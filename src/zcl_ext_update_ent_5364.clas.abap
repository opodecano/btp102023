CLASS zcl_ext_update_ent_5364 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EXT_UPDATE_ENT_5364 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    MODIFY ENTITIES OF z_i_travel_5364
    ENTITY Travel
    UPDATE FIELDS ( agency_id description )
    WITH VALUE #( ( travel_id = '0000000001'
                    agency_id = '070041'
                    description = 'Vacation' ) )
    FAILED DATA(failed)
    REPORTED DATA(reported).

    READ ENTITIES OF z_i_travel_5364
    ENTITY Travel
    FIELDS ( agency_id description )
    WITH VALUE #( ( travel_id = '0000000001' ) )
    RESULT DATA(lt_travel_data)
    FAILED failed
    REPORTED reported.

    COMMIT ENTITIES.

    IF failed IS INITIAL.
      out->write( 'commit Sucessfull' ).
    ELSE.
      out->write( 'commit Failed' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
