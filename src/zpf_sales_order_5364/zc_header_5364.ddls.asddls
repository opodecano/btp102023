@EndUserText.label: 'Orders Projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity zc_header_5364
  provider contract transactional_query
  as projection on zi_header_5364
{
  key Id,
      Email,
      @EndUserText.label: 'First Name'
      FirstName,
      @EndUserText.label: 'Last Name'
      LastName,
      @EndUserText.label: 'Country'
      Country,
      @EndUserText.label: 'Created On'
      Createon,
      @EndUserText.label: 'Delivery Date'
      DeliveryDate,
      @EndUserText.label: 'Order Status'
      @ObjectModel.text.element: ['StatusCriticality']
      OrderStatus,
      StatusCriticality,
      @Semantics.imageUrl: true
      ImageUrl,
      /* Associations */
      _Items : redirected to composition child zc_items_5364
}
