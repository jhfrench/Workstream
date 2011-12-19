
<!--Admin/qry_delete_profile.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream task list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2006/09/15 22:26:07  csy
<>

Revision 1.0  2006-08-16 09:32:10-04  csy
Initial revision

Revision 1.0  2005-02-15 15:27:38-05  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:31-04  long
Added $log $ for edits to all CFM files that have fusedocs.

 
	||
 --->
<cfquery name="delete_profile" datasource="#application.datasources.main#">
	DELETE User_Profile
	WHERE emp_id = #session.user_account_id# 
		AND profile_name='#attributes.profile_name#'
</cfquery>
</cfsilent>

