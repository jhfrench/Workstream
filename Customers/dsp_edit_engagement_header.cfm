
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
</cfsilent>
<cfoutput>
	<tr>
		<td colspan="#variables.colspan#" class="HeadTextWhite" bgcolor="008000">
			&nbsp;Edit Project for <a href="javascript:engagement_list('#get_customer_name_code.root_code#');" class="HeadTextWhite">#get_customer_name_code.project_name#- #get_customer_name_code.project_code#</a>
		</td>
	</tr>
</cfoutput>

