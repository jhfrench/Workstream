
<!--Reports/dsp_engagement_dashboard_rows.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the engagement list dashboard and a form for restricting and sorting the records. 
	I am used to give a overview of all engagements or select engagments as selected on the form I display.
	The form has the following option restriction can be placed on Customer and IE.  
	Sorting can be done on any column.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.14  2006/05/11 20:24:07  csy
	task44329 Changed Needs QA Review with Needs Customer Review

	Revision 1.13  2006-03-31 16:15:13-05  csy
	task 42740 Hyperlinked icon on dashboard.

	Revision 1.12  2006-03-28 11:38:52-05  csy
	task42738 Added the engagement number(project code) to the name of the engagement in parenthesis

	Revision 1.11  2005-11-07 12:39:37-05  stetzer
	<>

	Revision 1.10  2005-11-07 12:37:29-05  stetzer
	<>

	Revision 1.9  2005-11-07 12:34:55-05  stetzer
	<>

	Revision 1.8  2005-11-07 12:28:17-05  stetzer
	<>

	Revision 1.7  2005-11-07 12:25:21-05  stetzer
	<>

	Revision 1.6  2005-08-26 16:16:58-04  stetzer
	<>

	Revision 1.5  2005-08-26 11:23:51-04  stetzer
	<>

	Revision 1.4  2005-08-26 10:32:12-04  stetzer
	<>

	Revision 1.3  2005-08-26 10:21:49-04  stetzer
	Added LOE and fixed hyperlink for billing that was lost.

	Revision 1.2  2005-08-26 10:16:56-04  stetzer
	<>

	Revision 1.1  2005-03-09 13:06:10-05  stetzer
	<>

	Revision 1.0  2002-01-28 09:59:01-05  french
	Initial file creation (files added to RCS by Jeromy on behalf of Adam).

	||
	END FUSEDOC --->
<cfset today=now()>
</cfsilent>
<!---Begin: engagement record display. --->
<cfoutput query="get_engagement_dashboard">

	<!--- set bgcolor for even rows to ##E1E1E1 odd rows to White --->
	<cfif (currentrow MOD 2) EQ 0>
		<cfset variables.tr_bgcolor="##E1E1E1">
	<cfelse>
		<cfset variables.tr_bgcolor="##FFFFFF">
	</cfif>
	
	<tr  bgcolor="#variables.tr_bgcolor#"> 
		<td class="RegText#session.workstream_text_size#" valign="top">
			<a name="#Project_ID#">
					<a href="index.cfm?fuseaction=Customers.edit_engagement&Project_ID=#Project_ID#&Option=3&engagement_dashboard_Return=1&Customers_ID_Filter=#Customers_ID_filter#&IE_Emp_ID_Filter=#IE_Emp_ID_Filter#&Sort=#Sort#">
			<!--- Show Status Color Image and SET Status Color Variable baised on the status code--->
			<cfswitch expression="#status#">
				<cfcase value="3">
					<img src="../images/Icons/Red_Flag.gif" width="16" height="15" border="0">
					<cfset variables.status_color="Red">
				</cfcase>
				<cfcase value="2">
					<img src="../images/Icons/Yellow_Warning.gif" width="16" height="15" border="0">
					<cfset variables.status_color="Yellow">
				</cfcase>
				<cfcase value="1">
					<img src="../images/Icons/Green_Check.gif" width="16" height="15" border="0">
					<cfset variables.status_color="Green">
				</cfcase>
				<cfdefaultcase>
					<!--- No status so display a red so I get attention --->
					<img src="../images/Icons/Red_Flag.gif" width="16" height="15" border="0">
					<cfset variables.status_color="Red">
				</cfdefaultcase>
			</cfswitch>
			</a>
			</a>
		</td>
		<td class="RegText#session.workstream_text_size#" valign="top">
			<a href="index.cfm?fuseaction=Customers.edit_engagement&Project_ID=#Project_ID#&Option=1&engagement_dashboard_Return=1&Customers_ID_Filter=#Customers_ID_filter#&IE_Emp_ID_Filter=#IE_Emp_ID_Filter#&Sort=#Sort#">#Customers_Description# - #description#(#Project_Code#)</a>
		</td>
		<td class="RegText#session.workstream_text_size#" valign="top">
			#LName# <cfif NOT len(lname)>&nbsp;</cfif>
		</td>
		<td class="RegText#session.workstream_text_size#" valign="top">
			<cfif len(file_path)>
				<a href="http://#REPLACE(file_path,"N:","10.1.1.176/Nuco1")#">
			</cfif>
			<cfif len(Date_Go_Live)>
				<font color="red">Go-Live: </font>#DateFormat(Date_Go_Live,'mm/dd/yy')#</cfif><!--- <cfif NOT len(Date_Go_Live) or Date_Go_Live LT Today>#DateFormat(Project_End,'mm/dd/yy')#
			</cfif>  --->
			<cfif len(file_path)>
				</a>
			</cfif>
		</td>

		<td align="center" class="RegText#session.workstream_text_size#" bgcolor="#variables.status_color#" valign="bottom">
			#variables.status_color#
		</td>
		
				<td align="center" class="RegText#session.workstream_text_size#" valign="bottom">
			<cfif eng_status EQ 0>Not Started</cfif>
			<cfif eng_status EQ 1>Approved - In Progress</cfif>
			<cfif eng_status EQ 11>Technical Review - Nucleus</cfif>
			<cfif eng_status EQ 12>Technical Review - Customer</cfif>
			<cfif eng_status EQ 2>Needs Customer Review</cfif>
			<cfif eng_status EQ 3>Reviewed - Needs Work</cfif>
			<cfif eng_status EQ 9>Sent for Content Approval</cfif>
			<cfif eng_status EQ 10>Approved - Not Scheduled</cfif>
			<cfif eng_status EQ 8>Getting LOE</cfif>
			<cfif eng_status EQ 7>Sent for Financial Approval</cfif>
			<cfif eng_status EQ 6>Withdrawn</cfif>
			<cfif eng_status EQ 5>On Hold</cfif>
			<cfif eng_status EQ 4>Completed</cfif>
		</td>
		
		
		
		<td class="RegText#session.workstream_text_size#" width="25%" valign="top">
			#Vision# <cfif NOT len(vision)>&nbsp;</cfif>
		</td>
		<td class="RegText#session.workstream_text_size#" align="right" valign="top">
		<a href="index.cfm?fuseaction=Customers.edit_engagement&Project_ID=#Project_ID#&Option=2&engagement_dashboard_Return=1&Customers_ID_Filter=#Customers_ID_filter#&IE_Emp_ID_Filter=#IE_Emp_ID_Filter#&Sort=#Sort#">
			#numberformat(Budget,'$___,___,___,___')#
			<cfif loe gt 0><br>h #LOE#</cfif></a>
			<cfif NOT total_bill_amount eq ''><br>Invoiced:<br><a href="index.cfm?fuseaction=Invoice_Posted_List&project_ID_filter=#Project_ID#"> <i>#numberformat(Total_Bill_Amount,'$___,___,___,___')#</i></a></cfif>
		<cfif total_bill_amount eq ''><br>Invoiced:<br><font color=red>$ 0</font></cfif>
			
		</td>
		<td class="RegText#session.workstream_text_size#" width="17%" valign="top">
			#Mission# <cfif NOT len(mission)>&nbsp;</cfif>
		</td>
		
		<td class="RegText#session.workstream_text_size#" valign="top">
			#DateFormat(Date_Updated,'mm/dd/yy')#
		</td>
	</tr>
</cfoutput>
<!---END: engagement record display. --->	


<!--- This form is used for restricting and sorting the records displayed above.
	  Restriction can be placed on Customer and IE.  Sorting can be done on any column
 --->
<cfform action="index.cfm?fuseaction=Reports.engagement_dashboard">
	<tr>
		<td>&nbsp;</td>
		<td>
			<!--- I display the list of customers Selecting previously selected items. --->
			<select name="Customers_ID_Filter" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
				<option value="all" >All Customers</option>
				<CFOUTPUT query="Get_Engagement_Customers">
					<option value="#Customers_ID#"<cfif Customers_ID_Filter EQ Customers_ID> Selected</cfif>>#Description#</option>
				</cfoutput>
			</select>
		</td>
		<td align="left" colspan="100%">
			<!--- I display the list of IE's Selecting previously selected items. --->
			<select name="IE_Emp_ID_Filter" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
				<option value="all">All IEs</option>
				<cfoutput query="Get_Engagement_IE">
					<option value ="#Emp_ID#" <cfif IE_Emp_ID_Filter EQ Emp_ID>selected</cfif> >#LName#</option>
				</cfoutput>
			</select>
		</td>
	</tr>
	
	<tr>
		<td>&nbsp;</td>
		<td>
			<!--- I display the list of Sort Options. --->
			<select name="sort" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
				<option value="Customers.Description,Project.Description">Select Sort Variable</option>
				<option value="Customers.Description,Project.Description">Customer</option>
				<option value="Customers.Description,Project.Description Desc">Customer - Desc</option>
				<option value="LName">IE</option>
				<option value="LName Desc">IE - Desc</option>
				<option value="Project_end">Due Date</option>
				<option value="Project_end Desc">Due Date - Desc</option>
				<option value="Status">Status</option>
				<option value="Status DESC">Status - Desc</option>
				<option value="Project.Budget">Revenue</option>
				<option value="Project.Budget DeSc">Revenue - Desc</option>
				<option value="Project.Date_Updated">Date Updated</option>
				<option value="Project.Date_Updated Desc">Date Updated - Desc</option>
			</select>
		</td>
		<td align="left" colspan="100%">
			<input type="submit" value="Go" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		</td>
	</tr>
</cfform>

	<tr>
		<td colspan="100%" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
			<br>
			<a href="index.cfm?fuseaction=Customers.home&engagement_dashboard_Return=1">Add another engagement to this Dashboard.</a>
		</td>
	</tr>

