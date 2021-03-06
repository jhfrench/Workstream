
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
	<cfoutput query="get_operations_blurb">
	<div class="row-fluid">
		<div class="span4">
			#customer#
		</div>
		<div class="span8">
			<div class="progress">
			  <div class="bar" style="width: #round(blue_count/total_count*100)#%;" title="#blue_count# has/have unknown status"></div>
			  <div class="bar bar-success" style="width: #round(green_count/total_count*100)#%;" title="doing well: #green_count#"></div>
			  <div class="bar bar-warning" style="width: #round(yellow_count/total_count*100)#%;" title="areas of concern: #yellow_count#"></div>
			  <div class="bar bar-danger" style="width: #round(red_count/total_count*100)#%;" title="in real trouble: #red_count#"></div>
			</div>
		</div>
	</div>
	</cfoutput>
	<cfif listcontains(variables.allowed_business_function_id,634)>
		<p><a href="index.cfm?fuseaction=Reports.project_dashboard" class="btn">View details &raquo;</a></p>
	</cfif>
</section>