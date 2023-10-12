@EndUserText.label: 'Consumption - Travel Approval'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity z_c_atravel_5364
  as projection on z_i_travel_5364
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
      _Booking : redirected to composition child z_c_abooking_5364,
      _Customer

}
