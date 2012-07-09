
<!--Timekeeping/act_life_blurb.cfm
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
<cfset variables.new_hires=0>
<cfset variables.anniversaries=0>
<cfset variables.birthdays=0>
<cfset variables.total_employees=0>
</cfsilent>

<cfinclude template="qry_life_blurb.cfm">
<cfif life_blurb.recordcount>
	<cfset variables.new_hires=life_blurb.new_hires>
	<cfset variables.anniversaries=life_blurb.anniversaries>
	<cfset variables.birthdays=life_blurb.birthdays>
	<cfset variables.total_employees=life_blurb.total_employees>
</cfif>

<cfif variables.new_hires EQ 0>
	<cfset variables.life_blurb="This month #session.workstream_company_name# added no new employees">
<cfelseif variables.new_hires EQ 1>
	<cfset variables.life_blurb="This month #session.workstream_company_name# added one new employee">
<cfelse>
	<cfset variables.life_blurb="This month #session.workstream_company_name# added #vvariables.new_hires# new employees">
</cfif>

<cfif variables.anniversaries NEQ 1>
	<cfset variables.life_blurb="#variables.life_blurb#; #variables.anniversaries# people will mark their anniversary">
<cfelse>
	<cfset variables.life_blurb="#variables.life_blurb#; #variables.anniversaries# person will mark their anniversary">
</cfif>

<cfif variables.birthdays EQ 1>
	<cfset variables.life_blurb="#variables.life_blurb#, and #variables.birthdays# person will celebrate a birthday">
<cfelseif variables.birthdays NEQ 0>
	<cfset life_blurb="#variables.life_blurb#, and #variables.birthdays# people will celebrate birthdays">
</cfif>
<cfset variables.life_blurb="#variables.life_blurb#. #session.workstream_company_name# currently has #variables.total_employees# employees.">
<!--- 
<cfset life_blurb='#life_blurb# <a href="../index.cfm?fuseaction=Reports.personal_summary">Click here to view the report.</a>'> --->