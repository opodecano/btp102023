@EndUserText.label: 'Consuption - Booking Approval'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity z_c_abooking_5364
  as projection on z_i_booking_5364
{
  key travel_id       as TravelID,
  key booking_id      as BookingID,
      booking_date    as BookingDate,
      customer_id     as CustomerID,
      @ObjectModel.text.element: [ 'CarrierName' ]
      carrier_id      as CarrierID,
      _Carrier.Name   as CarrierName,
      connection_id   as ConnectionID,
      flight_date     as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price    as FlightPrice,
      @Semantics.currencyCode: true
      currency_code   as CurrencyCode,
      booking_status  as BookingStatus,
      last_changed_at as LastChangedAt,
      /* Associations */
      _Travel : redirected to parent z_c_atravel_5364,
      _BookingSupplement,
      _Customer,
      _Carrier
}
