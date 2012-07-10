
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
	 || 
	END FUSEDOC --->
<cfparam name="variables.start" default="1">
</cfsilent>
<cfinclude template="qry_get_user_field_types.cfm">
<cfif attributes.req_custom AND (isdefined("attributes.field1") AND attributes.field1 NEQ 0 OR isdefined("attributes.field2") AND attributes.field2 NEQ 0)>
<cfoutput>
	<tr valign="top">
		<td>
</cfoutput>
		<cfoutput query="get_user_field_types">
			<span class="RegTextBd">#user_field_type# custom fields</span><br />
			<cfloop from="1" to="#evaluate("attributes.field#user_field_type_id#")#" index="ii">
				Label: <cfinput type="text" name="type_#user_field_type_id#_num_#ii#_name" size="15"><br />
					<cfif user_field_type_id NEQ 2><cfloop from="1" to="8" index="opt_ii">Option value #opt_ii#: <cfinput type="text" name="type_#user_field_type_id#_num_#ii#_opt_#opt_ii#" size="15"><br />
					</cfloop><p></p></cfif>
			</cfloop>
		</cfoutput>
<cfoutput>
		</td>
		<td width="55%" class="Note">
			<ol type="1" start="#variables.start#" class="Note">
				<li>Provide the labels for each of your desired custom fields. For drop-down boxes, also provide the possible options, leaving blank any extra 'option value' fields. Any labels left blank will be ignored and will not be applied as custom fields to the engagement.</li><cfset variables.start=incrementvalue(variables.start)>
			</ol>
		</td>
	</tr>
</cfoutput>
<cfelse>
<cfset onload="document.new_engagement.submit();">
<cfoutput>
	<tr valign="top">
		<td>
			No information to enter for this step.
		</td>
		<td width="55%" class="Note">
			If this page does not automatically do so, please submit to the next page.
		</td>
	</tr>
</cfoutput>
</cfif>

