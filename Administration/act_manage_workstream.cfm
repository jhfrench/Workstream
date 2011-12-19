
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
	Revision 1.1  2006/09/15 22:24:18  csy
	<>

	Revision 1.0  2006-08-16 09:31:56-04  csy
	Initial revision

	Revision 1.0  2005-02-15 15:27:18-05  daugherty
	Initial revision

	Revision 1.0  2001-11-21 12:37:27-05  french
	Added ability to update all application variables.

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
		UPDATE company_list
		SET application_name=''
		WHERE application_name='#GenCustInfo.Application_Name#'
		</cfquery>
		all application variables.
	</cfif>
	</td>
</tr>
</cfoutput>

