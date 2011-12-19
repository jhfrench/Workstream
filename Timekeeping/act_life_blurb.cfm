
<!--Timekeeping/act_life_blurb.cfm
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
<cfset new_hires=0>
<cfset anniversaries=0>
<cfset birthdays=0>
<cfset total_employees=0>
</cfsilent>
<cfinclude template="qry_life_blurb.cfm">
<cfoutput query="life_blurb">
	<cfset new_hires=new_hires>
	<cfset anniversaries=anniversaries>
	<cfset birthdays=birthdays>
	<cfset total_employees=total_employees>
</cfoutput>
<cfif new_hires EQ 0>
	<cfset new_hires="no">
</cfif>
<cfset life_blurb="This month #session.workstream_company_name# added #new_hires# new">
<cfif new_hires EQ 1>
	<cfset life_blurb="#life_blurb# employee">
<cfelse>
	<cfset life_blurb="#life_blurb# employees">
</cfif>
<cfif anniversaries NEQ 1>
	<cfset life_blurb="#life_blurb#; #anniversaries# people will mark their anniversary">
<cfelse>
	<cfset life_blurb="#life_blurb#; #anniversaries# person will mark their anniversary">
</cfif>
<cfif birthdays EQ 1>
	<cfset life_blurb="#life_blurb#, and #birthdays# person will celebrate a birthday">
<cfelseif birthdays NEQ 0>
	<cfset life_blurb="#life_blurb#, and #birthdays# people will celebrate birthdays">
</cfif>
<cfset life_blurb="#life_blurb#. #session.workstream_company_name# currently has #total_employees# employees.">
<!--- 
<cfset life_blurb='#life_blurb# <a href="../index.cfm?fuseaction=Reports.personal_summary" class="RegText#session.workstream_text_size#">Click here to view the report.</a>'> --->
