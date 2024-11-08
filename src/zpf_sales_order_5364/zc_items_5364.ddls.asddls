@EndUserText.label: 'Items Projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity zc_items_5364
  as projection on zi_items_5364
{
  key Id,
  key OrderId,
      Name,
      Description,
      @EndUserText.label: 'Release'
      ReleaseDate,
      @EndUserText.label: 'Discontinued'
      DiscontinuedDate,
      Price,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      Height,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      Width,
      Depth,
      Quantity,
      @EndUserText.label: 'Unit'
      UnitOfMeasure,
      //      /* Associations */
      _Orders : redirected to parent zc_header_5364
}
