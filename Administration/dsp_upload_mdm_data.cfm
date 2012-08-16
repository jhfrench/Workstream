<!-- Administration/dsp_upload_mdm_data.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_upload_mdm_data.cfm">
	<responsibilities>
		I help the user maintain the NSM structure.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="9/18/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="get_bad_hierarchy_upload" datasource="#application.datasources.main#">
SELECT *
FROM Hierarchy_Upload
WHERE parent_organization_id IS NULL
	AND COALESCE(theme,'.')!='.'
ORDER BY COALESCE(project_wbs,'!'), COALESCE(program,'!'), COALESCE(theme,'!'),
	COALESCE(mission,'!')
</cfquery>

<cfif get_bad_hierarchy_upload.recordcount EQ 0 AND variables.error_ind EQ 0>
	All of the records from your file were successfully integrated into the <cfoutput>#application.product_name#</cfoutput> hierarchy structure.
<cfelseif get_bad_hierarchy_upload.recordcount>
	<table border="0" cellpadding="1" cellspacing="0" summary="Table lists all the records that could not be integrated into the <cfoutput>#application.product_name#</cfoutput> NSM structure">
		<tr>
			<td colspan="7" title="table cell describes the data held in thecells below">
				The following records could not be integrated into the <cfoutput>#application.product_name#</cfoutput> hierarchy structure:
			</td>
		</tr>
		<tr>
			<th>Structure Element Title</th>
			<th>Mission</th>
			<th>Theme</th>
			<th>Program</th>
			<th>Project/WBS</th>
			<th>WBS Level</th>
			<th>Performing Center</th>
			<th>Reason</th>
		</tr>
		<cfoutput query="get_bad_hierarchy_upload">
		<cfif len(theme) EQ 0>
			<cfset variables.row_color="00cc66">
		<cfelseif len(program) EQ 0>
			<cfset variables.row_color="66ccff">
		<cfelseif len(project_wbs) EQ 0>
			<cfset variables.row_color="99ffcc">
		<cfelse>
			<cfset variables.row_color="ffffff">
		</cfif>
		<tr bgcolor="###variables.row_color#">
			<td>#structure_element_title#</td>
			<td>#mission#</td>
			<td>#theme#</td>
			<td>#program#</td>
			<td>#project_wbs#</td>
			<td>#wbs_level#</td>
			<td>#performing_center#</td>
			<td><cfif len(theme) EQ 0>Mission records need to be added manually<cfelse>Could not find parent organization</cfif></td>
		</tr>
		</cfoutput>
	</table>
	<p></p>
</cfif>