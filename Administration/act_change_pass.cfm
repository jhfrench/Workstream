
<!--Admin/act_change_pass.cfm
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
Revision 1.1  2006/09/15 22:23:45  csy
<>

Revision 1.0  2006-08-16 09:31:55-04  csy
Initial revision

Revision 1.0  2005-02-15 15:27:16-05  daugherty
Initial revision

Revision 1.2  2001-11-15 10:13:01-05  long
Changed the isolation level from Serializable to read_committed

Revision 1.1  2001-10-11 10:55:41-04  long
Added $log $ for edits to all CFM files that have fusedocs.

 
	||
 --->
<cftransaction isolation="READ_COMMITTED">
<cfquery name="set_password" datasource="#application.datasources.main#">
UPDATE Security
SET last_updated=#createodbcdatetime(now())#, password='#attributes.new_pass#'
WHERE emp_id=#session.user_account_id#
</cfquery>
</cftransaction>

