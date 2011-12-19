
<!-- customers/dsp_new_engagement_instructions.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the instructions for creating a new engagement.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:45:50  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:29-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	 
	||
	Variables:
	
	END FUSEDOC --->
<cfset bgcolor="##78A0EB">
<table cellpadding="2" cellspacing="2" border="0" bgcolor="<cfoutput>#bgcolor#</cfoutput>">
	<tr>
		<td class="<cfoutput>HeadText#session.workstream_text_size#</cfoutput>">To create a new engagement:</td>
	</tr>
	<tr>
		<td class="<cfoutput>RegText#session.workstream_text_size#</cfoutput>White">1. Choose the root code for the engagement to live under.</td>
	</tr>
	<tr>
		
		<td class="<cfoutput>RegText#session.workstream_text_size#</cfoutput>White">2. Name the engagement</td>
	</tr> 
	<tr>
		
		<td class="<cfoutput>RegText#session.workstream_text_size#</cfoutput>White">3. If the engagement is to be used by companies other than the root uses, select <strong>ALL</strong> companies that will use the engagement in the "visible to" box</td>
	</tr>
	<tr>
		
		<td class="<cfoutput>RegText#session.workstream_text_size#</cfoutput>White">4. Fill in Vision, Mission and Business Case</td>
	</tr>
	<tr>
		
		<td class="<cfoutput>RegText#session.workstream_text_size#</cfoutput>White">5. Assign the engagement a budget, this should come from a contract, for billable codes.</td>
	</tr>
	<tr>
		
		<td class="<cfoutput>RegText#session.workstream_text_size#</cfoutput>White">6. Project start and Project end are the dates between the beginning and end of the work on the engagement.</td>
	</tr>		
	<tr>
		
		<td class="<cfoutput>RegText#session.workstream_text_size#</cfoutput>White">7. If the engagement is "Flat-Rate" continue on, otherwise skip to step 10.</td>
	</tr>					
	<tr>
		
		<td class="<cfoutput>RegText#session.workstream_text_size#</cfoutput>White">8. Billing Start and Billing End are the dates that we begin and end billing the customer, <strong>this is not necessarily the same as project start and end!</strong></td>
	</tr>
	<tr>
		
		<td class="<cfoutput>RegText#session.workstream_text_size#</cfoutput>White">9. Months is the number of months over which we are billing the customer</td>
	</tr>
	<tr>
		
		<td class="<cfoutput>RegText#session.workstream_text_size#</cfoutput>White">&nbsp;&nbsp;&nbsp;&nbsp;*ALL 3 "flat-rate" specific fields MUST be filled in for a flat rate engagement.</td>
	</tr>	
	<tr>
		
		<td class="<cfoutput>RegText#session.workstream_text_size#</cfoutput>White">10. Click Submit.</td>
	</tr>						
</table>