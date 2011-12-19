
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
Revision 1.1  2006/01/19 18:59:14  stetzer
<>

Revision 1.0  2005-02-15 15:46:33-05  daugherty
Initial revision

Revision 1.2  2002-03-08 16:24:42-05  long
added link to the edit employee screen

Revision 1.1  2001-10-11 10:56:12-04  long
Added $log $ for edits to all CFM files that have fusedocs.


	||
	END FUSEDOC --->
<cfoutput>
	<tr valign="top">
		<td align="left" width="148" class="RegText#session.workstream_text_size#">
			<img src="#request.dir_level##application.application_specific_settings.image_dir#photos/#get_emp_details.photo#" width="144" height="144" alt="" border="0"><br>
			<span class="SubHeadText#session.workstream_text_size#">Birthdate:</span> #DateFormat(get_emp_details.dob,"mm/dd")#<br>
			<span class="SubHeadText#session.workstream_text_size#">Hire Date:</span> #DateFormat(get_emp_details.hire_date,"mm/dd/yy")#<br>
			<cfif compare(get_emp_details.end_date,"")><span class="SubHeadText#session.workstream_text_size#">End Date:</span> #DateFormat(get_emp_details.end_date,"mm/dd/yy")#<br></cfif>
			
</cfoutput>
<cfif get_emp_phone.recordcount>
	<cfinclude template="dsp_emp_phone.cfm">
</cfif>
<cfif get_emp_email.recordcount>
	<cfinclude template="dsp_emp_email.cfm">
</cfif>
		</td>
<cfoutput>
		<td class="RegText#session.workstream_text_size#">
			<cfif compare(get_emp_details.biography,"")><span class="SubHeadText#session.workstream_text_size#">Biography</span><br>#get_emp_details.biography#<br></cfif>
</cfoutput>
<cfif get_emp_location.recordcount>
	<cfinclude template="dsp_emp_location.cfm">
</cfif>

<cfif listcontains(valuelist(get_navigation.action),"emp_entry")>
	
	<cfif listcontains("126,609,253,41" ,session.user_account_id)>
	<!--- <cfif session.user_account_id EQ 126 OR session.user_account_id EQ 609> --->
		<cfinclude template="dsp_emp_supervisor.cfm">
	</cfif>

	<cfinclude template="dsp_emp_position_number.cfm">
		
	<!--- Only Sheila and Adam can see this so hard code it--->
	<cfif listcontains("126,609,253,41" ,session.user_account_id)>
			<cfinclude template="dsp_emp_salary_info.cfm">
	</cfif>
	
	<!--- Only Sheila, Adam and the owner can see this --->
	<cfif listcontains("126,609,253,41" ,session.user_account_id)>
		<cfinclude template="dsp_emp_benefits_info.cfm">
	</cfif>
	
	<!--- Only Sheila, Adam and the owner can see this --->
	<cfif listcontains("126,609,253,41" ,session.user_account_id)>
		<cfinclude template="dsp_emp_performance_review.cfm">
	</cfif>
	
	<!--- Only Sheila, Adam and the owner can see this --->
	<cfif listcontains("126,609,253,41" ,session.user_account_id)>
		<cfinclude template="dsp_emp_job_titles.cfm">
	</cfif>
</cfif>
<cfif get_subordinates.recordcount>
			<span class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">Direct Reports</span><br>
			<cfoutput query="get_subordinates"><a href="javascript:list_to_employee('#emp_id#');" onmouseover="MM_displayStatusMsg('View details for #Replace(lname,"'","")# #Replace(fname,"'","")#.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#"><cfif currentrow NEQ 1>; </cfif>#lname#, #fname#</a></cfoutput>
</cfif>
		</td>
		<td width="20%"></td>
	</tr>
<cfif session.user_account_id EQ 126 OR session.user_account_id EQ 609 OR session.user_account_id EQ 253 OR session.user_account_id EQ emp_id OR session.user_account_id EQ 41>
	<tr>
		<td align="left" width="148" class="RegText#session.workstream_text_size#">
		<cfoutput>
		<a href="javascript:edit_employee('#emp_id#');" onmouseover="MM_displayStatusMsg('#JSStringFormat('Edit #get_emp_details.lname# #get_emp_details.fname#.')#');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">Edit Employee Information</a>
		</cfoutput>
		</td>
		<td colspan="2">&nbsp;</td>
	</tr>
	</cfif>