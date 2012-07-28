
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
	<div id="operations_blurb">
		<cfoutput query="operations_blurb">
			<p style="right:0px;">#customer#&nbsp;<span style="width: #variables.stretch_width#px;"><img src="images/bar_7.gif" style="width:#round(green_stretch)#px;" alt="#customer# projects in green status." /><img src="images/bar_3.gif" style="width:#round(yellow_stretch)#px;" alt="#customer# projects in yellow status." /><img src="images/bar_1.gif" style="width:#round(red_stretch)#px;" alt="#customer# projects in trouble." /></span></p><!--- 
			<p style="white-space:nowrap;">#customer#&nbsp;<span style="white-space:nowrap; width: #variables.stretch_width#px;"><span style="display:block; height:18px; width:#round(green_stretch)#px; background-color:##5EB95E;" alt="#customer# projects in green status." /><span style="display:block; height:18px; width:#round(yellow_stretch)#px; background-color:##FAA732;" alt="#customer# projects in yellow status." /><span style="display:block; height:18px; width:#round(red_stretch)#px; background-color:##DD514C;" alt="#customer# projects in trouble." /></span></p> --->
		</cfoutput>
	</div>
	<p><a href="index.cfm?fuseaction=Reports.engagement_dashboard" class="btn">View details &raquo;</a></p>
</section>