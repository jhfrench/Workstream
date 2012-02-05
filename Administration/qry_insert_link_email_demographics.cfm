<!-- Administration/qry_insert_link_email_demographics.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_link_email_demographics.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/23/2009" role="FuseCoder" comments="Created File">
			$Id:$
			(1/11/11 | JF)
			Accomodating SQL limitation for more than 1000 recipients.
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
<!---accomodate SQL limitation for more than 1000 recipients--->
<cfset variables.loop_count=ceiling(listlen(attributes.email_recipients_demographics_id)/999)>
<cfset variables.working_list=listsort(attributes.email_recipients_demographics_id,"numeric")>
<cfloop from="1" to="#variables.loop_count#" index="variables.grouping_ii">
	<cfif listlen(variables.working_list) GT 999>
		<cfset variables.delimiter=",#listgetat(variables.working_list,1000)#">
		<cfset variables.string_position=find(variables.delimiter, variables.working_list)>
		<cfset "variables.email_recipients_demographics_id_#variables.grouping_ii#"=left(variables.working_list, variables.string_position-1)>
		<cfset variables.working_list=right(variables.working_list, len(variables.working_list)-variables.string_position)>
	<cfelse>
		<cfset "variables.email_recipients_demographics_id_#variables.grouping_ii#"=variables.working_list>
	</cfif>
</cfloop>

<cfquery name="insert_link_email_demographics" datasource="#application.datasources.main#">
INSERT INTO Link_Email_Demographics (email_id, demographics_id, created_by)
SELECT #attributes.email_id# AS email_id, demographics_id, #variables.created_by# AS created_by
FROM Demographics
WHERE 1=0<cfloop from="1" to="#variables.loop_count#" index="variables.grouping_ii">
	OR demographics_id IN (#evaluate("variables.email_recipients_demographics_id_#variables.grouping_ii#")#)</cfloop>
</cfquery>