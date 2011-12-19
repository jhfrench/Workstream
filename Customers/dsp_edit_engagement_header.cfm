
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
	Revision 1.1  2006/03/31 15:33:31  csy
	task 42741 Modified code to include customer name, engagement name and code to title

	Revision 1.0  2005-02-15 15:45:44-05  daugherty
	Initial revision

	Revision 1.1  2002-04-09 09:47:40-04  french
	Added clsoing <cfsilent> tag.

	Revision 1.0  2002-01-24 16:25:31-05  french
	Initital file creation.

	Revision 1.1  2001-10-11 10:56:24-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->
<cfoutput>
	<tr>
		<td colspan="#variables.colspan#" class="HeadText#session.workstream_text_size#White" bgcolor="008000">
			&nbsp;Edit Engagement for <a href="javascript:engagement_list('#get_customer_name_code.root_code#');" class="HeadText#session.workstream_text_size#White">#get_customer_name_code.project_name#- #get_customer_name_code.Project_Code#</a>
		</td>
	</tr>
</cfoutput>

