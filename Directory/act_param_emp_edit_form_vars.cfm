
<!-- Directory/act_param_emp_edit_form_vars.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I 

	||
	Edits: 
	$Log$
	||
	Variables:

	END FUSEDOC --->
</cfsilent>
<cfif isnumeric(get_phone_types.recordcount)>
	<cfset loop_to_phone=get_phone_types.recordcount>
<cfelse>
	<cfset loop_to_phone=6>
</cfif>
<cfif isnumeric(get_email_types.recordcount)>
	<cfset loop_to_email=get_email_types.recordcount>
<cfelse>
	<cfset loop_to_email=3>
</cfif>
<cfif isnumeric(get_locations.recordcount)>
	<cfset loop_to_Location=get_locations.recordcount>
<cfelse>
	<cfset loop_to_Location=2>
</cfif>
<cfparam default="" name="first_name">
<cfparam default="" name="last_name">
<cfparam default="" name="middle_initial"> 
<cfparam default="" name="credentials"> 
<cfparam default="" name="birth_date"> 
<cfparam default="" name="uupic">
<cfparam default="" name="photo_path"> 
<cfparam default="" name="biography"> 
<cfparam default="#session.workstream_company_id#" name="company_id"> 
<cfparam default="#session.workstream_company_id#" name="visable_company"> 
<cfparam default="0" name="supervisor_id"> 
<cfparam default="#dateformat(now(),"m/d/yyyy")#" name="hire_date"> 
<cfparam default="" name="employee_classification"> 
<cfparam default="" name="employee_classification_id">
<cfparam default="" name="account_type_id">
<cfparam default="" name="employee_type">
<cfparam default="0" name="workstream">
<cfloop from="1" to="#loop_to_phone#" index="ii">
	<cfparam default="" name="phone_#ii#"> 
	<cfparam default="" name="phone_#ii#_ext">
</cfloop>
<cfloop from="1" to ="#loop_to_email#" index="ii">
	<cfparam default="" name="email_#ii#"> 
</cfloop>
<cfloop from="1" to="#loop_to_location#" index="ii">
	<cfparam default="" name="address1_#ii#"> 
	<cfparam default="" name="address2_#ii#"> 
	<cfparam default="" name="city_#ii#">
	<cfparam default="" name="state_#ii#">
	<cfparam default="" name="zip_#ii#"> 
</cfloop>