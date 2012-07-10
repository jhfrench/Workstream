
<!--Reports/act_pto_name_select.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I run the queries that show PTO-elligible employees in the drop-down selection.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_get_subordinates.cfm">
<cfinclude template="qry_get_all_option.cfm">
<cfinclude template="qry_get_pto_names.cfm">