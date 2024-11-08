@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity zi_header_5364
  as select from ztb_header_5364 as Header
  composition [0..*] of zi_items_5364 as _Items
{
  key    id           as Id,
         email        as Email,
         firstname    as FirstName,
         lastname     as LastName,
         country      as Country,
         createon     as Createon,
         deliverydate as DeliveryDate,
         orderstatus  as OrderStatus,
         case orderstatus
           when 3 then 'Open'
           when 2 then 'Accepted'
           when 1 then 'Canceled'
                     else ''
         end          as StatusCriticality,
         imageurl     as ImageUrl,
         _Items
}
