
<!--Customers/dsp_edit_engagement_custom.cfm
	Author: Jeromy French  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the custom fields for an engagement.
	||
	Name: Jeromy F
	||
	Edits:
	$Log$
	Revision 1.3  2006/03/31 21:18:56  csy
	task 42740 Defined and added  attributes variables to form

	Revision 1.2  2005-06-14 17:21:55-04  stetzer
	<>

	Revision 1.1  2005-06-14 17:20:11-04  stetzer
	<>

	Revision 1.0  2005-02-15 15:45:43-05  daugherty
	Initial revision

	Revision 1.3  2001-10-18 13:37:34-04  french
	Corrected typo. Sure am glad I have to comment this.

	Revision 1.2  2001-10-18 12:05:31-04  french
	Moved custom field queries to common_files so they can be used for the Timekeeping module too.

	Revision 1.1  2001-10-11 10:56:33-04  long
	Added $log $ for edits to all CFM files that have fusedocs.

	||
	END FUSEDOC --->
<cfset variables.start=1>
</cfsilent>
<cfparam name="engagement_dashboard_Return" default="0">
<cfparam name="IE_Emp_ID_Filter" default="All">
<cfparam name="Customers_ID_Filter" default="All">
<cfparam name="Sort" default="Customers.Description,Project.Description">
<cfset attributes.req_custom=1>
<cfset attributes.field1=1>
<cfset attributes.field2=1>

<cfinclude template="../common_files/qry_get_user_fields.cfm">
<cfform name="edit_engagement_main" action="index.cfm?fuseaction=Customers.edit_engagement" method="post">
<cfoutput>
	<tr bgcolor="##c0c0c0">
		<td align="center" class="SubHeadText#session.workstream_text_size#">
			Current Custom Fields
		</td>
		<td align="center" class="SubHeadText#session.workstream_text_size#">
			Instructions
		</td>
	</tr>
</cfoutput>
<tr>
	<td>
		<table>
<cfloop query="get_user_fields">
<cfoutput>
	<tr valign="top">
		<td class="RegText#session.workstream_text_size#">
			<label for="retire#user_field_id#">Retire<input type="checkbox"<cfif active_id EQ 1> checked</cfif> name="retire" id="retire#user_field_id#" value="#user_field_id#" class="RegText#session.workstream_text_size#"></label>
		</td>
		<td class="RegText#session.workstream_text_size#">
			#field_title#: <cfif field_type_id EQ 1>
				<cfinclude template="../common_files/qry_get_drop_down_options.cfm">
				<select name="#field_title#" class="RegText#session.workstream_text_size#">
					<cfloop query="get_drop_down_options">
					<option value="#get_drop_down_options.user_field_items_id#">#get_drop_down_options.selection_title#</option>
					</cfloop>
				</select><i>&nbsp;(ID = #user_field_id#)</i>
			<cfelseif field_type_id EQ 2>
				<input type="text" name="display_#get_user_fields.currentrow#" size="8" value="" class="RegText#session.workstream_text_size#"><i>&nbsp;(ID = #user_field_id#)</i>
			</cfif>
		</td>
	</tr>
</cfoutput>
</cfloop>
<cfoutput>
		</table>
			</td>
			<td width="55%" class="Note#session.workstream_text_size#">
				<ol type="1" start="#variables.start#" class="Note#session.workstream_text_size#">
					<li>Click 'retire' checkbox to remove this custom field from displaying on a task for this engagement (archived data will remain in the database). Use the given label fields to make any text changes to form field names and options, but remember that archived data will reflect your changes.</li><cfset variables.start=incrementvalue(variables.start)>
				</ol>
			</td>
	</tr>
	<tr bgcolor="##c0c0c0">
		<td align="center" class="SubHeadText#session.workstream_text_size#">
			New Custom Fields
		</td>
		<td align="center" class="SubHeadText#session.workstream_text_size#">
			Instructions
		</td>
	</tr>
<cfinclude template="dsp_user_field_labels.cfm">
	<tr valign="top">
		<td align="center" class="RegText#session.workstream_text_size#Bd">
			<input type="submit" value="Proceed" class="RegText#session.workstream_text_size#">
		</td>
		<td width="55%" class="Note#session.workstream_text_size#">
			<ol type="1" start="#variables.start#" class="Note#session.workstream_text_size#">
				<li>Click this button when you are ready to submit any changes you have entered.</li>
			</ol>
		</td>
	</tr>
<input type="hidden" name="project_id" value="#attributes.project_id#">
<input type="hidden" name="option" value="3">
<input type="hidden" name="edit" value="1">
<input type="hidden" name="engagement_dashboard_Return" value="#engagement_dashboard_Return#">
<input type="hidden" name="Customers_ID_FIlter" value="#customers_id_Filter#">
<input type="hidden" name="IE_Emp_ID_FIlter" value="#IE_Emp_ID_Filter#">
<input type="hidden" name="Sort" value="#sort#">
</cfoutput>
</cfform>
