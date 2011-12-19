
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
	Revision 1.1  2006/06/06 14:39:03  stetzer
	<>

	Revision 1.0  2005-02-15 15:45:46-05  daugherty
	Initial revision

	Revision 1.2  2002-01-24 16:27:03-05  french
	No changes of consequence.

	Revision 1.1  2001-10-11 10:56:33-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->
<cfoutput>
	<tr>
		<td class="SubHeadText#session.workstream_text_size#">1. <a href="javascript:edit_engagement('1')" class="SubHeadText#session.workstream_text_size#">Main engagement details</a></td>
		<td class="RegText#session.workstream_text_size#">
			(Engagement code, name, status, visible-to, mission, vision, business case)
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
<!--- 	<Tr>
	<td class="RegText#session.workstream_text_size#" colspan=100%>
		<a href="index.cfm?fuseaction=engagements&Project_ID=#Project_ID#">Engagement list for this customer</a>
	</td>
	</TR> --->
</cfoutput>

