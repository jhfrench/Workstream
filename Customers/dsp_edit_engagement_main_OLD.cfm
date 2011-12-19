
<!--Customers/dsp_edit_engagement_main.cfm
	Author: Jeromy French  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the list of details that a user can edit on an engagement.
	||
	Name: Jeromy F
	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:45:45  daugherty
	Initial revision

	Revision 1.3  2002-03-29 09:57:58-05  french
	Made ie_emp_id a single select box because the data model does not handle mutiple IEs for one account.

	Revision 1.2  2002-01-28 09:55:02-05  french
	Adding Project.date_go_live.

	||
	END FUSEDOC --->
<cfset variables.start=1>
<cfparam name="Engagement_Dashboard_Return" default="0">
<cfparam name="IE_Emp_ID_Filter" default="All">
<cfparam name="Customers_ID_Filter" default="All">
<cfparam name="Sort" default="Customers.Description,Project.Description">
</cfsilent>
<cfinclude template="qry_get_engagement_main.cfm">
<cfinclude template="qry_get_visible_to.cfm">
<cfinclude template="qry_get_root_codes.cfm">
<cfinclude template="qry_get_companies.cfm">
<cfinclude template="../common_files/qry_get_products.cfm">
<cfform name="task_details" action="index.cfm?fuseaction=edit_engagement" method="post">
<cfoutput>
	<tr bgcolor="##c0c0c0">
		<td align="center" colspan="2" class="SubHeadText#session.workstream_text_size#">
			Engagement Details
		</td>
		<td align="center" class="SubHeadText#session.workstream_text_size#">
			Instructions
		</td>
	</tr>
	<tr valign="top">
		<td colspan="1" class="RegText#session.workstream_text_size#Bd">
			Root Name<br>
			<cfselect name="customers_id" size="1" query="get_root_codes" value="customers_id" selected="#get_engagement_main.customers_id#" required="Yes" display="display" class="RegText#session.workstream_text_size#"></cfselect><br>
			Engagement Name<br>
			<cfinput type="Text" name="description" value="#get_engagement_main.description#" required="Yes" message="Please enter an Engagement Name" class="RegText#session.workstream_text_size#" size="45">
		</td>
		<td class="RegText#session.workstream_text_size#Bd">
			Visible To<br>
			<select name="visible_to" multiple size="4" class="RegText#session.workstream_text_size#"></cfoutput>
				<cfoutput query="get_companies">
					<option value="#company_id#"<cfif listcontains(valuelist(get_visible_to.company_id),company_id)> selected</cfif>>#company#</option>
				</cfoutput><cfoutput>
			</select>
		</td>
		<td width="55%" class="Note#session.workstream_text_size#">
			<ol type="1" start="#variables.start#" class="Note#session.workstream_text_size#">
				<li>Choose a root code and engagement name. Be sure to use a unique name. Also specify which companies' employees should see this engagement.</li><cfset variables.start=incrementvalue(variables.start)>
			</ol>
		</td>
	</tr>
	<tr valign="top">
		<td class="RegText#session.workstream_text_size#Bd">
			IE / Acc Mgmt<br>
			<cfmodule template="../common_files/dsp_team_select.cfm" size="6" select_name="ie_emp_id" emp_id="#get_engagement_main.ie_emp_id#" class="RegText#session.workstream_text_size#">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/file_attach.gif" valign="bottom" width="60" height="20" alt="Associate a file path to this task." border="0"  onclick="window.open('../common_files/index.cfm?fuseaction=file_attach', 'files', 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0,copyhistory=0,width=420,height=210');" tabindex=""> 
<input type="hidden" name="file_path" value="">Timeline: #get_engagement_main.file_path#
		</td>
		<td rowspan="2" colspan="1" class="RegText#session.workstream_text_size#Bd">
			Product<br>
			<cfselect name="product_id" query="get_products" value="product_id" display="product_name" selected="#get_engagement_main.product_id#" required="yes" message="Please choose which product this engagement applies to." size="4" class="RegText#session.workstream_text_size#"></cfselect>
		Status  <select name="active_id" class="RegText#session.workstream_text_size#">
					<option value="1" <cfif get_engagement_main.active_id EQ 1>selected</cfif>>Inactive</option>
					<option value="2" <cfif get_engagement_main.active_id EQ 2>selected</cfif>>Active</option>
				</select>
		</td>
		<td width="55%" class="Note#session.workstream_text_size#">
			<ol type="1" start="#variables.start#" class="Note#session.workstream_text_size#">
				<li>
					Specify which product this engagement will cover.
				</li><cfset variables.start=incrementvalue(variables.start)>
			</ol>
		</td>
	</tr>
	<tr valign="top">
		<td colspan="2" class="RegText#session.workstream_text_size#">
			<span class="RegText#session.workstream_text_size#Bd">Work Dates</span><br>
			Start: <cfinput type="text" name="project_start" value="#DateFormat(get_engagement_main.project_start,"mm/dd/yy")#" required="yes" validate="date" message="Please enter a proper date for which work is to begin on this engagement." size="8" class="RegText#session.workstream_text_size#"> End: <cfinput type="text" name="project_end" value="#DateFormat(get_engagement_main.project_end,"mm/dd/yy")#" required="yes" validate="date" message="Please enter a proper date for which work is to end on this engagement." size="8" class="RegText#session.workstream_text_size#"> <p>
Go Live: <cfinput type="text" name="date_go_live" value="#DateFormat(get_engagement_main.date_go_live,"mm/dd/yy")#" required="no" validate="date" message=" " size="8" class="RegText#session.workstream_text_size#"> Progress: <select name="status" class="RegText#session.workstream_text_size#">
	<option value="0" <cfif get_engagement_main.status EQ 0>selected</cfif>>None</option>
	<option value="1" <cfif get_engagement_main.status EQ 1>selected</cfif>>Green</option>
	<option value="2" <cfif get_engagement_main.status EQ 2>selected</cfif>>Yellow</option>
	<option value="3" <cfif get_engagement_main.status EQ 3>selected</cfif>>Red</option>
</select>
		</td>
		<td width="55%" class="Note#session.workstream_text_size#">
			<ol type="1" start="#variables.start#" class="Note#session.workstream_text_size#">
				<li>Provide the date work is to begin on the project, and the anticipated date that work will stop.</li><cfset variables.start=incrementvalue(variables.start)>
			</ol>
		</td>
	</tr>
	<tr valign="top">
		<td colspan="2" class="RegText#session.workstream_text_size#Bd">
			Project Update<br>
			<textarea cols="60" rows="3" name="vision" class="RegText#session.workstream_text_size#">#
get_engagement_main.vision#</textarea><br>
			Upselling Opportunities<br>
			<textarea cols="60" rows="3" name="mission" class="RegText#session.workstream_text_size#">#
get_engagement_main.mission#</textarea><br>
			Other Notes<br>
			<textarea cols="60" rows="3" name="business_case" class="RegText#session.workstream_text_size#">#
get_engagement_main.business_case#</textarea>
		</td>
		<td width="55%" class="Note#session.workstream_text_size#">
			<ol type="1" start="#variables.start#" class="Note#session.workstream_text_size#">
				<li>Specify the Project Update, Upselling Opportunities and current status for this engagement. These fields are optional, but help clarify the use of the new engagment.</li><cfset variables.start=incrementvalue(variables.start)>
			</ol><br>
			<center><input type="submit" value="Proceed" class="RegText#session.workstream_text_size#"></center><br>
			<ol type="1" start="#variables.start#" class="Note#session.workstream_text_size#">
				<li>Click this button when you are ready to submit any changes you have entered.</li>
			</ol>
		</td>
	</tr>
	<tr valign="top">
		<td align="center" colspan="2" class="RegText#session.workstream_text_size#Bd">
		
		</td>
		<td width="55%" class="Note#session.workstream_text_size#">

		</td>
	</tr>
<input type="hidden" name="project_id" value="#attributes.project_id#">
<input type="hidden" name="option" value="1">
<input type="hidden" name="edit" value="1">
<input type="hidden" name="Engagement_Dashboard_Return" value="#Engagement_Dashboard_Return#">
<input type="hidden" name="Customers_ID_FIlter" value="#customers_id_Filter#">
<input type="hidden" name="IE_Emp_ID_FIlter" value="#IE_Emp_ID_Filter#">
<input type="hidden" name="Sort" value="#sort#">
</cfoutput>
</cfform>


