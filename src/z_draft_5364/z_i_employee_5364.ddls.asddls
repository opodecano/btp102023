@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee 5364'
define root view entity Z_I_EMPLOYEE_5364
  as select from zemployee_5364 as Employee
{

      //EMPLOYEE
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
