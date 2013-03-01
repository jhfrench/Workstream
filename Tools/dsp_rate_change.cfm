
<!--Tools/dsp_rate_change.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the insert customer rate grid in teh tools module.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfform id="form_rate_change" action="index.cfm?fuseaction=Tools.rate_change">
<table class="table table-striped table-bordered table-condensed">
	<caption>
		<h1>Employee Billing Rates</h1>
	</caption>
	<thead>
		<tr>
			<th>Project</th>
			<th>Employee</th>
			<th>Billing Rate</th>
			<th>Rate Start</th>
			<th>Rate End</th>
			<th>Time Entries</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_billing_rate">
		<tr>
			<td scope="row">#description# <i class="icon-briefcase" title="Project Manager: #pm_last_name#, #pm_first_name#"></i></td>
			<td scope="row">#last_name#, #first_name#</td>
			<td class="number">
				<input type="number" name="rate_#project_id#_#user_account_id#_#billing_rate_id#" id="rate_#project_id#_#user_account_id#_#billing_rate_id#" step="0.25" min="0" class="span5" />
			</td>
			<td class="date">
				<input type="date" name="rate_start_date_#project_id#_#user_account_id#_#billing_rate_id#" id="rate_start_date_#project_id#_#user_account_id#_#billing_rate_id#" min="#dateformat(project_start, 'yyyy-mm-dd')#" max="#dateformat(dateadd('d',-1,project_end), 'yyyy-mm-dd')#" value="#dateformat(rate_start_date, 'yyyy-mm-dd')#" maxlength="10" class="span5 date" />
			</td>
			<td class="date">
				<input type="date" name="rate_end_date_#project_id#_#user_account_id#_#billing_rate_id#" id="rate_end_date_#project_id#_#user_account_id#_#billing_rate_id#" min="#dateformat(dateadd('d',1,project_start), 'yyyy-mm-dd')#" max="#dateformat(project_end, 'yyyy-mm-dd')#" value="#dateformat(rate_end_date, 'yyyy-mm-dd')#" maxlength="10" class="span5 date" />
			</td>
			<td class="number">#entry_count#</td>
		</tr>
	</cfoutput>
	</tbody>
</table>
<input type="submit" name="Submit" value="Update Billing Rates" class="btn btn-danger" />