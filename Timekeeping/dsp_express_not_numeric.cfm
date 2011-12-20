
<!--Timekeeping/dsp_express_not_numeric.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display a meesage that notifies the user that their hour entries were not numeric.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
 --->
</cfsilent>
	<tr align="center" class="NoteBdRed">
		<td colspan="5" class="NoteBdRed">
			One or more of the entries you just submitted contained hours that were not numeric. These entries were not processed:
		</td>
	</tr>
	<tr align="center" class="NoteBdRed">
		<td align="left" class="NoteBdRed">
			&nbsp;
		</td>
		<td align="left" colspan="4" class="NoteBdRed">
			<ul class="NoteBdRed">
			<cfloop list="#notnumericentries#" index="ii">
				<li><cfoutput>#ii#</cfoutput></li>
			</cfloop>
			</ul>
		</td>
	</tr>
