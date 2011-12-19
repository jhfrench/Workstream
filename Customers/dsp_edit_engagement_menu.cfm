
<!--Customers/dsp_edit_engagement_menu.cfm
	Author: Jeromy French  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the list of details that a user can edit on an engagement.
	||
	Name: Jeromy F
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfoutput>
	<tr>
		<td class="SubHeadText#session.workstream_text_size#">1. <a href="javascript:edit_engagement('1')" class="SubHeadText#session.workstream_text_size#">Main engagement details</a></td>
		<td class="RegText#session.workstream_text_size#">
			(Project code, name, status, visible-to, mission, vision, business case)
		</td>
	</tr>
	<tr>
		<td class="SubHeadText#session.workstream_text_size#">2. <a href="javascript:edit_engagement('2')" class="SubHeadText#session.workstream_text_size#">Billing information</a></td>
		<td class="RegText#session.workstream_text_size#">
			(Work start and end, billing type, budget, etc)
		</td>
	</tr>
	<tr>
		<td class="SubHeadText#session.workstream_text_size#">3. <a href="javascript:edit_engagement('3')" class="SubHeadText#session.workstream_text_size#">Custom fields</a></td>
		<td class="RegText#session.workstream_text_size#">
			(Add, delete, edit)
		</td>
	</tr>
	<tr>
	<td class="RegText#session.workstream_text_size#" colspan=100%>
		<a href="index.cfm?fuseaction=Customers.engagements&Project_ID=#Project_ID#">Project list for this customer</a>
	</td>
	</tr>
</cfoutput>

