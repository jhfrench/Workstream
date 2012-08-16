
<!--Reports/dsp_engagement_dashboard_rows_customer.cfm
	Author: Jeromy F -->
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
<cfswitch expression="#status#">
	<cfcase value="1">
		<cfset variables.image="Green_Check.gif">
		<cfset variables.symbollic_color="Green">
	</cfcase>
	<cfcase value="2">
		<cfset variables.image="Yellow_Warning.gif">
		<cfset variables.symbollic_color="Yellow">
	</cfcase>
	<cfcase value="3">
		<cfset variables.image="Red_Flag.gif">
		<cfset variables.symbollic_color="Red">
	</cfcase>
</cfswitch>
	<tr<cfif (currentrow MOD 2) EQ 0> bgcolor="##E1E1E1"</cfif>> 
		<td valign="top">
			<img src="../images/Icons/#variables.image#" width="16" height="15" border="0">
		</td>
		<td width="15%" valign="top">
			#customer_description#<br />#description#
		</td>
		<td valign="top">
			#lname#<cfif NOT len(lname)>&nbsp;</cfif>
		</td>
		<td align="right" valign="top">
		<cfif len(file_path)><a href="http://#REPLACE(file_path,"N:","10.1.1.176/Nuco1")#"></cfif>
			<cfif len(date_go_live)><font color="red">Go-Live: </font>#dateformat(date_go_live,"m/d/yyyy")#</cfif>
			<cfif len(file_path)></a></cfif>
		</td>
		<td align="center" valign="top" bgcolor="#variables.symbollic_color#">
			#variables.symbollic_color#
		</td>
		<td align="center" valign="top">
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
		<td valign="top" width="30%">
			#vision#<cfif NOT len(vision)>&nbsp;</cfif>
		</td>
				<td valign="top" width="30%">
			#mission#<cfif NOT len(mission)>&nbsp;</cfif>
		</td>
		<td align="right" valign="top">
			#dateformat(date_updated,"m/d/yyyy")#
		</td>
	</tr>
</cfoutput>
	