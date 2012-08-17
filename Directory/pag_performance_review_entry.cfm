
<!--Directory/pag_performance_review_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the performance review entry form.
	||
	Name: Jeromy French
	||
	Edits: 

	||
	Variables:
	--> attributes.emp_id: number containing the unique identifier of the individual being requested
 --->
<cfset variables.bgcolor="##78A0EB"><!--- 
<cfset attributes.emp_id=url.emp_id> --->
</cfsilent>
<cfform action="act_performance_review_submit.cfm" name="benefits" method="POST">
<table align="center" border="0" cellpadding="1" cellspacing="0" width="100%" class="SelectText">
	<!--- <cfinclude template="../common_files/dsp_team_select.cfm"> --->
	<cfinclude template="qry_get_review_types.cfm">
	<cfinclude template="dsp_performance_review_entry_header.cfm">
	<cfinclude template="dsp_performance_review_entry_form.cfm">

</table>
</cfform>

