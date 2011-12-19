<!-- Administration/dsp_view_user_activity.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_view_user_activity.cfm">
	<responsibilities>
		Help the user maintain navigation access.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/19/2010" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 7/19/10)
			Adding ability to view user's activity.
			
			(JF | 9/29/10)
			Adding ability to see user's known login attempts.
			
			(JF | 6/13/11)
			Adding ability to jump to error diagnostics.
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
<h2 style="margin:0px"><a href="index.cfm?fuseaction=Administration.manage_user_access">Manage User Access</a> &gt; View User Activity &gt; #get_user_information.first_name# #get_user_information.last_name#</h2>
<a href='javascript:edit_navigation_access(#attributes.user_account_id#);'>Manage User's Access</a> | <a href="javascript:administer_user_menu('#attributes.user_account_id#');">Manage User's Profile</a><p />

<cfform name="" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="I provide date options.">
	<tr>
		<td><label for="start_date">Start date</label></td>
		<td><cfinput type="text" name="start_date" id="start_date" value="#dateformat(attributes.start_date, 'mm/dd/yyyy')#" size="10" validate="date" message="Please enter a valid start date." /></td>
		<td><label for="end_date">End date</label> </td>
		<td><cfinput type="text" name="end_date" id="end_date" value="#dateformat(attributes.end_date, 'mm/dd/yyyy')#" size="10" validate="date" message="Please enter a valid end date." /></td>
		<td><input type="submit" value="Submit" /></td>
	</tr>
</table>
<input type="hidden" name="user_account_id" value="#attributes.user_account_id#" />
</cfform>
<br />
<!---display known login attempts--->
<div class="datachart" style="border:1px solid ##999999">
<h3 style="margin:0px">User's last 100 known login attempts<cfif isdate(attributes.start_date) AND isdate(attributes.end_date)> between #dateformat(attributes.start_date, "mm/dd/yyyy")# and #dateformat(attributes.end_date, "mm/dd/yyyy")#</cfif></h3>
<table width="100%" cellpadding="0" cellspacing="0" border="0" cols="3" summary="I show the user's last 100 known login attempts.">
	<thead>
		<tr>
			<th>Date/Time of Attempt</th>
			<th>Attempt Result</th>
			<th>Account Status</th>
		</tr>
	</thead>
	<tbody>
	<cfloop query="get_user_login_attempts" startrow="1" endrow="100">
	<cfif currentrow MOD 2>
		<cfset variables.row_color="eeeeee">
	<cfelse>
		<cfset variables.row_color="dddddd">
	</cfif>
		<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cfdee3';" onmouseout="this.bgColor='###variables.row_color#';">
			<td scope="row">#created_date#</td>
			<td>#success_status#</td>
			<td>#account_status#</td>
		</tr>
	</cfloop>
	</tbody>
</table>
<br />
<hr />
<!---display favorite pages (other than log-in and log-out)--->
<h3 style="margin:0px">User's 10 favorite pages</h3>
<table width="100%" cellpadding="0" cellspacing="0" border="0" cols="2" summary="I show the user's top 10 pages (other than login and logout).">
	<thead>
		<tr>
			<th>url_requested</th>
			<th>count</th>
		</tr>
	</thead>
	<tbody>
	<cfloop query="get_favorite_pages" startrow="1" endrow="10">
	<cfif currentrow MOD 2>
		<cfset variables.row_color="eeeeee">
	<cfelse>
		<cfset variables.row_color="dddddd">
	</cfif>
		<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cfdee3';" onmouseout="this.bgColor='###variables.row_color#';">
			<td scope="row">#url_requested#</td>
			<td>#count1#</td>
		</tr>
	</cfloop>
	</tbody>
</table>
<br />
<hr />
<!---display favorite hours--->
<h3 style="margin:0px">User's most active hours</h3>
<table width="100%" cellpadding="0" cellspacing="0" border="0" cols="2" summary="I show the user's most active hours." align="right">
	<thead>
		<tr>
			<th>request_hour</th>
			<th>count</th>
		</tr>
	</thead>
	<tbody>
	<cfloop query="get_favorite_hours" startrow="1" endrow="10">
	<cfif currentrow MOD 2>
		<cfset variables.row_color="eeeeee">
	<cfelse>
		<cfset variables.row_color="dddddd">
	</cfif>
		<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cfdee3';" onmouseout="this.bgColor='###variables.row_color#';">
			<td scope="row">#request_hour#</td>
			<td>#count1#</td>
		</tr>
	</cfloop>
	</tbody>
</table>
<br />
<hr />
<!---display count trend by week--->
<h3 style="margin:0px">Week trend of activity</h3>
<table width="100%" cellpadding="0" cellspacing="0" border="0" cols="2" summary="I show the user's top 10 pages (other than login and logout).">
	<thead>
		<tr>
			<th>week</th>
			<th>count</th>
		</tr>
	</thead>
	<tbody>
	<cfloop query="get_week_trend">
	<cfif currentrow MOD 2>
		<cfset variables.row_color="eeeeee">
	<cfelse>
		<cfset variables.row_color="dddddd">
	</cfif>
		<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cfdee3';" onmouseout="this.bgColor='###variables.row_color#';">
			<td scope="row">#date_year# #date_week#</td>
			<td>#count1#</td>
		</tr>
	</cfloop>
	</tbody>
</table>
<br />
<hr />
<!---display probable error incidents--->
<h3 style="margin:0px">Probable errors</h3>
<table width="100%" cellpadding="0" cellspacing="0" border="0" cols="3" summary="I show the user's most recent page requests that probably resulted in errors." align="right">
	<thead>
		<tr>
			<th>error_log_id</th>
			<th>page_request_id</th>
			<th>url_requested</th>
			<th>request_date</th>
		</tr>
	</thead>
	<tbody>
	<cfloop query="get_probable_errors">
	<cfif currentrow MOD 2>
		<cfset variables.row_color="eeeeee">
	<cfelse>
		<cfset variables.row_color="dddddd">
	</cfif>
		<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cfdee3';" onmouseout="this.bgColor='###variables.row_color#';">
			<td><cfif len(error_log_id)><a href="index.cfm?fuseaction=Application_Manager.view_error_diagnostics&display_all=0&error_log_id=#error_log_id#" target="view_error_diagnostics">#error_log_id#</a></cfif></td>
			<td scope="row">#page_request_id#</td>
			<td>#url_requested#</td>
			<td>#dateformat(request_date, "mm/dd/yyyy")#&nbsp;#request_time#</td>
		</tr>
	</cfloop>
	</tbody>
</table>
<br />
<hr />
<!---display table of all data--->
<h3 style="margin:0px">All page requests</h3>
<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="I show user activity for the specified dates (or last 60 days if no dates are specified)">
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
	<cfif currentrow MOD 2>
		<cfset variables.row_color="eeeeee">
	<cfelse>
		<cfset variables.row_color="dddddd">
	</cfif>
		<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cfdee3';" onmouseout="this.bgColor='###variables.row_color#';">
			<td scope="row">#page_request_id#</td>
			<td>#url_requested#</td>
			<td>#page_load_time#</td>
			<td>#dateformat(request_date, "mm/dd/yyyy")#&nbsp;#request_time#</td>
		</tr>
	</cfloop>
	</tbody>
</table>
</div>
</cfoutput>