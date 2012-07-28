
<!--Directory/pag_job_title_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the job title entry form.
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
<cfform action="act_job_title_submit.cfm" name="benefits" method="POST">
<table align="center" border="0" cellpadding="1" cellspacing="0" width="100%" class="SelectText">

	<cfinclude template="dsp_job_title_header.cfm">
	<cfinclude template="dsp_job_title_entry_form.cfm">

</table>
</cfform>

