
<!--Customers/dsp_new_project_step1.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the first step of the 'create new project' wizard.
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
<cfinclude template="../common_files/qry_get_ref_billable_type.cfm">
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
			Root Code<br />
			<cfselect name="customer_id" size="1" query="get_root_codes" value="customer_id" required="yes" display="display"></cfselect><br />
			Project Name<br />
			<cfinput type="text" name="description" required="yes" message="Please enter an Project Name">
		</td>
		<td class="RegTextBd">
			Visible To<br />
			<cfselect name="company_id" query="get_companies" value="company_id" display="description" size="4" required="yes" message="Please specify which companies should see this project." multiple="yes"></cfselect>
		</td>
		<td width="55%" class="Note">
			<ol type="1" class="Note">
				<li>Choose a root code and project name. Be sure to use a unique name. Also specify which companies' employees should see this project.</li>
			</ol>
		</td>
	</tr>
	<tr valign="top">
		<td class="RegTextBd">
			Product<br />
			<cfselect name="product_id" query="get_products" value="product_id" display="product_name" required="yes" message="Please choose which product this project applies to." size="4"></cfselect><p>
			<label for="strip_trailing"><input type="checkbox" name="strip_trailing" id="strip_trailing" value="1">Strip trailing digits.</label></p>
		</td>
		<td class="RegTextBd">
			Custom Fields<br />
			<label for="req_custom1"><cfinput type="radio" name="req_custom" value="1" id="req_custom1">This project will use custom fields.</label><br />
<label for="req_custom0"><cfinput type="radio" name="req_custom" checked="yes" value="0" id="req_custom0">No custom fields necessary.</label>
		</td>
		<td class="RegTextBd">
			Billing Type<br />
			<cfselect name="billable_type_id" size="4" query="get_ref_billable_type" value="billable_type_id" display="description" required="yes" message="Please specify the billing type for this project."></cfselect>
		</td>
		<td width="55%" class="Note">
			<ol type="1" start="2" class="Note">
				<li>
					Specify which product this project will cover, and indicate if the project will require any custom data entry. Choose the billing structure for this project:
					</cfoutput>
					<cfoutput query="get_ref_billable_type">
					<br />-#description#
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
				<li>Specify the Project Update, Upselling Opportunities and current status for this project. These fields are optional, but help clarify the use of the new engagment.</li>
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
				<li>Click this button when you are ready to proceed to the next step. The information for this new project will not be stored until the wizard is finished.</li>
			</ol>
		</td>
	</tr>
</cfoutput>
	