
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
		<td class="SubHeadText">1. <a href="javascript:edit_engagement('1')" class="SubHeadText">Main engagement details</a></td>
		<td class="RegText">
			(Project code, name, status, visible-to, mission, vision, business case)
		</td>
	</tr>
	<tr>
		<td class="SubHeadText">2. <a href="javascript:edit_engagement('2')" class="SubHeadText">Billing information</a></td>
		<td class="RegText">
			(Work start and end, billing type, budget, etc)
		</td>
	</tr>
	<tr>
		<td class="SubHeadText">3. <a href="javascript:edit_engagement('3')" class="SubHeadText">Custom fields</a></td>
		<td class="RegText">
			(Add, delete, edit)
		</td>
	</tr>
	<tr>
	<td class="RegText" colspan=100%>
		<a href="index.cfm?fuseaction=Customers.engagements&Project_ID=#Project_ID#">Project list for this customer</a>
	</td>
	</tr>
</cfoutput>

