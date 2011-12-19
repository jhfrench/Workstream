
<!-- reports/pag_lost_time_input.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the lost time input page. 

	||
	Edits: 
	$Log$
	Revision 1.1  2005/03/09 18:11:42  stetzer
	<>

	||
	Variables:
	
	END FUSEDOC --->
</cfsilent>
<cfset request.dir_level = "../">
<cfinclude template="qry_team_select_by_company.cfm">
<cfinclude template="dsp_lost_time_input.cfm">
