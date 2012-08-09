
<!--Directory/dsp_emp_details.cfm
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
		<img src="#request.dir_level##application.application_specific_settings.image_dir#photos/#get_emp_details.photo#" width="144" height="144" alt="#attributes.section_title#" border="0">
		<cfif session.user_account_id EQ 1><a href="javascript:edit_employee('#emp_id#');" class="btn">Edit Employee Information</a></cfif>
		<br />
		<b>Birthdate:</b> #dateformat(get_emp_details.dob,"mm/dd")#<br />
		<b>Hire Date:</b> #dateformat(get_emp_details.hire_date,"mm/dd/yy")#<br />
		<cfif compare(get_emp_details.end_date,"")><b>End Date:</b> #dateformat(get_emp_details.end_date,"mm/dd/yy")#</cfif>
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
		<cfif len(get_emp_details.biography)>
		<div class="lead">
			<h4>Biography</h4>
			#get_emp_details.biography#
		</div>
		</cfif>
		<cfif listcontains(valuelist(get_user_access.fuseaction),"emp_entry")>

			<cfif listcontains("1" ,session.user_account_id)>
			<!--- <cfif session.user_account_id EQ 126 OR session.user_account_id EQ 609> --->
				<cfinclude template="dsp_emp_supervisor.cfm">
			</cfif>

			<cfinclude template="dsp_emp_position_number.cfm">

			<!--- Only Jeromy can see this so hard code it--->
			<cfif listcontains("1" ,session.user_account_id)>
				<cfinclude template="dsp_emp_salary_info.cfm">
				<cfinclude template="dsp_emp_benefits_info.cfm">
				<cfinclude template="dsp_emp_performance_review.cfm">
			</cfif>

			<cfinclude template="dsp_emp_job_titles.cfm">
		</cfif>
		<cfif get_subordinates.recordcount>
			<h4>Direct Reports</h4>
			<cfloop query="get_subordinates"><a href="javascript:list_to_employee('#emp_id#');"  title="View details for #replace(lname,"'","")# #replace(fname,"'","")#."><cfif currentrow NEQ 1>; </cfif>#lname#, #fname#</a></cfloop>
		</cfif>
	</div>
</div>
</cfoutput>