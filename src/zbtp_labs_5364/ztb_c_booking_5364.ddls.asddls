@EndUserText.label: 'Consumption - Booking'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZTB_C_BOOKING_5364
  as projection on ZTB_I_BOOKING_5364
{
  key travel_id                 as TravelID,
  key booking_id                as BookingID,
      booking_date              as BookingDate,
      customer_id               as CustomerID,
      _Customer.LastName        as CustomerName,
      @ObjectModel.text.element: [ 'CarrierName' ]
      carrier_id                as CarrierID,
      _Carrier.Name             as CarrierName,
      connection_id             as ConnectionID,
      flight_date               as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price              as FlightPrice,
      @Semantics.currencyCode: true
      currency_code             as CurrencyCode,
      booking_status            as BookingStatus,
      _BookingStatus._Text.Text as BookingStatusText : localized,
      last_changed_at           as LastChangedAt,
      /* Associations */
      _Travel         : redirected to parent ZTB_C_TRAVEL_5364,
      _BookSupplement : redirected to composition child ZTB_C_BOOKSUP_5364,
      _Carrier,
      _Customer,
      _BookingStatus
}
