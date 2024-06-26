@EndUserText.label: 'Aprobador - Travel'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ztb_c_atravel_5364
  provider contract transactional_query
  as projection on ztb_i_travel_5364
{
  key travel_id          as TravelId,
      @ObjectModel.text.element: [ 'AgencyName' ]
      agency_id          as AgencyId,
      _Agency.Name       as AgencyName,
      @ObjectModel.text.element: [ 'CustomerName' ]
      customer_id        as CustomerId,
      _Customer.LastName as CustomerName,
      begin_date         as BeginDate,
      end_date           as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee        as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price        as TotalPrice,
      @Semantics.currencyCode: true
      currency_code      as CurrencyCode,
      description        as Description,
      overall_status     as TravelStatus,
      last_changed_at    as LastChangedAt,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child ztb_c_abooking_5364, 
      _Customer
}
