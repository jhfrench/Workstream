
<!--Directory/dsp_phone_email_column.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the employee details entry and edit form.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
				<table>
			<cfif get_phone_types.recordcount>
					<tr>
						<td align="left" class="RegTextBd">Phone Number</td>
						<td></td>
					</tr>
				<cfoutput query="get_phone_types">
					<tr>
						<td align="right" class="RegText">#phone_type#:</td>
						<td class="RegText"><cfinput name="phone_#phone_type_id#"  value="#evaluate("phone_#phone_type_id#")#" message="Please enter a properly formatted #phone_type# phone number." validate="telephone" size="11" class="RegText">&nbsp;ext.<cfinput name="phone_#phone_type_id#_ext" required="no" value="#evaluate("phone_#phone_type_id#_ext")#" message="Please enter the #phone_type# extension as a number." validate="integer" size="5" class="RegText"></td>
					</tr>
				</cfoutput>
			</cfif>
			<cfif get_email_types.recordcount>
					<tr>
						<td align="left" class="RegTextBd">Email Address</td>
						<td></td>
					</tr>
				<cfoutput query="get_email_types">
					<tr>
						<td align="right" class="RegText">#email_type#</td>
						<td><cfinput type="text" name="email_#email_type_id#"  class="RegText" value="#evaluate("email_#email_type_id#")#"></td>					</tr>
				</cfoutput>
			</cfif>
				</table>

