
<!-- Admin/act_manage_workstream.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I process the user's request to update application variables in workstream.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	Variables:
	--> [attributes.change_me]: list of variable names to update to the current date/time
	--> [attributes.application_variables]: boolean that tells workstream to update the application name, thereby resetting all application variables
	--> session.workstream_text_size: string indicating the size the user's text size preference
	||
	END FUSEDOC --->
<cfoutput>
<tr bgcolor="##e6e6e6">
	<td class="RegText#session.workstream_text_size#">
		Theses variables were updated:<br>
	<cfif isdefined("attributes.change_me") AND NOT isdefined("attributes.application_variables")>
		<cfloop list="#attributes.change_me#" index="ii">
			<cfset "application.#ii#"=now()>
			application.#ii# now equals #now()#<br>
		</cfloop>
	</cfif>
	<cfif isdefined("attributes.application_variables")>
		<cfquery name="Reset_Application_Name" datasource="#application.datasource.application_manager#">
		UPDATE Last_Updated
		SET last_updated=GETDATE()
		</cfquery>
		all application variables.
	</cfif>
	</td>
</tr>
</cfoutput>

