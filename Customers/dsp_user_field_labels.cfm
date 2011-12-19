
<!--Customers/dsp_user_field_labels.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the second step of the 'create new engagement' wizard.
	||
	Name: Jeromy French
	|| 
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:45:56  daugherty
	Initial revision

	Revision 1.2  2001-11-01 16:25:05-05  french
	Made changes that allows workstream to map one custom field to multiple projects.

	Revision 1.1  2001-10-11 10:56:26-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->
<cfparam name="variables.start" default="1">
</cfsilent>
<cfinclude template="qry_get_user_field_types.cfm">
<cfif attributes.req_custom AND (isdefined("attributes.field1") AND attributes.field1 NEQ 0 OR isdefined("attributes.field2") AND attributes.field2 NEQ 0)>
<cfoutput>
	<tr valign="top">
		<td class="RegText#session.workstream_text_size#">
</cfoutput>
		<cfoutput query="get_user_field_types">
			<span class="RegText#session.workstream_text_size#Bd">#user_field_type# custom fields</span><br>
			<cfloop from="1" to="#evaluate("attributes.field#type_id#")#" index="ii">
				Label: <cfinput type="text" name="type_#type_id#_num_#ii#_name" size="15" class="RegText#session.workstream_text_size#"><br>
					<cfif type_id NEQ 2><cfloop from="1" to="8" index="opt_ii">Option value #opt_ii#: <cfinput type="text" name="type_#type_id#_num_#ii#_opt_#opt_ii#" size="15" class="RegText#session.workstream_text_size#"><br>
					</cfloop><p></p></cfif>
			</cfloop>
		</cfoutput>
<cfoutput>
		</td>
		<td width="55%" class="Note#session.workstream_text_size#">
			<ol type="1" start="#variables.start#" class="Note#session.workstream_text_size#">
				<li>Provide the labels for each of your desired custom fields. For drop-down boxes, also provide the possible options, leaving blank any extra 'option value' fields. Any labels left blank will be ignored and will not be applied as custom fields to the engagement.</li><cfset variables.start=incrementvalue(variables.start)>
			</ol>
		</td>
	</tr>
</cfoutput>
<cfelse>
<cfset onload="document.new_engagement.submit();">
<cfoutput>
	<tr valign="top">
		<td class="RegText#session.workstream_text_size#">
			No information to enter for this step.
		</td>
		<td width="55%" class="Note#session.workstream_text_size#">
			If this page does not automatically do so, please submit to the next page.
		</td>
	</tr>
</cfoutput>
</cfif>

