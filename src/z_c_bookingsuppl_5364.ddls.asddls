@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption - Booking Supplement'
@Metadata.allowExtensions: true
define view entity z_c_bookingsuppl_5364
  as projection on z_i_bookingsuppl_5364
{
  key TravelId                    as TravelID,
  key BookingId                   as BookingID,
  key BookingSupplementId         as BookingSupplementID,
      SupplementId                as SupplemetID,
      _SupplementText.Description as SupplementDescription : localized,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price                       as Price,
      @Semantics.currencyCode: true
      CurrencyCode,
      last_changed_at             as LastChangedAt,
      /* Associations */
      _Travel  : redirected to z_c_travel_5364,
      _Booking : redirected to parent z_c_booking_5364,
      _Product,
      _SupplementText

}
