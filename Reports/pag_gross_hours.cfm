
<!--Reports/pag_gross_hours.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the code for the Gross hours report.  I create a report that displays all the hours that the employees have worked in this month.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfinclude template="../common_files/qry_office_select.cfm">
<cfinclude template="../common_files/qry_get_team_select.cfm">
<cfparam name="attributes.month" default="#month(dateadd('M',-1, now()))#">
<cfparam name="attributes.year" default="#year(dateadd('M',-1, now()))#">
<cfset variables.date_open=createodbcdate("#attributes.work_month#/1/#attributes.work_year#")>
<cfset variables.daysinmonth=daysinmonth(variables.date_open)>
<cfset variables.date_closed=createodbcdate("#attributes.work_month#/#daysinmonth(variables.date_open)#/#attributes.work_year#")>
	
<cfinclude template="dsp_form_month_location_employee.cfm">
<cfinclude template="qry_get_gross_hours.cfm">
<cfinclude template="dsp_gross_hours.cfm">