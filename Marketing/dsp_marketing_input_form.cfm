
<!--Marketing/dsp_marketing_input_form.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the form for inputting a new marketing contact.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:50:51  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:59-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->

	<table align="center" border="1" cellpadding="3" cellspacing="0">
		<tr>
			<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">	Project code</td>
			<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">	Project Name</td>
			<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">	Last Task	</td>
			<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">	Date of Last Task</td>
			<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">	Above Date</td>
			<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">	In Date</td>
			<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">	Best Few Date</td>
			<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">	Contract Date</td>
			<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">	Overview</td>
			<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">	Active</td>
			<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">	Company Size</td>
			<cfloop from="1" to="3" index="ii">
				<cfoutput>
				<td>	Name	#ii#</td>
				<td>	Last Name	#ii#</td>
				<td>	Phone#ii#</td>
				<td>	Extension#ii#</td>
				<td>Fax #ii#</td>
				<td>	Address 1#ii#</td>
				<td>	Address 2#ii#</td>
				<td>	City#ii#</td>
				<td>	State#ii#</td>
				<td>Zip#ii#</td>
				</cfoutput>
			</cfloop>
			<td>	Source</td>
			<td>	Projected Revenue</td>
			<td>	Probability</td>
		</tr>
</table>