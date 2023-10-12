@EndUserText.label: 'Consuption - Booking'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity z_c_booking_5364
  as projection on z_i_booking_5364
{
  key TravelId      as TravelID,
  key BookingId     as BookingID,
      BookingDate   as BookingDate,
      CustomerId    as CustomerID,
      @ObjectModel.text.element: [ 'CarrierName' ]
      CarrierId     as CarrierID,
      _Carrier.Name as CarrierName,
      ConnectionId  as ConnectionID,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      @Semantics.currencyCode: true
      CurrencyCode,
      BookingStatus,
      LastChangedAt,
      /* Associations */
      _Travel            : redirected to parent z_c_travel_5364,
      _BookingSupplement : redirected to composition child z_c_bookingsuppl_5364,
      _Carrier,
      _Connection,
      _Customer
}
