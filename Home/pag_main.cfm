<!-- Home/pag_main.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_main.cfm">
	<responsibilities>
		I display the my ICET page to the user
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="3/15/2009" role="FuseCoder" comments="Created File">
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
---><!--- 
<cfdump var="#application.fusebox.circuits#" /> --->
<cfset variables.circuit_list=listsort(structkeylist(application.fusebox.circuits), "textnocase")>
<cfloop list="#variables.circuit_list#" index="variables.circuit_ii">
	<!--- get module_id --->
	<cfquery name="get_module" datasource="#application.datasources.main#">
	SELECT *
	FROM REF_Module
	WHERE description='#variables.circuit_ii#'
	</cfquery>
	<cfif get_module.recordcount>
		<cfset variables.fuseaction_list=lcase(structkeylist(application.fusebox.circuits[variables.circuit_ii].fuseactions))>
		<cfloop list="#variables.fuseaction_list#" index="variables.fuseaction_ii">
		<cfquery name="get_fuseaction" datasource="#application.datasources.main#">
		SELECT *
		FROM REF_Screen
		WHERE fuseaction='#variables.circuit_ii#.#lcase(variables.fuseaction_ii)#'
		</cfquery>
		<cfif NOT get_fuseaction.recordcount>
			<cfquery name="get_business_function" datasource="#application.datasources.main#">
			SELECT *
			FROM REF_Business_Function
			WHERE description LIKE '%#replace(variables.fuseaction_ii, '_', ' ')#%'
			</cfquery>
			<cfif get_business_function.recordcount>
				<cfset variables.business_function_id=get_business_function.business_function_id>
			<cfelse>
				<cfquery name="insert_business_function" datasource="#application.datasources.main#">
				INSERT INTO REF_Business_Function (description, acronym, require_login_ind,
					default_access_ind, viewable_ind, created_by)
				VALUES ('#replace(variables.fuseaction_ii, '_', ' ')#', '#left(variables.circuit_ii,1)##left(variables.fuseaction_ii,1)#', 1,
					0, 1, #session.user_account_id#)
				</cfquery>
				<cfquery name="get_business_function_id" datasource="#application.datasources.main#">
				SELECT IDENT_CURRENT('REF_Business_Function') AS business_function_id
				</cfquery>
				<cfset variables.business_function_id=get_business_function_id.business_function_id>
			</cfif><!--- 
			<cfoutput>
			INSERT INTO REF_Screen (fuseaction, module_id, business_function_id,
				starting_point_ind, created_by)
			VALUES ('#variables.circuit_ii#.#lcase(variables.fuseaction_ii)#', #get_module.module_id#, #variables.business_function_id#,
				1, #session.user_account_id#)
			</cfoutput>
			<cfabort> --->
			<cfquery name="insert_business_function" datasource="#application.datasources.main#">
			INSERT INTO REF_Screen (fuseaction, module_id, business_function_id,
				starting_point_ind, created_by)
			VALUES ('#variables.circuit_ii#.#lcase(variables.fuseaction_ii)#', #get_module.module_id#, #variables.business_function_id#,
				1, #session.user_account_id#)
			</cfquery>
		</cfif>
		</cfloop>
	</cfif>
</cfloop>
All done...
<!--- 
<cfquery name="get_fuseactions" datasource="#application.datasources.main#">
SELECT *
FROM (
#variables.sql_string#
	) AS New_Fuseactions
WHERE New_Fuseactions.fuseaction NOT IN (SELECT fuseaction FROM REF_Screen)
</cfquery> --->