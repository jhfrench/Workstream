
<!--Customers/pag_marketing_grid.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the marketing grid for the home of the marketing module.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:51:10  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:47-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 ; (AS|082701) I am changing this based on new requirements from Markting. Have a nice day.
	||
	END FUSEDOC --->
<cfinclude template="qry_get_marketing_data.cfm">
<!--- THIS WAS REMOVED BY ADAM - 082701			<cfinclude template="qry_marketing_grid.cfm"> --->
			<table align="center">
			<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadText#session.workstream_text_size#" section_color="ffffff" section_title="Grid" colspan="1" gutter="false" align="center">
			<cfinclude template="dsp_marketing_form.cfm">
<!--- REMOVED BY ADAM 082701	<cfinclude template="dsp_marketing_sort_form.cfm"> --->
		</table>
			