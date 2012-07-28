
<!--Reports/dsp_engagement_dashboard_rows_staff.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am not properly docummented by the file's author.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput query="get_engagement_dashboard">
	<tr<cfif (currentrow MOD 2) EQ 0> bgcolor="##E1E1E1"</cfif>> 
		<td valign="top">
		<cfif status EQ 3><img src="../images/Icons/Red_Flag.gif" width=16 height=15 border="0"></cfif>
<cfif status EQ 2><img src="../images/Icons/Yellow_Warning.gif" width=16 height=15 border="0"></cfif>
<cfif status EQ 1><img src="../images/Icons/Green_Check.gif" width=16 height=15 border="0"></cfif></td>
			<td valign="top">
#customer_description# - #description#
		</td>
		<td valign="top">
			#LName# <cfif NOT len(lname)>&nbsp;</cfif>
		</td>
		<td valign="top">
		<cfif len(file_path)><a href="http://#REPLACE(file_path,"N:","10.1.1.176/Nuco1")#"></cfif>
			<cfif len(date_go_live) AND date_go_live GT Today><font color="red">Go-Live: </font>#dateformat(Date_Go_Live,'mm/dd/yy')#</cfif><cfif NOT len(Date_Go_Live) OR Date_Go_Live LT Today>#dateformat(Project_End,'mm/dd/yy')#</cfif> 
			<cfif len(file_path)></a></cfif>
		</td>
<cfif status EQ 3><td align="center" bgcolor="red" valign="bottom">Red</cfif>
<cfif status EQ 2><td align="center" bgcolor="yellow" valign="bottom">Yellow</cfif>
<cfif status EQ 1><td align="center" bgcolor="green" valign="bottom">Green</cfif>
		</td>

		<td align="center" valign="bottom">
			<cfif eng_status EQ 0>Not Started</cfif>
			<cfif eng_status EQ 1>In Progress</cfif>
			<cfif eng_status EQ 2>Needs QA Review</cfif>
			<cfif eng_status EQ 3>Reviewed - Needs Work</cfif>
			<cfif eng_status EQ 4>Completed</cfif>
			<cfif eng_status EQ 5>On Hold</cfif>
			<cfif eng_status EQ 6>Withdrawn</cfif>
			<cfif eng_status EQ 11>Tecnical Review</cfif>
			<cfif eng_status EQ 12>Being Developed</cfif>
			<cfif eng_status EQ 9>Sent for Content Approval</cfif>
			<cfif eng_status EQ 10>Approved - Not Scheduled</cfif>
			<cfif eng_status EQ 8>Getting LOE</cfif>
			<cfif eng_status EQ 7>Waiting for Financial Approval</cfif>
		</td>

		<td width="25%" valign="top">
			#Vision# <cfif NOT len(vision)>&nbsp;</cfif>
		</td>
		<td valign="top">
			#dateformat(Date_Updated,'mm/dd/yy')#
		</td>
	</tr></cfoutput>
<cfform action="index.cfm?fuseaction=engagement_dashboard">
	<tr>
		<td>&nbsp;</td>
		<td>
			<select name="customer_id_Filter" >
				<option value="all" >All Customers</option><cfoutput query="Get_Engagement_Customers">
				<option value="#customer_id#"<cfif customer_id_Filter EQ customer_id> selected</cfif>>#Description#</option></cfoutput>
			</select>
		</td>
		<td align="left" colspan="100%">
			<select name="IE_Emp_ID_Filter" >
				<option value="all">All IEs</option><cfoutput query="Get_Engagement_IE">
				<option value="#Emp_ID#"<cfif IE_Emp_ID_Filter EQ Emp_ID> Selected</cfif>>#LName#</option></cfoutput>
			</select>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
		<select name="sort">
			<option value="Customers.Description,Project.Description">Select Sort Variable</option>
			<option value="Customers.Description,Project.Description">Customer</option>
			<option value="Customers.description,Project.description DESC">Customer - Desc</option>
			<option value="LName">IE</option>
			<option value="LName Desc">IE - Desc</option>
			<option value="Project_end">Due Date</option>
			<option value="Project_end Desc">Due Date - Desc</option>
			<option value="Status">Status</option>
			<option value="Status DESC">Status - Desc</option>
			<option value="Project.budget">Revenue</option>
			<option value="Project.budget DeSc">Revenue - Desc</option>
			<option value="Project.Date_Updated">Date Updated</option>
			<option value="Project.Date_Updated Desc">Date Updated - Desc</option>
		</select>
		</td>
		<td align="left" colspan="100%">
			<input type="submit" value="Go">
		</td>
	</tr>
</cfform>
	<tr>
		<td colspan="100%" <cfoutput>class="RegText"</cfoutput>>
			<br /><a href="index.cfm?fuseaction=Customers.home&engagement_dashboard_Return=1">Add another engagement to this Dashboard.</a>
		</td>
	</tr>
	