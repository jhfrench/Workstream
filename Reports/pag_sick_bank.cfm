
<!--Reports/pag_sick_bank.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the container for the Sick Bank report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
<cfparam name="attributes.user_account_id" default="">
</cfsilent>

<!--- $issue$: do we still need act_set_all_option.cfm?
Check to see if user has access to 'All'
<cfmodule template="../common_files/act_set_all_option.cfm" business_function_id="655"> --->
<cfinclude template="../common_files/qry_get_subordinates.cfm">
<cfinclude template="qry_get_pto_names.cfm">

<!--- If employees haven't been specified, show select list --->
<cfif NOT len(attributes.user_account_id)>
	<cfinclude template="dsp_sick_bank_input.cfm">
<!--- If attributes.user_account_id is known, show user sick bank for those user_account_ids --->
<cfelse>
	<cfinclude template="qry_get_sick_bank.cfm">
	<cfinclude template="dsp_sick_bank_output.cfm">
</cfif>
