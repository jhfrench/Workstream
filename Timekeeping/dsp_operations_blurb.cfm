
<!--Timekeeping/dsp_operations_blurb.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: 
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
</cfsilent>

<section id="blurb_dashboard" class="span5">
	<h2>Account Management Dashboard</h2>
	<div id="operations_blurb" style="text-align:right; overflow:hidden;">
		<cfoutput query="operations_blurb">
			<p style="right:0px; white-space:nowrap;">#customer#&nbsp;<span style="white-space:nowrap; width: #variables.stretch_width#px;"><img src="images/bar_7.gif" style="height:10px; width:#round(green_stretch)#px;" alt="#customer# projects in green status." /><img src="images/bar_3.gif" style="height:10px; width:#round(yellow_stretch)#px;" alt="#customer# projects in yellow status." /><img src="images/bar_1.gif" style="height:10px; width:#round(red_stretch)#px;" alt="#customer# projects in trouble." /></span></p>
		</cfoutput>
	</div>
	<p><a href="index.cfm?fuseaction=Reports.engagement_dashboard" class="btn">View details &raquo;</a></p>
</section>