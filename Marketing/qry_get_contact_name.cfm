
<!--Marketing/qry_get_contact_name.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the marketing contact's name for the editing of their information.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->

<cfquery name="get_contact" datasource="#application.datasources.main#">
				    select name, lname
				    from emp_contact
				    where emp_id=#attributes.cfgridkey#
				</cfquery>

