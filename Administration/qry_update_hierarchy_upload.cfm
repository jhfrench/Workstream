<!-- Administration/qry_update_hierarchy_upload.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_update_hierarchy_upload.cfm">
	<responsibilities>
		I upload Hierarchy_Upload.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/11/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(jf|11/19/07) Removed join restriction on organization name as per conversation with Brandy Henson
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

<cfquery name="update_hierarchy_upload" datasource="#application.datasources.main#">
<cfswitch expression="#attributes.update_type#">
	<cfcase value="organization_id">
UPDATE Hierarchy_Upload
SET organization_id=(
	SELECT REF_Organization.organization_id
	FROM REF_Organization
	WHERE REF_Organization.active_ind=1
		AND UPPER(REF_Organization.organization_code)=
			CASE
				WHEN ISNULL(Hierarchy_Upload.theme,'.')='.' THEN UPPER(Hierarchy_Upload.mission)
				WHEN ISNULL(Hierarchy_Upload.program,'.')='.' THEN UPPER(Hierarchy_Upload.theme)
				WHEN ISNULL(Hierarchy_Upload.project_wbs,'.')='.' THEN UPPER(Hierarchy_Upload.program)
				ELSE UPPER(Hierarchy_Upload.project_wbs)
			END
	)
WHERE Hierarchy_Upload.organization_id IS NULL
	</cfcase>
	<cfcase value="center_id">
UPDATE Hierarchy_Upload
SET center_id=(
	SELECT REF_Center.center_id
	FROM REF_Center
	WHERE REF_Center.active_ind=1
		AND UPPER(REF_Center.abbvreviation)=UPPER(Hierarchy_Upload.performing_center)
	)
WHERE Hierarchy_Upload.center_id IS NULL
	</cfcase>
</cfswitch>
</cfquery>