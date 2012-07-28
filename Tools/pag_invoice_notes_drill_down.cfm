
<!--Tools/pag_invoice_notes_drill_down.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the invoice tool invoice list.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	END FUSEDOC --->
<cfset attributes.emp_id=ListFirst(attributes.emp_id_project,"|")>
<cfset attributes.project_id=listlast(attributes.emp_id_project,"|")>
<cfparam name="attributes.month" default="#month(now())#">
<cfparam name="attributes.year" default="#year(now())#">
</cfsilent>
<cfinclude template="qry_get_emp_name.cfm">
<cfinclude template="qry_invoice_notes_drill_down.cfm">
<table class="table table-striped table-bordered table-condensed span8">
	<caption><h3>Work Notes for <cfoutput>#get_emp_name.name#</cfoutput></h3></caption>
	<thead>
	<cfinclude template="dsp_invoice_notes_drill_down_header.cfm">
	</thead>
	<tfoot>
		<tr>
			<td colspan="4">
				Total Hours: <cfoutput>#get_invoice_notes_drill_down_total.hours#</cfoutput>
			</td>
		</tr>
	</tfoot>
	<tbody>
	<cfinclude template="dsp_invoice_notes_drill_down.cfm">
	</tbody>
</table>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="note_to_task" field_name="task_id" fuseaction="Timekeeping.task_details">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="time_entry_edit" field_name="time_entry_id" fuseaction="Timekeeping.time_entry_edit">