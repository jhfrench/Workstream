
<!--Timekeeping/act_upload_entries.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I call the queries that upload timekeeping information. I also reset session.workstream_last_loaded to the value of the hidden input box (last_loaded) for future evaluation. If one of the submitted time entries is trying to upload non-numeric hours I trap and identify those entries back to the user.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:20:28  stetzer
	<>

	Revision 1.4  2002-04-25 13:59:23-04  french
	Modified code to handle non-numeric entries from Time_Entry (for LewisCo).

	Revision 1.3  2001-11-15 10:12:58-05  long
	Changed the isolation level from Serializable to read_committed

	Revision 1.2  2001-10-29 11:51:02-05  french
	Added condition to set hours to 0 if hours are not specified but notes are.

	Revision 1.1  2001-10-11 10:55:15-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
 --->
<cfif len(attributes.hours) EQ 0>
	<cfset attributes.hours=0>
</cfif>
<cfset identifier="task_id">
<cfif isdefined("attributes.project_id")>
	<cfset identifier="project_id">
</cfif>
<cfset notnumericentries="">
	<cfloop from="1" to="#listlen(attributes.hours)#" index="ii">
		<cfif IsNumeric(listgetat(attributes.hours,ii))>
		<cftransaction isolation="READ_COMMITTED">
			<cfinclude template="qry_upload_notes.cfm">
			<cfinclude template="qry_get_project_details.cfm">
			<cfinclude template="qry_upload_time_entry.cfm">
		</cftransaction>
		<cfelse>
			<cfset notnumeric=1>
			<cfset notnumericentries=listappend(notnumericentries,"Date=#listgetat(attributes.date,ii)#; Hours=#listgetat(attributes.hours,ii)#; #identifier#=#listgetat(evaluate("attributes.#identifier#"),ii)#; Notes=#evaluate("notes_#ii#")#")>
		</cfif>
	</cfloop>
<cfset session.workstream_last_loaded=attributes.last_loaded>
</cfsilent>

