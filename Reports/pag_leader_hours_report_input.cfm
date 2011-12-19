
<!--Reports/pag_leader_hours_report_input.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
Revision 1.2  2005/09/08 22:12:57  french
Added month/year drop downs to Leadership Hours Report and Personal Hours Summary. Task 35598

Revision 1.1  2005-03-09 13:11:36-05  stetzer
<>

Revision 1.1  2001-10-11 11:04:13-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
</cfsilent>
<cfform action="index.cfm?fuseaction=Leadership_hours" name="leader">
<table border="0" cellpadding="0" cellspacing="2" align="center">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadText#session.workstream_text_size#White" section_color="008080" section_title="Leadership Time Reports" gutter="false" align="center">
			<cfinclude template="dsp_leader_report_select.cfm">
	</cfform>
</table>






