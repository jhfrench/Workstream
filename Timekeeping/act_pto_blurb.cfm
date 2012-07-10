
<!--Timekeeping/act_pto_blurb.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: 
	||
	Name: Jeromy French
	||
	Edits:
	$Log: act_pto_blurb.cfm,v $
	||
 --->
</cfsilent>

<cfinclude template="qry_pto_blurb.cfm">
<cfif pto_blurb.recordcount EQ 0 OR pto_blurb.disable_pto>
	<cfset variables.pto_blurb="You have no PTO available according to your workstream data.">
<cfelse>
	<cfset variables.remain=pto_blurb.remain>
	<cfset variables.difference=0>
	<cfif pto_blurb.last_month NEQ 0>
		<cfset variables.difference=(variables.remain-pto_blurb.last_month)/pto_blurb.last_month*100>
	</cfif>
	
	<cfinclude template="../common_files/qry_get_pto_totals.cfm">
	<cfif NOT len(get_pto_totals.rollover)>
		<cfset variables.rollover=0>
	<cfelse>
		<cfset variables.rollover=get_pto_totals.rollover>
	</cfif>
	<cfif IsNumeric(get_pto_totals.PTO_hours_earned)>
		<cfset variables.hours_earned="#numberformat(get_pto_totals.PTO_hours_earned,'___.__')#">
	<cfelse>
		<cfset variables.hours_earned=0>
	</cfif>
	<cfset variables.actual_accrual=variables.hours_earned+variables.rollover>
	
	<cfset variables.pto_blurb="This month you have #variables.remain# hours of PTO remaining, you ended last month with #pto_blurb.last_month# hours.">
	<cfif variables.difference GT 0>
		<cfset variables.pto_blurb="#variables.pto_blurb# This is an increase of #numberformat(variables.difference)#% from last month. ">
	<cfelseif variables.difference LT 0>
		<cfset variables.pto_blurb="#variables.pto_blurb# This is a decrease of #numberformat(variables.difference*-1)#% from last month. ">
	</cfif>
	
	<!--- For January only, point out to user how much time they carried over from last year. --->
	<cfif month(now()) EQ 1>
		<cfset variables.pto_blurb="#variables.pto_blurb# Your rollover from last year was #decimalformat(get_pto_totals.rollover)# hours.">
	</cfif>
	
	<cfset variables.pto_blurb="#variables.pto_blurb# You will earn up to #decimalformat(variables.hours_earned)# hours the rest of this year.">

	<!--- Last three months of the year, remind employees about how much time they need to use --->
	<cfif month(now()) GT 8>
		<cfquery name="get_current_carryover" cachedafter="02/02/1978" datasource="#application.datasources.main#">
		SELECT COALESCE(carryover_limit, 40) AS carryover_limit
		FROM PTO_Rollover
		WHERE emp_id=#session.user_account_id#
			AND rollover_year=YEAR(CURRENT_TIMESTAMP)
			AND #year(now())#=#year(now())#
		</cfquery>
		<cfif NOT len(get_current_carryover.carryover_limit)>
			<cfset variables.current_carryover_limit=40>
		<cfelse>
			<cfset variables.current_carryover_limit=get_current_carryover.carryover_limit>
		</cfif>
		<cfset variables.use_it_or_lose_it=variables.hours_earned+variables.remain-variables.current_carryover_limit>
		<cfif variables.use_it_or_lose_it GT 0>
			<cfset variables.pto_blurb="#variables.pto_blurb# You will need to use #decimalformat(variables.use_it_or_lose_it)# hours before the end of this year, assuming you carry #decimalformat(variables.current_carryover_limit)# hours to next year.">
		</cfif>
	<cfelse>
		<cfset variables.pto_blurb="#variables.pto_blurb# Your available PTO for the rest of the year will be up to #decimalformat(variables.remain+variables.hours_earned)# hours.">
	</cfif>
	
	<!--- Send user the the PTO report appropriate to their company --->
	<cfif session.workstream_company_id EQ 1>
		<cfset variables.pto_action="pto_accrual_input">
	<cfelse>
		<cfset variables.pto_action="pto_input">
	</cfif>

</cfif>