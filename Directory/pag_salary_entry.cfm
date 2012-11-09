
<!--Directory/pag_salary_entry.cfm
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
	--> attributes.user_account_id: number containing the unique identifier of the individual being requested
 --->
</cfsilent>
<cfif isdefined("attributes.submit")>
	<cfinclude template="act_salary_submit.cfm">
</cfif>
<cfinclude template="qry_get_salary_change_types.cfm">
<cfinclude template="dsp_salary_entry_form.cfm">
