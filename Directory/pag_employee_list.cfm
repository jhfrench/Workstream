
<!--Directory/pag_employee_list.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the main employee directory page.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfset variables.list1="(,), ,-,x,.">
<cfset variables.list2=",,,,,">
</cfsilent>
<cfinclude template="qry_get_employee_list.cfm">
<cfinclude template="dsp_employee_list.cfm">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_employee" field_name="user_account_id" fuseaction="Directory.employee_details">
