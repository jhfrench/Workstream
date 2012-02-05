<!-- common_files/qry_get_comments_type.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_comments_type.cfm">
	<responsibilities>
		I retrieve comments type from REF_Comments_Type table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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

<!--- get list of comment type --->
<cfparam name="attributes.comments_type_id" default="0">
<cfquery name="get_comments_type" datasource="#application.datasources.main#">
SELECT comments_type_id, description,sort_order
FROM REF_Comments_Type
WHERE <cfif attributes.comments_type_id NEQ 0>comments_type_id=#attributes.comments_type_id#<cfelse>active_ind=1</cfif>
ORDER BY sort_order
</cfquery>
<cfset caller.get_comments_type=get_comments_type>