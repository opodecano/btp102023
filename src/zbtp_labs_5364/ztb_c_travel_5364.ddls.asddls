@EndUserText.label: 'Consumption - Travel'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZTB_C_TRAVEL_5364
  provider contract transactional_query
   as projection on ZTB_I_TRAVEL_5364
{
  key     travel_id                 as TravelID,
          @ObjectModel.text.element: [ 'AgencyName' ]
          agency_id                 as AgencyID,
          _Agency.Name              as AgencyName,
          @ObjectModel.text.element: [ 'CustomerName' ]
          customer_id               as CustomerID,
          _Customer.LastName        as CustomerName,
          begin_date                as BeginDate,
          end_date                  as EndDate,
          @Semantics.amount.currencyCode: 'CurrencyCode'
          booking_fee               as BookingFee,
          @Semantics.amount.currencyCode: 'CurrencyCode'
          total_price               as TotalPrice,
          @Semantics.currencyCode: true
          currency_code             as CurrencyCode,
          @ObjectModel.text.element: ['OverallStatusText']
          overall_status            as OverallStatus,
          _OverallStatus._Text.Text as OverallStatusText : localized,
          description               as Description,
          last_changed_at           as LastChangedAt,
          @Semantics.amount.currencyCode: 'CurrencyCode'
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VIRTUAL_ELEM_5364'
  virtual DiscountPrice : /dmo/total_price,

          /* Associations */

          _Booking : redirected to composition child ZTB_C_BOOKING_5364,
          _Agency,
          _Customer,
          _OverallStatus
}
