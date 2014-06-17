
<!--Customers/pag_new_customer.cfm
	Author: Jeromy F -->
	<cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I show the form for adding a new customer.
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
	</cfsilent>

<cfif isdefined("attributes.description")>
	<cfinclude template="act_add_customer.cfm">
	<cfoutput>
	<div class="alert alert-success">
		You have added #attributes.description#.<cfif isdefined("attributes.create_user_account_ind")> You also created a #application.product_name# account for #variables.user_name#. You may <a href='javascript:edit_navigation_access(#insert_user_account.user_account_id#);'>edit this user's access</a> now, or in the future by clicking on the Administration &gt; Manage Users &gt; Manage User Access navigation link. <strong>No password has been created for the new user yet, so they have not been notified of their account.</strong></cfif>
	</div>
	</cfoutput>
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_navigation_access" fuseaction="Administration.edit_navigation_access" field_name="user_account_id" process_form_ind="1" program_year_id="1" method="Select">
<cfelse>
	<cfmodule template="../common_files/qry_get_ref_company.cfm" company_id="#session.workstream_selected_company_id#">
	<cfinclude template="../common_files/qry_get_states.cfm">
	<cfinclude template="dsp_new_customer.cfm">
</cfif>