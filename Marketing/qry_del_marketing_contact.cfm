
<!--Marketing/qry_del_marketing_contact.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that removes the associaton between a person and a marketing code.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:51:12  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:45-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->

<cfquery name="del_marketing_contact" datasource="#application.datasources.main#">
    delete from marketing_emp
    where emp_id = #attributes.emp_id#
</cfquery>
