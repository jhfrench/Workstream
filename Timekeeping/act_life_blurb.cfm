
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
<cfset variables.new_hire_count=0>
<cfset variables.anniversary_count=0>
<cfset variables.birthday_count=0>
<cfset variables.employee_count=0>
</cfsilent>

<cfinclude template="qry_get_life_blurb.cfm">
<cfif get_life_blurb.recordcount>
	<cfset variables.new_hire_count=get_life_blurb.new_hire_count>
	<cfset variables.anniversary_count=get_life_blurb.anniversary_count>
	<cfset variables.birthday_count=get_life_blurb.birthday_count>
	<cfset variables.employee_count=get_life_blurb.employee_count>
</cfif>

<cfsavecontent variable="variables.life_blurb">
<cfoutput>
This month #session.workstream_company_name# added 
<cfif variables.new_hire_count EQ 0>
	no
<cfelseif variables.new_hire_count EQ 1>
	one
<cfelse>
	#variables.new_hire_count#
</cfif> new employees; 

<cfif variables.anniversary_count NEQ 1>
	#variables.anniversary_count# people
<cfelse>
	one person
</cfif> will mark the anniversary of their hiring
<cfif variables.birthday_count EQ 1>
	, and one person will celebrate a birthday
<cfelseif variables.birthday_count NEQ 0>
	, and #variables.birthday_count# people will celebrate a birthday
</cfif>. #session.workstream_company_name# currently has #variables.employee_count# employees.
</cfoutput>
</cfsavecontent>