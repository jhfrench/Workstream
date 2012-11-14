
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
	 || 
 --->
<cfif len(attributes.hours) EQ 0>
	<cfset attributes.hours=0>
</cfif>
<cfset identifier="task_id">
<cfif isdefined("attributes.project_id")>
	<cfset identifier="project_id">
</cfif>
<cfloop from="1" to="#listlen(attributes.hours)#" index="ii">
	<cfif isnumeric(listgetat(attributes.hours,ii))>
	<cftransaction isolation="READ_COMMITTED">
		<cfinclude template="qry_insert_notes.cfm">
		<cfinclude template="qry_get_project_details.cfm">
		<cfinclude template="qry_insert_time_entry.cfm">
	</cftransaction>
	<cfelse>
		<cfset variables.not_numeric_entries=listappend(variables.not_numeric_entries,"Date=#listgetat(attributes.date,ii)#; Hours=#listgetat(attributes.hours,ii)#; #identifier#=#listgetat(evaluate('attributes.#identifier#'),ii)#; Notes=#evaluate('notes_#ii#')#")>
	</cfif>
</cfloop>
<cfset session.workstream_last_loaded=attributes.last_loaded>
</cfsilent>
