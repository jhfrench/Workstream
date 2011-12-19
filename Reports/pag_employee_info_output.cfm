
<!--Reports/pag_employee_info_output.cfm
	Author: Joshua Peters  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the form for the HR report output page
	||
	Name: Joshua Peters
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:10:57  stetzer
	<>

	||
	END FUSEDOC --->
</cfsilent>
<script language="javascript" src="../common_files/popWindow.js"></script>
<cfinclude template="qry_get_employee_info.cfm">
<cfinclude template="dsp_employee_info_excel_report.cfm">	
<cfset variables.total_columns = (listlen(attributes.report_elements)) - (listlen(attributes.columns_not_to_print))+1>

<cfform action="index.cfm?fuseaction=Reports.HR_Output" method="POST">
	<cfoutput>
		<table align="center" border="0" cellpadding="4" cellspacing="0">
			<cfmodule template="../common_files/dsp_section_title.cfm" section_title="Employee Information Report" section_color="008080" align="left" colspan="#variables.total_columns#" gutter="0" title_class="HeadText#session.workstream_text_size#White"> 
			<cfinclude template="dsp_employee_info_report.cfm">		
			<tr><td colspan="#variables.total_columns#"><a href="##" onclick="makeFile()" class="RegText#session.workstream_text_size#">Generate To Excel</a></td></tr>			
		</table>
	</cfoutput>
</cfform>