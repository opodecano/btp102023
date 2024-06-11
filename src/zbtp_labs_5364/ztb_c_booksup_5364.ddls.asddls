@EndUserText.label: 'Consumption - Booking'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZTB_C_BOOKSUP_5364
  as projection on ZTB_I_BOOKSUP_5364
{
  key travel_id                   as TravelID,
  key booking_id                  as BookingID,
  key booking_supplement_id       as BookingSupplementID,
      @ObjectModel.text.element: ['SupplementDescription']
      supplement_id               as SupplementID,
      _SupplementText.Description as SupplementDescription : localized,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      price                       as Price,
      @Semantics.currencyCode: true
      currency_code               as CurrencyCode,
      last_changed_at             as LastChangedAt,

      /* Associations */
      _Travel  : redirected to ZTB_C_TRAVEL_5364,
      _Booking : redirected to parent ZTB_C_BOOKING_5364,
      _Supplement

}
