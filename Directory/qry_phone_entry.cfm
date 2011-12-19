
<!--Directory/qry_phone_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I insert phone records.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	Revision 1.0  2005/02/15 20:47:15  daugherty
	Initial revision

	Revision 1.1  2002-03-08 16:40:42-05  long
	removed the listchangedelims, so that the phone numbers will pass validation when they come back out of the database for editing

	Revision 1.0  2001-10-16 17:05:55-04  french
	Initial revision

	||
	Variables:
 --->
<cfloop query="get_phone_types">
<cfif len(evaluate("attributes.phone_#phone_type_id#")) OR len(evaluate("attributes.phone_#phone_type_id#_ext"))>
<cfquery name="phone_entry" datasource="#application.datasources.main#">
INSERT INTO Phone(emp_id,phone_number<cfif len(evaluate("attributes.phone_#phone_type_id#_ext"))>,extension</cfif>,phone_type_id)
VALUES(#variables.emp_id#,'#evaluate("attributes.phone_#phone_type_id#")#'<cfif len(evaluate("attributes.phone_#phone_type_id#_ext"))>,'#evaluate("attributes.phone_#phone_type_id#_ext")#'</cfif>,#phone_type_id#)
</cfquery>
</cfif>
</cfloop><!--- 
<cfquery name="phone_delete" datasource="#application.datasources.main#">
DELETE Phone
WHERE emp_id=#variables.emp_id#
</cfquery> --->

</cfsilent>
