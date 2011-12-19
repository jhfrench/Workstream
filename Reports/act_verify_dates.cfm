
<!--Reports/act_verify_dates.cfm
	Author: Jeromy F  -->
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
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
<cfparam default="" name="variables.from_date">
<cfparam default="" name="variables.through_date">
<cfif isdefined("attributes.from_date") AND isdefined("attributes.through_date")>
	<cfif attributes.from_date LTE now() AND attributes.from_date LTE attributes.through_date>
		<cfset variables.from_date=createodbcdate(attributes.from_date)>
		<cfset variables.through_date=createodbcdate(attributes.through_date)>
	<cfelse>
		<span class="Note<cfoutput>#session.workstream_text_size#</cfoutput>">You have selected an invalid date range, please check your dates and try again.</span>
	</cfif>
<cfelse>
	<!--- $issue$: clear this out, should just be the redirect --->
	<cfquery name="clear_starting_point" datasource="#application.datasources.main#">
	UPDATE REF_Screen
	SET starting_point_ind=0,
		check_variable='attributes.from_date'
	WHERE fuseaction='#attributes.fuseaction#'
	</cfquery>
	Not a starting point
	<cfabort>
	<!--- $issue$: clear above out, should just be the redirect --->
	<cflocation url="index.cfm?fuseaction=Reports.report">	  
</cfif>


