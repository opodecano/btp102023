@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interfase - Booking'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZTB_I_BOOKING_5364
  as select from ztb_booking_5364
  association        to parent ZTB_I_TRAVEL_5364 as _Travel        on  $projection.travel_id = _Travel.travel_id
  composition [0..*] of ZTB_I_BOOKSUP_5364  as _BookSupplement
  association [1..1] to /DMO/I_Customer          as _Customer      on  $projection.customer_id = _Customer.CustomerID
  association [1..1] to /DMO/I_Carrier           as _Carrier       on  $projection.carrier_id = _Carrier.AirlineID
  association [1..1] to /DMO/I_Connection        as _Connection    on  $projection.carrier_id    = _Connection.AirlineID
                                                                   and $projection.connection_id = _Connection.ConnectionID
  association [1..1] to /DMO/I_Booking_Status_VH as _BookingStatus on  $projection.booking_status = _BookingStatus.BookingStatus
{
  key travel_id,
  key booking_id,
      booking_date,
      customer_id,
      carrier_id,
      connection_id,
      flight_date,
      @Semantics.amount.currencyCode: 'currency_code'
      flight_price,
      currency_code,
      booking_status,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at,

      _Travel,
      _BookSupplement,
      _Customer,
      _Carrier,
      _Connection,
      _BookingStatus
}
