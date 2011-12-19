
<!--Marketing/qry_get_contact_name.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the marketing contact's name for the editing of their information.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:51:14  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:44-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->

<cfquery name="get_contact" datasource="#application.datasources.main#">
				    select name, lname
				    from emp_contact
				    where emp_id = #attributes.cfgridkey#
				</cfquery>

