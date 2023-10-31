@AbapCatalog.sqlViewName: 'ZV_HCM_5364'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'HCM - Master'
define root view z_i_hcm_master_5364
  as select from zhcm_master_5364
{
  key e_number,
      e_name,
      e_department,
      status,
      job_title,
      start_date,
      end_date,
      email,
      m_number,
      m_name,
      m_department,
      @Semantics.systemDateTime.createdAt: true
      crea_date_time,
      @Semantics.user.createdBy: true
      crea_uname,
      @Semantics.systemDateTime.lastChangedAt: true
      lchg_date_time,
      @Semantics.user.lastChangedBy: true
      lchg_uname
}
