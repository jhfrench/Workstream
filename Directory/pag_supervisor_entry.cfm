
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
	--> attributes.emp_id: number containing the unique identifier of the individual being requested
 --->
<cfset variables.bgcolor="##78A0EB">
<cfset attributes.emp_id=attributes.emp_id>
<cfset need_all_supervisors=1>
</cfsilent>
<cfinclude template="qry_get_supervisor_history.cfm">
<cfinclude template="qry_get_present_supervisor.cfm">

<cfform action="act_supervisor_submit.cfm" name="benefits" method="POST">
<table border="0" cellpadding="1" cellspacing="0" width="100%" class="SelectText">
	<cfinclude template="dsp_supervisor_entry_header.cfm">
	<cfinclude template="dsp_supervisor_entry_form.cfm">
</table>
</cfform>

