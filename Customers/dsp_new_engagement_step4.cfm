
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
		You have already entered this engagement.<br>If you wich to enter another engagement please <a href="index.cfm?fuseaction=Customers.new_engagement">start the 'new engagement wizard'</a> over again.
<cfelse>
		Your engagement has been created.
</cfif>
	</td>
</tr>
</cfoutput>

