
<!--Timekeeping/act_hours_blurb.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the notes_id of the latest (and greatest) entry into Notes.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
 --->
	<cfswitch expression="#session.workstream_text_size#">
		<cfcase value="Lg">
			<cfset variables.small="11">
		</cfcase>
		<cfcase value="Md">
			<cfset variables.small="11">
		</cfcase>
		<cfdefaultcase>
			<cfset variables.small="9">
		</cfdefaultcase>
	</cfswitch>
	<cfset variables.initial_color_list="FFC363,5A82B5,A5597B,6B7D63,E77963,5AA29C,CE5D63,428A6B,F7A263,9C9A5A,FF8E5A,7B96AD,528E84,BDCB94,A56163,4A8EAD,FFE784,4A6194,C6514A,A2835A,63E2E7,B55AB2,5AB55C,DDA0DD,000080,2E8B57,708090,7B68EE,000000,FF69B4,DC143C">
	<cfset variables.color_list="">
	<cfset variables.total=0>
	<cfset variables.this_month=0>
	<cfset variables.last_month=0>
	<cfset variables.difference=0>
	<cfset variables.admin_time=0>
	<cfset variables.should_have=datediff("d","#month(now())#/1/#year(now())#",now())*5.2>
</cfsilent>
<cfinclude template="qry_hours_blurb.cfm">
<cfinclude template="qry_time_allocation_blurb.cfm">
<cfoutput query="hours_blurb">
	<cfset variables.transaction_date=month("#work_month#/13/#work_year#")>
	<cfset variables.total=month_hours+variables.total>
	<cfif variables.transaction_date EQ month(dateadd("m",-1,now()))>
		<cfset variables.last_month=month_hours>
	<cfelse>
		<cfset variables.this_month=max(month_hours,1)>
	</cfif>
	<cfif len(variables.last_month) AND variables.last_month NEQ 0>
		<cfset variables.difference=numberformat((variables.this_month-variables.last_month)/variables.last_month*100)>
	</cfif>
</cfoutput>
<cfset variables.hours_blurb="According to your time entries, this month you worked #decimalformat(variables.this_month)# hours. Last month you worked #decimalformat(variables.last_month)# hours.">
<cfif variables.difference GT 0>
	<cfset variables.hours_blurb="#variables.hours_blurb# This is an increase of #variables.difference#% from last month.">
<cfelseif variables.difference LT 0>
	<cfset variables.difference=variables.difference*-1>
	<cfset variables.hours_blurb="#variables.hours_blurb# This is a decrease of #variables.difference#% from last month.">
</cfif>
<cfoutput query="time_allocation_blurb" maxrows="1">
	<cfset variables.big_hours=decimalformat(project_hours)>
	<cfset variables.big_project=project_name>
</cfoutput>
<cfif time_allocation_blurb.recordcount>
	<cfset variables.hours_blurb="#variables.hours_blurb# So far this month you spent the most time (#variables.big_hours# hours) on #variables.big_project#.">
</cfif>
<cfif variables.this_month LT variables.should_have>
	<cfset variables.hours_blurb="Your timekeeping may not be up to date. #variables.hours_blurb#">
</cfif>
 <cfif listfind(variables.allowed_modules, 3)> 
	<cfset variables.hours_blurb='#variables.hours_blurb# <a href="index.cfm?fuseaction=Reports.personal_summary" class="RegText#session.workstream_text_size#">Click here to view the report.</a>'>
 </cfif> 
<cfif time_allocation_blurb.recordcount EQ 0>
	<cfset variables.work_allocation_text="">
<cfelse>
	<cfoutput query="time_allocation_blurb">
		<cfif currentrow LTE listlen(variables.initial_color_list)>
			<cfset variables.color_list=listappend(variables.color_list,listgetat(variables.initial_color_list,currentrow))>
		<cfelse>
			<cfset variables.color_list=listappend(variables.color_list,randrange(100000,999999))>
		</cfif>
		<cfif project_id EQ 1112>
			<cfset variables.admin_time=decimalformat(project_hours/variables.this_month*100)>
		</cfif>
	</cfoutput>
	<cfset variables.work_allocation_text="So far this month you have worked on #time_allocation_blurb.recordcount# different engagements.">
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
</cfif>