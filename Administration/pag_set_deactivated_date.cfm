<!-- Administration/pag_set_deactivated_date.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_set_deactivated_date.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="4/23/2008" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.center_ind" default="0">
<cfparam name="attributes.reset_ind" default="0">

<cfif isdefined("attributes.table_name")>
	<cfsetting requesttimeout="3000">
	<cfif attributes.reset_ind>
		<cfquery name="reset" datasource="#application.datasources.main#">
		UPDATE #attributes.table_name#
		SET active_ind=0,
			deactivated_date=NULL
		WHERE active_ind=0
		</cfquery>
	</cfif>
	
	<cfquery name="get_most_recent" datasource="#application.datasources.main#">
	SELECT organization_id<cfif attributes.center_ind>, ISNULL(center_id,0) AS center_id</cfif>, MAX(created_date) AS deactivated_date
	FROM #attributes.table_name#
	GROUP BY organization_id<cfif attributes.center_ind>, center_id</cfif>
	</cfquery>
		
	<cfloop condition="#get_most_recent.recordcount# NEQ 0">
		<cftransaction>
			<cfloop query="get_most_recent">
				<cfquery name="update_deactivated_date" datasource="#application.datasources.main#">
				UPDATE #attributes.table_name#
				SET active_ind=0,
					deactivated_date=#createodbcdate(deactivated_date)#
				WHERE organization_id=#organization_id#<cfif attributes.center_ind>
					AND ISNULL(center_id,0)=#center_id#</cfif>
					AND #attributes.primary_key#=(
						SELECT MAX(#attributes.primary_key#)
						FROM #attributes.table_name#
						WHERE active_ind=0
							AND organization_id=#organization_id#<cfif attributes.center_ind>
							AND ISNULL(center_id,0)=#center_id#</cfif>
							AND deactivated_date IS NULL
						)
				</cfquery>
			</cfloop>
			<cftransaction action="commit">
		</cftransaction>
	
		<cfquery name="get_remaining_updates" datasource="#application.datasources.main#">
		SELECT COUNT(*) AS count1
		FROM #attributes.table_name#
		WHERE active_ind=0
			AND deactivated_date IS NULL
		</cfquery>
	
		<cfquery name="get_most_recent" datasource="#application.datasources.main#">
		SELECT organization_id<cfif attributes.center_ind>, ISNULL(center_id,0) AS center_id</cfif>, MIN(created_date) AS deactivated_date
		FROM #attributes.table_name#
		WHERE active_ind=0
			AND deactivated_date IS NOT NULL
			AND 0!=#get_remaining_updates.recordcount#
		GROUP BY organization_id<cfif attributes.center_ind>, center_id</cfif>
		</cfquery>
	</cfloop>
</cfif>

<form name="form_set_deactivated_date" action="index.cfm?fuseaction=<cfoutput>#attributes.fuseaction#</cfoutput>" method="post">
<label for="table_name">Table name</label><br /><input type="text" name="table_name" id="table_name" size="40" maxlength="40" value="Internal_Execution_Plan" />
<p></p>
<label for="primary_key">Primary key</label><br /><input type="text" name="primary_key" id="primary_key" size="40" value="i_e_p_id"  maxlength="40"/>
<p></p>
<label for="center_ind">Worry about center?</label><br /><input type="checkbox" name="center_ind" id="center_ind" value="1" checked="checked" />
<p></p>
<label for="reset_ind">Reset all records?</label><br /><input type="checkbox" name="reset_ind" id="reset_ind" value="1" />
<p></p>
<input type="submit" />
</form>