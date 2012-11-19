<!-- Administration/dsp_view_user_activity.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_view_user_activity.cfm">
	<responsibilities>
		Help the user maintain navigation access.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/19/2010" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 7/19/10) Adding ability to view user's activity.

			(JF | 9/29/10) Adding ability to see user's known login attempts.
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

<cfoutput>
<ul class="breadcrumb">
  <li><a href="index.cfm?fuseaction=Administration.manage_user_access">Manage User Access</a> <span class="divider">/</span></li>
  <li>View User Activity <span class="divider">/</span></li>
  <li class="active">#get_user_information.first_name# #get_user_information.last_name#</li>
</ul>
<a href="javascript:edit_navigation_access(#attributes.user_account_id#);" class="btn">Manage User's Access</a>
<a href="javascript:administer_user_menu('#attributes.user_account_id#');" class="btn">Manage User's Profile</a><br />

<cfform name="#attributes.fuseaction#" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="form-horizontal">
	<fieldset>
		<legend><h3>Activity Criteria</h3></legend>
		<div class="control-group">
			<label class="control-label" for="start_date">Start Date</label>
			<div class="controls">
				<input type="date" name="start_date" id="start_date" value="#dateformat(attributes.start_date,'yyyy-mm-dd')#" min="#dateformat(application.application_specific_settings.workstream_start_date, 'yyyy-mm-dd')#" maxlength="10" required="required" class="span3 date" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="end_date">End Date</label>
			<div class="controls">
				<input type="date" name="end_date" id="end_date" value="#dateformat(attributes.end_date,'yyyy-mm-dd')#" min="#dateformat(application.application_specific_settings.workstream_start_date, 'yyyy-mm-dd')#" max="#dateformat(dateadd('d', 1, now()),'yyyy-mm-dd')#" maxlength="10" required="required" class="span3 date" />
			</div>
		</div>
		<div class="form-actions">
			<input type="hidden" name="user_account_id" value="#attributes.user_account_id#" />
			<input type="submit" name="method" value="Update Data" class="btn btn-primary" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</div>
	</fieldset>
</cfform>

<div class="row-fluid">
	<div class="span6">
		<!---display known login attempts--->
		<table id="manage_user_profiles_table" class="table table-striped table-bordered table-condensed" summary="I show the user's last 100 known login attempts.">
			<caption><h3>User's last 100 known login attempts<cfif isdate(attributes.start_date) AND isdate(attributes.end_date)> between #dateformat(attributes.start_date, "m/d/yyyy")# and #dateformat(attributes.end_date, "m/d/yyyy")#</cfif></h3></caption>
			<thead>
				<tr>
					<th>Date/Time of Attempt</th>
					<th>Attempt Result</th>
					<th>Account Status</th>
				</tr>
			</thead>
			<tbody>
			<cfloop query="get_user_login_attempts" startrow="1" endrow="100">
				<tr>
					<td scope="row">#created_date#</td>
					<td>#success_status#</td>
					<td>#account_status#</td>
				</tr>
			</cfloop>
			</tbody>
		</table>
	</div>
	<div class="span6">
		<!---display favorite pages (other than log-in and log-out)--->
		<table id="manage_user_profiles_table" class="table table-striped table-bordered table-condensed" summary="I show the user's top 10 pages (other than login and logout).">
			<caption><h3 style="margin:0px">User's 10 favorite pages</h3></caption>
			<thead>
				<tr>
					<th>url_requested</th>
					<th>count</th>
				</tr>
			</thead>
			<tbody>
			<cfloop query="get_favorite_pages" startrow="1" endrow="10">
				<tr>
					<td scope="row">#url_requested#</td>
					<td>#count1#</td>
				</tr>
			</cfloop>
			</tbody>
		</table>
	</div>
</div>
		
<div class="row-fluid">
	<div class="span6">
		<!---display favorite hours--->
		<table id="manage_user_profiles_table" class="table table-striped table-bordered table-condensed" summary="I show the user's most active hours.">
			<caption><h3 style="margin:0px">User's most active hours</h3></caption>
			<thead>
				<tr>
					<th>request hour</th>
					<th>count</th>
				</tr>
			</thead>
			<tbody>
			<cfloop query="get_favorite_hours" startrow="1" endrow="10">
				<tr>
					<td scope="row">#request_hour#</td>
					<td>#count1#</td>
				</tr>
			</cfloop>
			</tbody>
		</table>
	</div>
	<div class="span6">
		<!---display count trend by week--->
		<table id="manage_user_profiles_table" class="table table-striped table-bordered table-condensed" summary="I show the user's top 10 pages (other than login and logout).">
			<caption><h3 style="margin:0px">Week trend of activity</h3></caption>
			<thead>
				<tr>
					<th>week</th>
					<th>count</th>
				</tr>
			</thead>
			<tbody>
			<cfloop query="get_week_trend">
				<tr>
					<td scope="row">#date_year# #date_week#</td>
					<td>#count1#</td>
				</tr>
			</cfloop>
			</tbody>
		</table>
	</div>
</div>

<div class="row-fluid">
	<div class="span6">
		<!---display probable error incidents--->
		<table id="manage_user_profiles_table" class="table table-striped table-bordered table-condensed" summary="I show the user's most recent page requests that probably resulted in errors.">
			<caption><h3 style="margin:0px">Probable errors</h3></caption>
			<thead>
				<tr>
					<th>page_request_id</th>
					<th>url_requested</th>
					<th>request_date</th>
				</tr>
			</thead>
			<tbody>
			<cfloop query="get_probable_errors">
				<tr>
					<td scope="row">#page_request_id#</td>
					<td>#url_requested#</td>
					<td>#dateformat(request_date, "m/d/yyyy")#&nbsp;#request_time#</td>
				</tr>
			</cfloop>
			</tbody>
		</table>
	</div>
	<div class="span6">
		<!---display table of all data--->
		<table id="manage_user_profiles_table" class="table table-striped table-bordered table-condensed" summary="I show user activity for the specified dates (or last 60 days if no dates are specified)">
			<caption><h3 style="margin:0px">All page requests</h3></caption>
			<thead>
				<tr>
					<th>page_request_id</th>
					<th>url_requested</th>
					<th>page_load_time</th>
					<th>request_date</th>
				</tr>
			</thead>
			<tbody>
			<cfloop query="get_view_user_activity">
				<tr>
					<td scope="row">#page_request_id#</td>
					<td>#url_requested#</td>
					<td>#page_load_time#</td>
					<td>#dateformat(request_date, "m/d/yyyy")#&nbsp;#request_time#</td>
				</tr>
			</cfloop>
			</tbody>
		</table>
	</div>
</div>
</cfoutput>