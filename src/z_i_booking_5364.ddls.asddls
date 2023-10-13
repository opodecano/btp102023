@AbapCatalog.sqlViewName: 'ZVBOOK_5364'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface Booking'
define view z_i_booking_5364
  as select from zbooking_5364 as Booking
  composition [0..*] of z_i_bookingsuppl_5364 as _BookingSupplement
  association        to parent z_i_travel_5364       as _Travel on $projection.travel_id = _Travel.travel_id
  association [1..1] to /DMO/I_Customer       as _Customer      on $projection.customer_id = _Customer.CustomerID
  association [1..1] to /DMO/I_Carrier        as _Carrier       on $projection.carrier_id = _Carrier.AirlineID
  association [1..*] to /DMO/I_Connection     as _Connection    on $projection.connection_id = _Connection.ConnectionID

{
  key travel_id,
  key booking_id,
      booking_date,
      customer_id,
      carrier_id,
      connection_id,
      flight_date,
      flight_price,
      currency_code,
      booking_status,
      last_changed_at,
      _Travel,
      _BookingSupplement,
      _Customer,
      _Carrier,
      _Connection
}
