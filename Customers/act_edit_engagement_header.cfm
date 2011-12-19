
<!--Customers/act_edit_engagement_header.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the page that allows the edit of a currently existing engagement.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:45:27  daugherty
	Initial revision

	Revision 1.0  2002-01-24 16:23:57-05  french
	Initial file creation.

	Revision 1.1  2001-10-11 10:56:24-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->
<cfinclude template="qry_get_customer_name_code.cfm">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="engagement_list" field_name="client_code" field_value="1" fuseaction="engagements">

