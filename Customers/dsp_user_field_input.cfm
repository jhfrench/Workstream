
<!--Customers/dsp_user_field_input.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I ask the user how many user fields of each available type that they want for an engagement.
	||
	Name: Jeromy French
	|| 
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfinclude template="qry_get_user_field_types.cfm">
	<cfoutput><tr valign="top">
		<td class="RegText#session.workstream_text_size#Bd">
		</cfoutput><cfoutput query="get_user_field_types">
			Number of #lcase(user_field_type)# form fields: <cfinput type="Text" name="field#type_id#" required="Yes" validate="integer" message="Please enter the number (0 if necessary) of desired #lcase(user_field_type)# form fields." size="2" class="RegText#session.workstream_text_size#"><br>
		</cfoutput><cfoutput>
		</td>
		<td width="55%" class="Note#session.workstream_text_size#">
			<ol type="1" start="#variables.start#" class="Note#session.workstream_text_size#">
				<li>For each available form field, specify how many custom fields this engagement requires. You can always add or retire custom fields when editing an engagement.</li><cfset variables.start=incrementvalue(variables.start)>
			</ol>
		</td>
	</tr></cfoutput>

