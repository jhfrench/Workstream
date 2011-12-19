
<!--Customers/dsp_new_engagement_step4.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the second step of the 'create new engagement' wizard.
	||
	Name: Jeromy French
	|| 
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:45:53  daugherty
	Initial revision

	Revision 1.4  2001-11-15 10:13:04-05  long
	Changed the isolation level from Serializable to read_committed

	Revision 1.3  2001-11-01 17:24:47-05  french
	Changed decision logic so that the correct message would display.

	Revision 1.2  2001-11-01 16:25:05-05  french
	Made changes that allows workstream to map one custom field to multiple projects.

	Revision 1.1  2001-10-11 10:56:28-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->
<cfset variables.nein=1>
<cfif isdefined("attributes.last_loaded") AND session.workstream_last_loaded NEQ attributes.last_loaded>
<cfinclude template="act_insert_engagements_vars.cfm">
<cftransaction isolation="READ_COMMITTED">
	<cfinclude template="act_increment_project_code.cfm">
	<cfinclude template="act_insert_new_engagement.cfm">
	<cfinclude template="act_set_user_fields.cfm">
</cftransaction>
<cfset variables.nein=0>
<cfset session.workstream_last_loaded=attributes.last_loaded>
</cfif>
</cfsilent>
<cfoutput>
<tr align="center">
	<td class="SubHeadText#session.workstream_text_size#">
<cfif variables.nein>
		You have already entered this engagement.<br>If you wich to enter another engagement please <a href="index.cfm?fuseaction=new_engagement">start the 'new engagement wizard'</a> over again.
<cfelse>
		Your engagement has been created.
</cfif>
	</td>
</tr>
</cfoutput>

