@AbapCatalog.sqlViewName: 'ZV_DET_CUSTL_365'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Details customer'
@Metadata.allowExtensions: true
define view z_b_det_customer_5364 as select from zrent_cust_5364
{
    key doc_id as ID,
    key matricula as Matricula,
    nombres as Nombres,
    apellidos as Apellidos,
    email as Correo,
    cntr_type as TipoContrato
}
