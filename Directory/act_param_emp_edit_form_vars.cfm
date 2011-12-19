
<!-- directory/act_param_emp_edit_form_vars.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I 

	||
	Edits: 
	$Log$
	Revision 1.0  2005/02/15 20:46:21  daugherty
	Initial revision

	Revision 1.1  2002-03-15 16:47:59-05  long
	changed the hardcoded params to loop over the number of options comming out of the database.

	Revision 1.0  2002-02-14 09:20:54-05  long
	Created File

	||
	Variables:
	
	END FUSEDOC --->
</cfsilent>
<cfif IsNumeric(get_phone_types.recordcount)>
	<cfset loop_to_phone = get_phone_types.recordcount>
<cfelse>
	<cfset loop_to_phone = 6>
</cfif>
<cfif IsNumeric(get_email_types.recordcount)>
	<cfset loop_to_email = get_email_types.recordcount>
<cfelse>
	<cfset loop_to_email = 3>
</cfif>
<cfif IsNumeric(get_locations.recordcount)>
	<cfset loop_to_Location = get_locations.recordcount>
<cfelse>
	<cfset loop_to_Location = 2>
</cfif>
<cfparam default="" name="name">
<cfparam default="" name="lname">
<cfparam default="" name="mi"> 
<cfparam default="" name="credentials"> 
<cfparam default="" name="dob"> 
<cfparam default="" name="ssn"> 
<cfparam default="" name="pin"> 
<cfparam default="" name="photo"> 
<cfparam default="" name="biography"> 
<cfparam default="#session.workstream_company_id#" name="company_id"> 
<cfparam default="#session.workstream_company_id#" name="visable_company"> 
<cfparam default="0" name="supervisor_id"> 
<cfparam default="#DateFormat(now(),"mm/dd/yyyy")#" name="hire_date"> 
<cfparam default="" name="employee_classification"> 
<cfparam default="" name="employee_classification_id"> 
<cfparam default="0" name="manager_non_id">
<cfparam default="" name="emp_contact_type">
<cfparam default="" name="employee_type">
<cfparam default="" name="employee_type_id">
<cfparam default="0" name="workstream">
<cfloop from="1" to="#loop_to_phone#" index="ii">
	<cfparam default="" name="phone_#ii#"> 
	<cfparam default="" name="phone_#ii#_ext">
</cfloop>
<cfloop from = "1" to ="#loop_to_email#" index = "ii">
	<cfparam default="" name="email_#ii#"> 
</cfloop>
<cfloop from = "1" to = "#loop_to_location#" index = "ii">
	<cfparam default="" name="address1_#ii#"> 
	<cfparam default="" name="address2_#ii#"> 
	<cfparam default="" name="city_#ii#">
	<cfparam default="" name="state_#ii#">
	<cfparam default="" name="zip_#ii#"> 
</cfloop>