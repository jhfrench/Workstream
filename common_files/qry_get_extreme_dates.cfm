
<!--common_files/qry_get_extreme_dates.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the date for the earliest and latest time entries for all companies that the user is allowed to see.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	END FUSEDOC --->
<cfquery name="get_extreme_dates" datasource="#application.datasources.main#">
SELECT MIN(Time_Entry.work_date) AS min_date, MAX(Time_Entry.work_date) AS max_date
FROM Time_Entry
	INNER JOIN Link_Company_User_Account ON Time_Entry.user_account_id=Link_Company_User_Account.user_account_id
WHERE Time_Entry.active_ind=1
	AND Link_Company_User_Account.company_id IN (#session.workstream_selected_company_id#)
</cfquery>
</cfsilent>