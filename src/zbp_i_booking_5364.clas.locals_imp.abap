CLASS lhc_Booking DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS calculateTotalFlightPrice FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Booking~calculateTotalFlightPrice.

    METHODS ValidateStatus FOR VALIDATE ON SAVE
      IMPORTING keys FOR Booking~ValidateStatus.

ENDCLASS.

CLASS lhc_Booking IMPLEMENTATION.

  METHOD calculateTotalFlightPrice.
  ENDMETHOD.

  METHOD ValidateStatus.
  ENDMETHOD.

ENDCLASS.
