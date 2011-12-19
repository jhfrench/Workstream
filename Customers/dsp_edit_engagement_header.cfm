
<!--Customers/dsp_edit_engagement_header.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the engagement menu/details header.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfoutput>
	<tr>
		<td colspan="#variables.colspan#" class="HeadText#session.workstream_text_size#White" bgcolor="008000">
			&nbsp;Edit Engagement for <a href="javascript:engagement_list('#get_customer_name_code.root_code#');" class="HeadText#session.workstream_text_size#White">#get_customer_name_code.project_name#- #get_customer_name_code.Project_Code#</a>
		</td>
	</tr>
</cfoutput>

