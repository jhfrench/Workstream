
<!--Timekeeping/act_hours_blurb.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities:
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
 --->
</cfsilent>
<cfinclude template="../common_files/qry_get_employee_details.cfm">
<cfscript>
	variables.total=0;
	variables.this_month=0;
	variables.last_month=0;
	variables.difference=0;
	variables.admin_time=0;
	variables.should_have=datediff("d","#month(now())#/1/#year(now())#",now())*get_employee_details.week_hours/7;
</cfscript>

<cfinclude template="qry_hours_blurb.cfm">
<cfinclude template="qry_get_time_allocation_blurb.cfm">
<cfoutput query="hours_blurb">
	<cfset variables.transaction_date=month("#work_month#/13/#work_year#")>
	<cfset variables.total=month_hours+variables.total>
	<cfif variables.transaction_date EQ month(dateadd("m",-1,now()))>
		<cfset variables.last_month=month_hours>
		<cfset variables.last_month_prorated=variables.last_month/30.4*datepart("d", now())><!--- 30.41 is avg number of days per month --->
	<cfelse>
		<cfset variables.this_month=max(month_hours,1)>
	</cfif>
	<cfif len(variables.last_month) AND variables.last_month NEQ 0>
		<cfset variables.difference=numberformat((variables.this_month-variables.last_month_prorated)/variables.last_month_prorated*100)>
	</cfif>
</cfoutput>

<cfoutput query="get_time_allocation_blurb" maxrows="1">
	<cfset variables.big_hours=decimalformat(project_hours)>
	<cfset variables.big_project=project_name>
</cfoutput>

<cfsavecontent variable="variables.hours_blurb">
<cfoutput>
	<cfif variables.this_month LT variables.should_have>
		<p class="label label-important">Your timekeeping may not be up to date.</p>
	</cfif>
	<p>
	According to your time entries, this month you worked #decimalformat(variables.this_month)# hours. Last month you worked #decimalformat(variables.last_month)# hours. This is a projected
	<cfif variables.difference GT 0>
		increase
	<cfelseif variables.difference LT 0>
		<cfset variables.difference=variables.difference*-1>
		decrease
	</cfif>
	 of #variables.difference#% from last month.
	<cfif get_time_allocation_blurb.recordcount>
		So far this month you spent the most time (#variables.big_hours# hours) on #variables.big_project#.
	</cfif>
	</p>
</cfoutput>
</cfsavecontent>

<cfoutput query="get_time_allocation_blurb">
	<cfif currentrow GT listlen(application.application_specific_settings.color_list)>
		<cfset application.application_specific_settings.color_list=listappend(application.application_specific_settings.color_list,randrange(100000,999999))>
	</cfif>
</cfoutput>

<!--- $issue$: this text is built in Timekeeping/dsp_time_allocation_chart.cfm in a more hard-coded manner. Will need to reinstitute this logic someday.
<cfif get_time_allocation_blurb.recordcount EQ 0>
	<cfset variables.work_allocation_text="">
<cfelse>
	<cfoutput query="get_time_allocation_blurb">
		<cfif currentrow GT listlen(application.application_specific_settings.color_list)>
			<cfset application.application_specific_settings.color_list=listappend(application.application_specific_settings.color_list,randrange(100000,999999))>
		</cfif>
		<cfif project_id EQ 1112>
			<cfset variables.admin_time=decimalformat(project_hours/variables.this_month*100)>
		</cfif>
	</cfoutput>
	<cfset variables.work_allocation_text="So far this month you have worked on #get_time_allocation_blurb.recordcount# different projects.">
	<cfif session.workstream_company_id EQ 1>
		<cfif variables.admin_time LT 10>
			<cfset variables.over_under="under">
		<cfelse>
			<cfset variables.over_under="over">
		</cfif>
		<cfif variables.admin_time NEQ 0>
			<cfset variables.admin_time="#variables.admin_time#%">
		<cfelse>
			<cfset variables.admin_time="none">
		</cfif>
		<cfset variables.work_allocation_text="#variables.work_allocation_text# You have spent #variables.admin_time# of your time on ADMIN/PLANNING. This is #variables.over_under# the ADMIN/PLANNING work allocation target of 10% or less.">
	</cfif>
	<cfset variables.work_allocation_text="#variables.work_allocation_text# You allocated your time as follows:">
</cfif> --->