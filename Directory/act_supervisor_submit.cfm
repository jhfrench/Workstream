
<!--Directory/act_supervisor_submit.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I call the queries that are used to enter a new supervisor entry.
	||
	Name: Jeromy French
	||
	Edits:
	$Log: 

	 || 
	END FUSEDOC --->

</cfsilent>
<cfinclude template="qry_emp_supervisor_entry.cfm">
<cfinclude template="../common_files/js_reload_and_close.cfm">
