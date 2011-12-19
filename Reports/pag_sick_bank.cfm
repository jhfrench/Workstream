
<!--Reports/pag_sick_bank.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the container for the Sick Bank report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:12:25  stetzer
	<>

	||
	END FUSEDOC --->
<cfparam name="attributes.emp_id" default="">
<cfif isdefined("attributes.form_pin")>
	<cfset attributes.emp_id=attributes.form_pin>
</cfif>
</cfsilent>

<!--- Check to see if user has access to 'All' --->
<cfmodule template="act_set_all_option.cfm" emp_id="#session.user_account_id#" object_id="84">
<cfinclude template="qry_get_subordinates.cfm">
<cfinclude template="qry_get_pto_names.cfm">

<!--- If employees haven't been specified, show select list --->
<cfif NOT len(attributes.emp_id)>
	<cfinclude template="dsp_sick_bank_input.cfm">
<!--- If attributes.emp_id is known, show user sick bank for those emp_ids --->
<cfelse>
	<cfinclude template="qry_get_sick_bank.cfm">
	<cfinclude template="dsp_sick_bank_output.cfm">
</cfif>
