
<!--Reports/act_verify_dates.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I check to see that the user has the necessary variables declared

	||
	Edits:
	$Log$
	 || 
	--> attributes.from_date: date when report should start
	--> attributes.through_date: date when report should end
	END FUSEDOC --->
</cfsilent>
<cfparam name="variables.from_date" default="">
<cfparam name="variables.through_date" default="">
<cfif isdefined("attributes.from_date") AND isdefined("attributes.through_date") AND attributes.from_date LTE now() AND attributes.from_date LTE attributes.through_date>
	<cfset variables.from_date=createodbcdate(attributes.from_date)>
	<cfset variables.through_date=createodbcdate(attributes.through_date)>
<cfelse>
	<div class="alert alert-error">You have selected an invalid date range, please check your dates and try again.</div>
</cfif>
