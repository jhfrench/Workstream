
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
	(10/2/12 | JF) Converted stretched images to Bootstrap's 2.+ stacked progress bars
	 || 
 --->
</cfsilent>

<section id="blurb_dashboard" class="span5">
	<h2>Account Management Dashboard</h2>
	<div id="operations_blurb">
		<cfoutput query="operations_blurb">
			<p style="right:0px;">
				#customer#&nbsp;
				<div class="progress">
				  <div class="bar bar-success" style="width: #round(green_stretch)#%;"></div>
				  <div class="bar bar-warning" style="width: #round(yellow_stretch)#%;"></div>
				  <div class="bar bar-danger" style="width: #round(red_stretch)#%;"></div>
				</div>
			</p>
		</cfoutput>
	</div>
	<p><a href="index.cfm?fuseaction=Reports.engagement_dashboard" class="btn">View details &raquo;</a></p>
</section>