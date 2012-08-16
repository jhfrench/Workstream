
<!--Reports/pag_expense_report_input.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the input page for the expense report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfinclude template="../common_files/qry_project_code.cfm">
<cfform name="expense" action="index.cfm?fuseaction=Reports.expense_report">
	<cfinclude template="dsp_expense_input_form.cfm">
</cfform>
