@AbapCatalog.sqlViewName: 'ZV_BRANDSL_5364'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Brands'
define view z_b_brands_5364 as select from zrent_brands_364
{
   key marca as Marca,
   @UI.hidden: true
   url as Imagen 
}
