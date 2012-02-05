<!-- common_files/act_create_development_data.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_create_development_data.cfm">
	<responsibilities>
		I create development data.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="6/19/2007" role="FuseCoder" comments="Created File">
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
<cfswitch expression="#attributes.table_to_populate#">
	<cfcase value="ACCESS_USER_ACCOUNT_GROUPER">
		<cfquery name="get_module_privileges" datasource="#application.datasources.main#">
		SELECT *
		FROM Link_Module_Privilege
		WHERE active_ind=1
			AND module_id=#attributes.module_id#
		</cfquery>

		<cfloop from="1" to="200" index="ii">
			<cfquery name="insert_junk_privileges" datasource="#application.datasources.main#">
			INSERT INTO ACCESS_USER_ACCOUNT_GROUPER (program_year_id, user_account_id, module_id,
				grouper_detail_id, organization_id, privilege_id,
				created_by)
			SELECT 1, #listgetat("1, 2, 3, 4, 6, 7, 8, 9, 13, 17, 18, 19, 21, 22, 23, 24",randrange(1,16))#, module_id,
				#randrange(1,11)#, #randrange(1,60)#, privilege_id,
				1
			FROM Link_Module_Privilege
			WHERE module_id=#attributes.module_id#
				AND rownum BETWEEN 1 AND #randrange(1,get_module_privileges.recordcount)#
			</cfquery>
		</cfloop>
	</cfcase>
</cfswitch>