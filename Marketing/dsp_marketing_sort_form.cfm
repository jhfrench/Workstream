<!--Marketing/dsp_marketing_sort_form.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the form that allows the gfgrid to have filters applied to them.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:50:53  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:58-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	Variables:
	END FUSEDOC --->

</cfsilent>
<table align="center"> 
<tr>
<cfform name="Filter" action="index.cfm?fuseaction=Marketing">

<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
<select name="SortBy1"  class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
<option value = "None" selected>No Filter</option>
<option Value="project.project_code">Project Code</option>
<option value="project.description">CustomerName</option>
<option value="task.Name">Task Name</option>
</select>
<input type="text" name="SortBy1stuff" size="25" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>"></td>
</tr>
<tr>
<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
<select name="SortBy2andor" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
<option value = "and" selected>and</option>
<option value = "or" >or</option>
</select>
<select name="SortBy2" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
<option value = "None" selected>No Filter</option>
<option Value="project.project_code">Project Code</option>
<option value="project.description">CustomerName</option>
<option value="task.Name">Task Name</option>
</select>
<input type="text" name="SortBy2stuff" size="25" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>"></td>
</tr>
<tr>
<td>
<select name="SortBy3andor" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
<option value = "and" selected>and</option>
<option value = "or" >or</option>
</select>
<select name="SortBy3" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
<option value = "None" selected>No Filter</option>
<option Value="project.project_code">Project Code</option>
<option value="project.name">CustomerName</option>
<option value="task.Name">Task Name</option>
</select>
<input type="text" name="SortBy3stuff" size="25" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>"></td>
</tr>

<tr align="center">
<td colspan="2">
<input type="submit" value="Apply Filter" name="Submit2" tabindex="3" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
</td>
</cfform>
</tr>
</table>