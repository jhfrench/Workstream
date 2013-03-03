
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
	<cfif billed_entry_count>
		<cfset variables.required_text=' required="required"'>
		<cfset variables.enforced_end=last_billed_time_entry_date>
	<cfelse>
		<cfset variables.required_text="">
		<cfset variables.enforced_end=project_end>
	</cfif>
		<tr<cfif billed_entry_count AND NOT len(rate)> class="error"</cfif>>
			<td scope="row">#description# <i class="icon-briefcase" title="Project Manager: #pm_last_name#, #pm_first_name#"></i></td>
			<td scope="row">#last_name#, #first_name#</td>
			<td class="number">
				#rate#
			</td>
			<td class="date">
				#dateformat(rate_start_date, 'm/d/yyyy')#
			</td>
			<td class="date">
				<input type="hidden" name="combination_key" value="#project_id#_#user_account_id#_#billing_rate_id#" />
				<input type="date" name="rate_end_date_#project_id#_#user_account_id#_#billing_rate_id#" id="rate_end_date_#project_id#_#user_account_id#_#billing_rate_id#" min="#dateformat(dateadd('d',1,project_start), 'yyyy-mm-dd')#" max="#dateformat(variables.enforced_end, 'yyyy-mm-dd')#" value="#dateformat(rate_end_date, 'yyyy-mm-dd')#" maxlength="10" #variables.required_text#class="span8 date" />
			</td>
			<td class="number">#billed_entry_count#</td>
		</tr>
	<cfif billing_rate_id AND rateless_count>
		<!--- if we have time entries uncovered by a Billing Rate, for a person/project otherwise covered by a billing rate, provide this blank-entry form --->
		<tr>
			<td scope="row">#description# <i class="icon-briefcase" title="Project Manager: #pm_last_name#, #pm_first_name#"></i></td>
			<td scope="row">#last_name#, #first_name#</td>
			<td class="number">
				<input type="hidden" name="combination_key" value="#project_id#_#user_account_id#_0" />
				<input type="number" name="rate_#project_id#_#user_account_id#_0" id="rate_#project_id#_#user_account_id#_0" step="0.25" min="0" value="" class="span8 number" />
			</td>
			<td class="date">
				<input type="date" name="rate_start_date_#project_id#_#user_account_id#_0" id="rate_start_date_#project_id#_#user_account_id#_0" min="#dateformat(project_start, 'yyyy-mm-dd')#" max="#dateformat(dateadd('d',-1,project_end), 'yyyy-mm-dd')#" value="" maxlength="10" class="span8 date" />
			</td>
			<td class="date">
				<input type="date" name="rate_end_date_#project_id#_#user_account_id#_0" id="rate_end_date_#project_id#_#user_account_id#_0" min="#dateformat(dateadd('d',1,project_start), 'yyyy-mm-dd')#" max="#dateformat(project_end, 'yyyy-mm-dd')#" value="" maxlength="10" class="span8 date" />
			</td>
			<td class="number">#rateless_count#</td>
		</tr>
	</cfif>
	</cfoutput>
	</tbody>
</table>
<input type="submit" name="Submit" value="Update Billing Rates" class="btn btn-danger" />
</cfform>