
<!--Reports/pag_over_under_time.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the container for the undertime report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfmodule template="../common_files/act_set_all_option.cfm" business_function_id="650">
<cfinclude template="act_over_under_date_select.cfm">
<cfmodule template="../common_files/qry_get_subordinates.cfm" all_employees="#variables.all_option#" start_date="#variables.start_date#" end_date="#variables.end_date#">

<cfinclude template="dsp_over_under_time.cfm">

<cfinclude template="dsp_over_under_date_select.cfm">