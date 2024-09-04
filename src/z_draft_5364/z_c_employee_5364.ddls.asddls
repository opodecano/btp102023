@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Proyection'
@Metadata.allowExtensions: true
define root view entity Z_C_EMPLOYEE_5364
  provider contract transactional_query
  as projection on Z_I_EMPLOYEE_5364
{
      @ObjectModel.text.element: [ 'EmployeeName' ]
  key e_number       as EmployeeNumber,
      e_name         as EmployeeName,
      e_department   as EmployeeDepartment,
      status         as EmployeeStatus,
      job_title      as JobTitle,
      start_date     as StartDate,
      end_date       as EndDate,
      email          as Email,
      @ObjectModel.text.element: [ 'ManagerName' ]
      m_number       as ManagerNumber,
      m_name         as ManagerName,
      m_department   as ManagerDepartment,
      crea_date_time as CreatedOn,
      crea_uname     as CreatedBy,
      lchg_date_time as ChangedOn,
      lchg_uname     as ChangedBy
}
