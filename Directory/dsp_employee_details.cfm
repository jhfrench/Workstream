
<!--Directory/dsp_employee_details.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the employee details page.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<h2>Employee Details <small>#attributes.section_title#</small></h2>
<div class="row-fluid">
	<div class="span3">
		<img src="#get_employee_details.photo_path#" width="144" height="144" alt="#attributes.section_title#" border="0">
		<cfif variables.user_identification EQ 1><br /><a href="javascript:edit_employee(#user_account_id#);" class="btn">Edit Employee Information</a></cfif>
		<br />
		<b>Birthdate</b> #dateformat(get_employee_details.birth_date, "mm/dd")#<br />
		<b>Hire Date</b> #dateformat(get_employee_details.hire_date, "m/d/yyyy")#<br />
		<cfif compare(get_employee_details.turnover_date,"")><b>End Date</b> #dateformat(get_employee_details.turnover_date,"m/d/yyyy")#</cfif>
		<cfif get_emp_phone.recordcount>
			<cfinclude template="dsp_emp_phone.cfm">
		</cfif>
		<cfif get_emp_email.recordcount>
			<cfinclude template="dsp_emp_email.cfm">
		</cfif>
		<cfif get_emp_location.recordcount>
			<cfinclude template="dsp_emp_location.cfm">
		</cfif>
	</div>
	<div class="span9">
		<cfif len(get_employee_details.biography)>
		<div class="lead">
			<h4>Biography</h4>
			#get_employee_details.biography#
		</div>
		</cfif>
		<cfif listcontains(valuelist(get_user_access.fuseaction),"emp_entry")>

			<cfinclude template="dsp_emp_job_titles.cfm">

			<cfif listcontains("1" ,variables.user_identification)>
			<!--- <cfif variables.user_identification EQ 126 OR variables.user_identification EQ 609> --->
				<cfinclude template="dsp_emp_supervisor.cfm">
			</cfif>

			<!--- Only Jeromy can see this so hard code it--->
			<cfif listcontains("1" ,variables.user_identification)>
				<cfinclude template="dsp_emp_salary_info.cfm">
				<cfinclude template="dsp_emp_benefits_info.cfm">
				<cfinclude template="dsp_emp_performance_review.cfm">
			</cfif>

			<cfinclude template="dsp_emp_position_number.cfm">
		</cfif>
		<cfif get_subordinates.recordcount>
			<cfset variables.level=0>
			<cfset variables.open_count=0>
			<h4>Subordinates</h4>
			
			<cfloop query="get_subordinates">
				<cfif level GT variables.level>
					<cfset variables.open_count=variables.open_count+1>
					<ul>
						<li>
				<cfelseif level LT variables.level>
					<cfloop from="#level+1#" to="#variables.level#" index="variables.open_count_ii">
						<cfset variables.open_count=variables.open_count-1>
						</li>
					</ul>
					</cfloop>
						</li>
						<li>
				<cfelse>
						</li>
						<li>
				</cfif>
				<cfset variables.level=level>
							<a href="javascript:list_to_employee('#user_account_id#');" title="View details for #jsstringformat(first_name)# #jsstringformat(last_name)#.">#last_name#, #first_name#</a>
			</cfloop>
			<cfloop from="1" to="#variables.open_count#" index="variables.open_count_ii">
						</li>
					</ul>
			</cfloop>
		</cfif>
	</div>
</div>
</cfoutput>
