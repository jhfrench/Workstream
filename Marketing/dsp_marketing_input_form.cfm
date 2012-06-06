
<!--Marketing/dsp_marketing_input_form.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the form for inputting a new marketing contact.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->

	<table align="center" border="1" cellpadding="3" cellspacing="0">
		<tr>
			<td>	Project code</td>
			<td>	Project Name</td>
			<td>	Last Task	</td>
			<td>	Date of Last Task</td>
			<td>	Above Date</td>
			<td>	In Date</td>
			<td>	Best Few Date</td>
			<td>	Contract Date</td>
			<td>	Overview</td>
			<td>	Active</td>
			<td>	Company Size</td>
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