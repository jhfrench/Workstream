
<!--Reports/act_verify_dates.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I check to see that the user has the necessary variables declared

	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:04:13  stetzer
	<>

	Revision 1.2  2002-02-08 16:00:41-05  french
	Formatting code, scoping variables.

	Revision 1.1  2001-10-11 11:04:52-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	--> attributes.from_date: date when report should start
	--> attributes.through_date: date when report should end
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
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
	<cflocation url="index.cfm?fuseaction=report">	  
</cfif>


