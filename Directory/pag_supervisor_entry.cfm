
<!--Directory/pag_supervisor_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the supervisor entry form.
	||
	Name: Jeromy French
	||
	Edits: 

	||
	Variables:
	--> attributes.user_account_id: number containing the unique identifier of the individual being requested
 --->
</cfsilent>
<cfinclude template="qry_get_supervisor_history.cfm">
<cfinclude template="qry_get_present_supervisor.cfm">
<cfinclude template="dsp_supervisor_entry_form.cfm">