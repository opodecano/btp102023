@AbapCatalog.sqlViewName: 'ZV_BOOK_5364'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface - Booking Supplement'
define view z_i_bookingsuppl_5364
  as select from zbooksuppl_5364 as BookingSupplement
  association        to parent z_i_booking_5364 as _Booking        on  $projection.TravelId  = _Booking.TravelId
                                                                   and $projection.BookingId = _Booking.BookingId
  association [1..1] to z_i_travel_5364         as _Travel         on  $projection.TravelId = _Travel.travel_id
  association [1..1] to /DMO/I_Supplement       as _Product        on  $projection.SupplementId = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText   as _SupplementText on  $projection.SupplementId = _SupplementText.SupplementID

{
  key travel_id             as TravelId,
  key booking_id            as BookingId,
  key booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      @Semantics.currencyCode: true
      currency_code         as CurrencyCode,
      @Semantics.systemDateTime.lastChangedAt: true
      _Travel.last_changed_at,
      _Travel,
      _Booking,
      _Product,
      _SupplementText
}
