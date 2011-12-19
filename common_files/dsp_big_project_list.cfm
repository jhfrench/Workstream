
<!--common_files/dsp_big_project_list.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the big team list page that lets the user see more employees at one time (easier scrolling).
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.2  2006/08/11 11:01:43  french
Adding defaults.

Revision 1.1  2005-06-21 10:56:57-04  french
Splitting engagement list into customer and engagement lists. Task 33277

Revision 1.0  2005-02-15 15:41:17-05  daugherty
Initial revision

Revision 1.1  2001-10-11 10:57:57-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfparam name="attributes.default1" DEFAULT="(((((none)))))">
<cfparam name="attributes.default2" DEFAULT="(((((none)))))">
</cfsilent>
	<tr>
		<td>
		Customer<br>
		<cfmodule template="../common_files/two_related_selects.cfm"
				query="get_valid_projects"
				name1="customers_id"
				name2="project_id"
				display1="customer"
				display2="display"
				value1="customers_id"
				value2="project_id"
				multiple1="0"
				multiple2="0"
				default1="#attributes.default1#"
				default2="#attributes.default2#"
				size1="6"
				size2="6"
				width2="600"
				autoselectfirst="no"
				formname="big_list"
				onchange="OKButton()"
				HTMLBetween="<br>Project<br>">
		<!--- 
			<cfoutput><select name="#attributes.formname#" size="#min(get_valid_projects.recordcount,28)#" onChange="OKButton()" class="RegText#session.workstream_text_size#"></cfoutput>
				<cfoutput query="get_valid_projects"><option value="#project_id#"><cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>#project_code# - #customer# #replace(project_name,customer,"","ALL")#<cfelse>#customer# #replace(project_name,customer,"","ALL")# (#project_code#)</cfif></option>
			</cfoutput>
			</select> --->
		</td>
	</tr>

