<!-- Administration/dsp_edit_ref_date.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_ref_date.cfm">
	<responsibilities>
		I display the form for editing certification type and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="10/4/10" role="FuseCoder" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>

		</in>
		<passthrough>

		</passthrough>
		<out>

		</out>
	</IO>
</fusedoc>
--->

<cfmodule template="../common_files/qry_get_program_year.cfm" exclude_future_years_ind="0" program_year_id="0">
<cfoutput>
<form name="edit_ref_date_form" action="index.cfm?fuseaction=#fuseaction#" method="post">
	<label for="odbc_date">Date</label><br/>
	<input type="text" name="odbc_date" id="odbc_date" value="" /><br />
	<input name="method" type="submit" value="Retrieve and edit date record" />
</form>
<cfform name="ref_date_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">

<br />
<div class="datachart" style="border:1px solid ##999999" title="table head describes the data held in the table within this table">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="Table displays CCR certification type information">
	<tr bgcolor="##cccccc"><th><cfif attributes.date_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> Date</th></tr>
	<tr bgcolor="##eeeeee">
		<td><cfif attributes.date_id NEQ 0>
		<table width="100%" cellspacing="0" cellpadding="0" border="0" summary="table displays CCR certification type information">
			<tr>
				<th scope="col">Date</th>
				<th scope="col">Day of Week</th>
				<th scope="col">Weekend</th>
				<th scope="col">Year</th>
				<th scope="col">Month</th>
				<th scope="col">Day</th>
			</tr>
			<tr>
				<td scope="row" align="center">#attributes.odbc_date#</td>
				<td align="right">#attributes.day_of_week_number#</td>
				<td align="right">#attributes.weekend_ind#</td>
				<td align="right">#attributes.date_year#</td>
				<td align="right">#attributes.date_month#</td>
				<td align="right">#attributes.date_day#</td>
			</tr>
		</table></cfif>
		<table width="100%" cellspacing="0" cellpadding="0" border="0" summary="table displays CCR certification type information">
		<cfif attributes.date_id EQ 0>
			<tr>
				<th><label for="odbc_date">Date</label>: </th>
				<td><cfinput type="datefield" name="odbc_date" id="odbc_date" value="" required="yes" message="Please specify a new date." />
				</td>
			</tr>
		<cfelse>
			<input type="hidden" name="odbc_date" value="#attributes.odbc_date#" />
		</cfif>
			<tr>
				<th scope="row">Holiday:</th>
				<td>
					<cfif attributes.holiday_ind EQ 1>
						<cfset variables.check_holiday_ind_1="yes">
						<cfset variables.check_holiday_ind_0="no">
					<cfelse>
						<cfset variables.check_holiday_ind_1="no">
						<cfset variables.check_holiday_ind_0="yes">
					</cfif>
					<cfinput type="radio" name="holiday_ind" id="holiday_ind_1" value="1" checked="#variables.check_holiday_ind_1#"><label for="holiday_ind_1">Yes</label>
					<cfinput type="radio" name="holiday_ind" id="holiday_ind_0" value="0" checked="#variables.check_holiday_ind_0#"><label for="holiday_ind_0">No</label>
				</td>
			</tr>
			<tr>
				<th><label for="fiscal_year">Fiscal Year</label>: </th>
				<td><cfinput type="text" name="fiscal_year" id="fiscal_year" value="#attributes.fiscal_year#" size="3" maxlength="4" required="yes" validate="integer" message="Please enter a fiscal year.">
				</td>
			</tr>
			<cfif get_program_year.recordcount EQ 1>
			<input type="hidden" name="program_year_id" value="#get_program_year.program_year_id#" />
			<cfelse>
			<tr>
				<th scope="row"><label for="program_year_id">Program Year</label>:</th>
				<td>
					<cfselect name="program_year_id" id="program_year_id" query="get_program_year" value="program_year_id" display="description" selected="#attributes.program_year_id#" required="yes" message="Please specify a program year." />
				</td>
			</tr>
			</cfif>
		</table>
		</td>
	</tr>
	<tr bgcolor="##dddddd">
		<td align="center">
			<input type="hidden" name="created_by" value="#session.user_account_id#" />
			<input type="hidden" name="date_id" value="#attributes.date_id#" />
			<input type="submit" name="method" value="Submit" />
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>
