@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interfase - Booking Supplement View'

define view entity z_i_bookingsuppl_5364
  as select from zbooksuppl_5364 as BookingSupplement

  association        to parent z_i_booking_5364 as _Booking        on  $projection.travel_id  = _Booking.travel_id
                                                                   and $projection.booking_id = _Booking.booking_id

  association [1..1] to z_i_travel_5364         as _Travel         on  $projection.travel_id = _Travel.travel_id
  association [1..1] to /DMO/I_Supplement       as _Supplement     on  $projection.supplement_id = _Supplement.SupplementID
  association [1..*] to /DMO/I_SupplementText   as _SupplementText on  $projection.supplement_id = _SupplementText.SupplementID
{
  key travel_id,
  key booking_id,
  key booking_supplement_id,
      supplement_id,
      @Semantics.amount.currencyCode: 'currency_code'
      price,
      currency_code,

      //local ETag field --> OData ETag
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at,

      /* Associations */
      _Travel,
      _Booking,
      _Supplement,
      _SupplementText
}
