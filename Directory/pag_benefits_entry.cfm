
<!--Directory/pag_benefits_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the benefits entry form.
	||
	Name: Jeromy French
	||
	Edits: 

	||
	Variables:
	--> attributes.emp_id: number containing the unique identifier of the individual being requested
 --->
<cfset variables.bgcolor="##78A0EB"><!--- 
<cfset attributes.emp_id = url.emp_id> --->
</cfsilent>
<cfinclude template="qry_get_benefit_types.cfm">
<cfform action="act_benefits_submit.cfm" name="benefits" method="POST">
<table align="center" border="0" cellpadding="1" cellspacing="0" width="100%">
	<cfinclude template="dsp_benefits_entry_header.cfm">
	<cfinclude template="dsp_benefits_entry_form.cfm">
</table>
</cfform>

