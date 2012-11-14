
<!--Directory/dsp_emp_position_number.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the an employee's position number.
	||
	Name: Jeromy French
	||
	Edits:
	 || 
	END FUSEDOC --->
<cfinclude template="qry_get_position_number_history.cfm">
</cfsilent>
<cfoutput>
<h4>Position Numbers <a href="javascript:position_number_change(#attributes.user_account_id#);" class="btn btn-mini">ADD</a></h4>
</cfoutput>
<table class="table table-striped table-bordered table-condensed">
	<thead>
		<tr>
			<th>Position Number</th>
			<th>Date Started</th>
			<th>Date Ended</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_emp_position_number_history">
		<tr>
			<th scope="row" class="number">
				#employment_position_id#<br />
			</th>
			<td class="date">
				#dateformat(effective_start_date,'m/d/yyyy')#
			</td>
			<td class="date">
				#dateformat(effective_end_date,'m/d/yyyy')#
			</td>
	</cfoutput>
	</tbody>
</table>