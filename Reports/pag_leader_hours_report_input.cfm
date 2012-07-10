
<!--Reports/pag_leader_hours_report_input.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfform action="index.cfm?fuseaction=Reports.Leadership_hours" name="leader">
<table border="0" cellpadding="0" cellspacing="2" align="center">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadTextWhite" section_color="008080" section_title="Leadership Time Reports" gutter="false" align="center">
			<cfinclude template="dsp_leader_report_select.cfm">
	</cfform>
</table>






