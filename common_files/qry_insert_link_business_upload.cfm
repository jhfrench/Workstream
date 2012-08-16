<!-- common_files/qry_insert_link_business_upload.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_link_business_upload.cfm">
	<responsibilities>
		I INSERT INTO link_business _upload table
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/21/2009" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_link_business_upload" datasource="#application.datasources.main#">
INSERT INTO Link_Business_Upload (parent_business_id, upload_id, created_by)
VALUES (#attributes.parent_business_id#, #attributes.upload_id#, #session.user_account_id#)
</cfquery>
