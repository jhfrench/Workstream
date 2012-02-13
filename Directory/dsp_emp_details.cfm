
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
	<tr valign="top">
		<td align="left" width="148" class="RegText">
			<img src="#request.dir_level##application.application_specific_settings.image_dir#photos/#get_emp_details.photo#" width="144" height="144" alt="" border="0"><br>
			<span class="SubHeadText">Birthdate:</span> #dateformat(get_emp_details.dob,"mm/dd")#<br>
			<span class="SubHeadText">Hire Date:</span> #dateformat(get_emp_details.hire_date,"mm/dd/yy")#<br>
			<cfif compare(get_emp_details.end_date,"")><span class="SubHeadText">End Date:</span> #dateformat(get_emp_details.end_date,"mm/dd/yy")#<br></cfif>
			
</cfoutput>
<cfif get_emp_phone.recordcount>
	<cfinclude template="dsp_emp_phone.cfm">
</cfif>
<cfif get_emp_email.recordcount>
	<cfinclude template="dsp_emp_email.cfm">
</cfif>
		</td>
<cfoutput>
		<td class="RegText">
			<cfif compare(get_emp_details.biography,"")><span class="SubHeadText">Biography</span><br>#get_emp_details.biography#<br></cfif>
</cfoutput>
<cfif get_emp_location.recordcount>
	<cfinclude template="dsp_emp_location.cfm">
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
	</cfif>
	
	<!--- Only Jeromy can see this --->
	<cfif listcontains("1" ,session.user_account_id)>
		<cfinclude template="dsp_emp_benefits_info.cfm">
	</cfif>
	
	<!--- Only Jeromy can see this --->
	<cfif listcontains("1" ,session.user_account_id)>
		<cfinclude template="dsp_emp_performance_review.cfm">
	</cfif>
	
	<!--- Only Jeromy can see this --->
	<cfif listcontains("1" ,session.user_account_id)>
		<cfinclude template="dsp_emp_job_titles.cfm">
	</cfif>
</cfif>
<cfif get_subordinates.recordcount>
			<span class="SubHeadText">Direct Reports</span><br>
			<cfoutput query="get_subordinates"><a href="javascript:list_to_employee('#emp_id#');" onmouseover="MM_displayStatusMsg('View details for #Replace(lname,"'","")# #Replace(fname,"'","")#.');return document.MM_returnValue;" class="RegText"><cfif currentrow NEQ 1>; </cfif>#lname#, #fname#</a></cfoutput>
</cfif>
		</td>
		<td width="20%"></td>
	</tr>
<cfif session.user_account_id EQ 1>
	<tr>
		<td align="left" width="148" class="RegText">
		<cfoutput>
		<a href="javascript:edit_employee('#emp_id#');" onmouseover="MM_displayStatusMsg('#JSStringFormat('Edit #get_emp_details.lname# #get_emp_details.fname#.')#');return document.MM_returnValue;" class="RegText">Edit Employee Information</a>
		</cfoutput>
		</td>
		<td colspan="2">&nbsp;</td>
	</tr>
	</cfif>