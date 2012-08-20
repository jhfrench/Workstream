
<!--Directory/qry_get_emp_phone.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve employees based on the needs of the user.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	--> attributes.emp_id: number containing the unique identifier of the individual being requested
	<-- extension: string containing any extension for a phone number
	<-- phone_number: string containing the phone number
	<-- phone_type: string containing the type of phone number
 --->
<cfquery name="get_emp_phone" datasource="#application.datasources.main#">
SELECT REF_Phone_Type.phone_type, Phone.phone_number, Phone.extension
FROM Phone, REF_Phone_Type
WHERE Phone.phone_type_id=REF_Phone_Type.phone_type_id
	AND Phone.emp_id=#attributes.emp_id#
ORDER BY REF_Phone_Type.phone_type DESC
</cfquery>
</cfsilent>

