
<!--Customers/pag_inactive_tasks.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_get_tasks_to_inactive.cfm">
<cfinclude template="dsp_inactive_tasks.cfm">
