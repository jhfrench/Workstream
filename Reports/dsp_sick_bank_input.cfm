
<!--Reports/dsp_sick_bank_input.cfm
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
</cfsilent>
<cfform name="sick_bank" action="index.cfm?fuseaction=Reports.sick_bank" method="POST" class="form-horizontal">
<fieldset>
	<legend>Sick Bank Report</legend>
	<cfinclude template="dsp_pto_report_input.cfm">
</fieldset>
</cfform>