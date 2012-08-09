
<!--Customers/dsp_new_engagement_step1.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the first step of the 'create new engagement' wizard.
	||
	Name: Jeromy French
	 || 
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_get_root_codes.cfm">
<cfinclude template="qry_get_companies.cfm">
<cfinclude template="qry_get_billable_types.cfm">
<cfinclude template="../common_files/qry_get_products.cfm">
<cfoutput>
<input type="hidden" name="step" value="2">
	<tr bgcolor="##c0c0c0">
		<td align="center" colspan="3" class="SubHeadText">
			Project Details
		</td>
		<td align="center" class="SubHeadText">
			Instructions
		</td>
	</tr>
	<tr valign="top">
		<td colspan="2" class="RegTextBd">
			Root Name<br />
			<cfselect name="customer_id" size="1" query="get_root_codes" value="customer_id" required="yes" display="display"></cfselect><br />
			Project Name<br />
			<cfinput type="text" name="description" required="yes" message="Please enter an Project Name">
		</td>
		<td class="RegTextBd">
			Visible To<br />
			<cfselect name="company_id" query="get_companies" value="company_id" display="description" size="4" required="yes" message="Please specify which companies should see this engagement." multiple="yes"></cfselect>
		</td>
		<td width="55%" class="Note">
			<ol type="1" class="Note">
				<li>Choose a root code and engagement name. Be sure to use a unique name. Also specify which companies' employees should see this engagement.</li>
			</ol>
		</td>
	</tr>
	<tr valign="top">
		<td class="RegTextBd">
			Product<br />
			<cfselect name="product_id" query="get_products" value="product_id" display="product_name" required="yes" message="Please choose which product this engagement applies to." size="4"></cfselect><p>
			<label for="strip_trailing"><input type="checkbox" name="strip_trailing" id="strip_trailing" value="1">Strip trailing digits.</label></p>
		</td>
		<td class="RegTextBd">
			Custom Fields<br />
			<label for="req_custom1"><cfinput type="radio" name="req_custom" value="1" id="req_custom1">This engagement will use custom fields.</label><br />
<label for="req_custom0"><cfinput type="radio" name="req_custom" checked="Yes" value="0" id="req_custom0">No custom fields necessary.</label>
		</td>
		<td class="RegTextBd">
			Billing Type<br />
			<cfselect name="billable_type_id" size="4" query="get_billable_types" value="billable_type_id" display="billable_type" required="yes" message="Please specify the billing type for this engagement."></cfselect>
		</td>
		<td width="55%" class="Note">
			<ol type="1" start="2" class="Note">
				<li>
					Specify which product this engagement will cover, and indicate if the engagement will require any custom data entry. Choose the billing structure for this engagement:
					</cfoutput>
					<cfoutput query="get_billable_types">
					<br />-#billable_type#: #description#
					</cfoutput><cfoutput>
				</li>
			</ol>
		</td>
	</tr>
	<tr valign="top">
		<td colspan="3" class="RegTextBd">
			Project Update<br />
			<textarea cols="60" rows="3" name="vision"></textarea>
		</td>
		<td width="55%" class="Note">
			<ol type="1" start="3" class="Note">
				<li>Specify the Project Update, Upselling Opportunities and current status for this engagement. These fields are optional, but help clarify the use of the new engagment.</li>
			</ol>
		</td>
	</tr>
	<tr valign="top">
		<td colspan="3" class="RegTextBd">
			Upselling Opportunities<br />
			<textarea cols="60" rows="3" name="mission"></textarea>
		</td>
		<td width="55%" class="Note">
			&nbsp;
		</td>
	</tr>
	<tr valign="top">
		<td colspan="3" class="RegTextBd">
			Business Case<br />
			<textarea cols="60" rows="3" name="business_case"></textarea>
		</td>
		<td width="55%" class="Note">
			&nbsp;
		</td>
	</tr>
	<tr valign="top">
		<td align="center" colspan="3" class="RegTextBd">
			<input type="submit" value="Proceed" />
		</td>
		<td width="55%" class="Note">
			<ol type="1" start="4" class="Note">
				<li>Click this button when you are ready to proceed to the next step. The information for this new engagement will not be stored until the wizard is finished.</li>
			</ol>
		</td>
	</tr>
</cfoutput>
	