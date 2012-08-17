
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
<cfoutput>
<div class="alert alert-warning">
	One or more of the entries you just submitted contained hours that were not numeric. These entries were not processed:
	<ul>
	<cfloop list="#variables.not_numeric_entries#" index="ii">
		<li>#ii#</li>
	</cfloop>
	</ul>
</div>
</cfoutput>