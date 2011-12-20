
<!--Directory/pag_salary_entry.cfm
	Author: Damon S -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the benefits entry form.
	||
	Name: Damon Scott
	||
	Edits: 
	
	||
	Variables:
	--> attributes.emp_id: number containing the unique identifier of the individual being requested
 --->
<cfset variables.bgcolor="##78A0EB"><!--- 
<cfset attributes.emp_id = url.emp_id> --->
</cfsilent>
<cfform action="act_salary_submit.cfm" name="benefits" method="POST">
<table align="center" border="0" cellpadding="1" cellspacing="0" width="100%" class="SelectText">
	<cfinclude template="qry_get_salary_change_types.cfm">
	<cfinclude template="dsp_salary_entry_header.cfm">
	<cfinclude template="dsp_salary_entry_form.cfm">
</table>
</cfform>

