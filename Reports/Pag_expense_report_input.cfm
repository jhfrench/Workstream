
<!--Reports/pag_expense_report_input.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the input page for the expense report.

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:11:06  stetzer
<>

Revision 1.1  2001-10-11 11:04:16-04  long
added $log $ for edits.  To all CFM files that have fusedocs.
	||
	END FUSEDOC --->
</cfsilent>
<cfinclude template="../common_files/qry_project_code.cfm">
<cfform name="expense" action="index.cfm?fuseaction=Reports.expense_report">
	<cfinclude template="dsp_expense_input_form.cfm">
</cfform>
