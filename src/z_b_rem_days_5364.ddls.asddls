@AbapCatalog.sqlViewName: 'ZV_REM_DAYS_5364'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Remaining Days'
define view z_b_rem_days_5364
  as select from zrent_cars_5364
{
  key matricula                                                                as Matricula,
      marca                                                                    as Marca,
      case
      when alq_hasta <> '' and alq_hasta > $session.system_date
      then dats_days_between( cast( $session.system_date as abap.dats ), alq_hasta) end as Dias
      
}
