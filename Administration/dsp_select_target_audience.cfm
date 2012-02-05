<!-- Administration/dsp_select_target_audience.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_select_target_audience.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/23/2009" role="FuseCoder" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>
		</in>
		<passthrough>
		</passthrough>
		<out>
		</out>
	</IO>
</fusedoc>
--->
Select the audience you wish to receive your emal:
<p>
<input type="radio" name="user_type_id" id="user_type_id_1" value="1" onclick="Element.hide('other_options');Element.hide('email_category');" /><label for="user_type_id_1">Core Administration Users</label><br />
<input type="radio" name="user_type_id" id="user_type_id_2" value="2" onclick="Element.hide('other_options');Element.show('email_category');" /><label for="user_type_id_2">NASA Customer Users</label><br />
<input type="radio" name="user_type_id" id="user_type_id_3" value="3" onclick="Element.show('other_options');Element.show('email_category');" /><label for="user_type_id_3">Public Vendor POC Users</label>
</p>
<div id="other_options" style="display:none">
<p>
<cfoutput>
	NASA Business Category:<br />
	<cfloop query="get_ref_business_category">
	<input type="checkbox" name="business_category_id" id="business_category_id_#business_category_id#" value="#business_category_id#" /><label for="business_category_id_#business_category_id#">#description#</label><br />
	</cfloop>
</cfoutput>
	<label for="naics_id"><abbr title="North American Industry Classification Service">NAICS</abbr> Code</label>:<br />
	<cfselect name="naics_id" id="naics_id" query="get_ref_naics" value="naics_id" display="code_description" multiple="yes" size="5"></cfselect><br />
	<label for="state_province_id">State/Foreign Province</label>:<br />
	<cfselect name="state_province_id" id="state_province_id" query="get_ref_state_province" value="state_province_id" display="description" multiple="yes" size="5"></cfselect><br />
</p>
</div>

<div id="email_category" style="display:none">
<cfinclude template="../common_files/dsp_email_category.cfm">
</div>

<div align="center">
	<input type="hidden" name="step" value="2" />
	<input type="submit" value="write your message" />
</div>