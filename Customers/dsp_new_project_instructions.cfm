
<!-- Customers/dsp_new_project_instructions.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the instructions for creating a new project.

	||
	Edits:
	$Log$
	||
	Variables:

	END FUSEDOC --->
</cfsilent>
<cfset bgcolor="##78A0EB">
<table cellpadding="2" cellspacing="2" border="0" bgcolor="<cfoutput>#bgcolor#</cfoutput>">
	<tr>
		<td class="<cfoutput>HeadText</cfoutput>">To create a new project:</td>
	</tr>
	<tr>
		<td class="<cfoutput>RegText</cfoutput>White">1. Choose the root code for the project to live under.</td>
	</tr>
	<tr>

		<td class="<cfoutput>RegText</cfoutput>White">2. Name the project</td>
	</tr> 
	<tr>

		<td class="<cfoutput>RegText</cfoutput>White">3. If the project is to be used by companies other than the root uses, select <strong>ALL</strong> companies that will use the project in the "visible to" box</td>
	</tr>
	<tr>

		<td class="<cfoutput>RegText</cfoutput>White">4. Fill in Vision, Mission and Business Case</td>
	</tr>
	<tr>

		<td class="<cfoutput>RegText</cfoutput>White">5. Assign the project a budget, this should come from a contract, for billable codes.</td>
	</tr>
	<tr>

		<td class="<cfoutput>RegText</cfoutput>White">6. Project start and Project end are the dates between the beginning and end of the work on the project.</td>
	</tr>
	<tr>

		<td class="<cfoutput>RegText</cfoutput>White">7. If the project is "Flat-Rate" continue on, otherwise skip to step 10.</td>
	</tr>
	<tr>

		<td class="<cfoutput>RegText</cfoutput>White">8. Billing Start and Billing End are the dates that we begin and end billing the customer, <strong>this is not necessarily the same as project start and end!</strong></td>
	</tr>
	<tr>

		<td class="<cfoutput>RegText</cfoutput>White">9. Months is the number of months over which we are billing the customer</td>
	</tr>
	<tr>

		<td class="<cfoutput>RegText</cfoutput>White">&nbsp;&nbsp;&nbsp;&nbsp;*ALL 3 "flat-rate" specific fields MUST be filled in for a flat rate project.</td>
	</tr>
	<tr>

		<td class="<cfoutput>RegText</cfoutput>White">10. Click Submit.</td>
	</tr>
</table>