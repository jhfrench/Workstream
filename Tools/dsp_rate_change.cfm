
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
	<cfset variables.project_id=0>
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
		<tr<cfif rateless_count> class="error"</cfif>>
			<td scope="row">
				#description#
				<cfif get_billing_rate.project_id NEQ variables.project_id>
					<cfset variables.project_id=get_billing_rate.project_id>
					<button type="button" class="btn btn-small btn-info" title="Project Details" data-toggle="popover" data-placement="right" data-html="true" data-original-title="<h3>Project Details</h3>" data-content="<dl class='dl-horizontal'><dt>Project Manager</dt><dd>#pm_last_name#, #pm_first_name#</dd><dt>Project Start</dt><dd>#dateformat(project_start, 'm/d/yyyy')#</dd><dt>Project End</dt><dd>#dateformat(project_end, 'm/d/yyyy')#</dd></dl><a href='javascript:edit_project(#variables.project_id#)' class='btn btn-small'>edit</a>"><i class="icon-briefcase"></i></button>
				</cfif>
			</td>
			<td scope="row">#last_name#, #first_name#</td>
			<td class="number">
				<input type="hidden" name="combination_key" value="#project_id#_#user_account_id#_#billing_rate_id#" />
			<cfif billed_entry_count>
				<cfset variables.required_text=' required="required"'>
				$#rate#
				<input type="hidden" name="rate_#project_id#_#user_account_id#_#billing_rate_id#" value="#rate#" />
			</td>
			<td class="date">
				#dateformat(rate_start_date, 'm/d/yyyy')#
				<input type="hidden" name="rate_start_date_#project_id#_#user_account_id#_#billing_rate_id#" value="#dateformat(rate_start_date, 'yyyy-mm-dd')#" />
			<cfelse>
				<cfset variables.required_text="">
				<div class="input-prepend">
					<span class="add-on">$</span>
					<input type="number" name="rate_#project_id#_#user_account_id#_#billing_rate_id#" id="rate_#project_id#_#user_account_id#_#billing_rate_id#" step="0.25" min="0" value="#rate#" class="span8 number" />
				</div>
			</td>
			<td class="date">
				<input type="date" name="rate_start_date_#project_id#_#user_account_id#_#billing_rate_id#" id="rate_start_date_#project_id#_#user_account_id#_#billing_rate_id#" min="#dateformat(project_start, 'yyyy-mm-dd')#" max="#dateformat(max_rate_start_date, 'yyyy-mm-dd')#" value="#dateformat(rate_start_date, 'yyyy-mm-dd')#" maxlength="10" class="span8 date" />
			</cfif>
			</td>
			<td class="date">
				<input type="date" name="rate_end_date_#project_id#_#user_account_id#_#billing_rate_id#" id="rate_end_date_#project_id#_#user_account_id#_#billing_rate_id#" min="#dateformat(min_rate_end_date, 'yyyy-mm-dd')#" max="#dateformat(project_end, 'yyyy-mm-dd')#" value="#dateformat(rate_end_date, 'yyyy-mm-dd')#" maxlength="10" #variables.required_text#class="span8 date" />
			</td>
			<td class="number">#billed_entry_count#</td>
		</tr>
	<cfif billing_rate_id AND rateless_count>
		<!--- if we have time entries uncovered by a Billing Rate, for a person/project otherwise covered by a billing rate, provide this blank-entry form --->
		<tr class="error">
			<td scope="row">#description#</td>
			<td scope="row">#last_name#, #first_name#</td>
			<td class="number">
				<input type="hidden" name="combination_key" value="#project_id#_#user_account_id#_0" />
				<div class="input-prepend">
					<span class="add-on">$</span>
					<input type="number" name="rate_#project_id#_#user_account_id#_0" id="rate_#project_id#_#user_account_id#_0" step="0.25" min="0" value="" class="span8 number" />
				</div>
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

<script type="text/javascript">
	//if any rates are populated, require start and end dates for that row
	var determine_dates_required=function(changed_field) {
		if ($(changed_field).val().length===0) {
			$(changed_field).parents('tr').find('input[type="date"]').removeAttr('required');
		}
		else {
			$(changed_field).parents('tr').find('input[type="date"]').attr('required','required');
		}

	};
	$('#form_rate_change').find('input[type="number"]').change( function(){
		determine_dates_required(this);
	} );

	//instantiate Bootstrap popovers
	$('button[data-toggle="popover"]').popover();
</script>