
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
	<div id="operations_blurb"><!--- $issue$: is this id referenced anywhere? --->
	<cfoutput query="operations_blurb">
		<div class="row-fluid">
			<div class="span4">
				#customer#
			</div>
			<div class="span8">
				<div class="progress">
				  <div class="bar" style="width: #round(blue_count/total_count*100)#%;" title="#blue_count# has/have unknown status"></div>
				  <div class="bar bar-success" style="width: #round(green_count/total_count*100)#%;" title="#green_count# is/are doing well"></div>
				  <div class="bar bar-warning" style="width: #round(yellow_count/total_count*100)#%;" title="#yellow_count# is/have areas of concern"></div>
				  <div class="bar bar-danger" style="width: #round(red_count/total_count*100)#%;" title="#red_count# is/are in real trouble"></div>
				</div>
			</div>
		</div>
	</cfoutput>
	</div>
	<p><a href="index.cfm?fuseaction=Reports.engagement_dashboard" class="btn">View details &raquo;</a></p>
</section>