
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
Revision 1.1  2005/03/09 18:03:57  stetzer
<>

	||
	END FUSEDOC --->
<cfinclude template="qry_get_subordinates.cfm">
<cfinclude template="qry_get_all_option.cfm">
<cfinclude template="qry_get_pto_names.cfm">