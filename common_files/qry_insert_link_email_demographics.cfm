<!-- common_files/qry_insert_link_email_demographics.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_link_email_demographics.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="7/23/2009" role="FuseCoder" comments="Created File">
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

<cfscript>
if (NOT isdefined("variables.loop_count")) {
	//accomodate SQL limitation for more than 1000 recipients
	variables.loop_count=ceiling(listlen(attributes.email_recipients_demographics_id)/999);
	variables.working_list=listsort(attributes.email_recipients_demographics_id,"numeric");
	for (variables.grouping_ii=1; variables.grouping_ii LTE variables.loop_count; variables.grouping_ii=variables.grouping_ii+1) {
		if (listlen(variables.working_list) GT 999) {
			variables.delimiter=",#listgetat(variables.working_list,1000)#";
			variables.string_position=find(variables.delimiter, variables.working_list);
			"variables.email_recipients_demographics_id_#variables.grouping_ii#"=left(variables.working_list, variables.string_position-1);
			variables.working_list=right(variables.working_list, len(variables.working_list)-variables.string_position);
		}
		else {
			"variables.email_recipients_demographics_id_#variables.grouping_ii#"=variables.working_list;
		}
	}
}
</cfscript>

<cfquery name="insert_link_email_demographics" datasource="#application.datasources.main#">
INSERT INTO Link_Email_Demographics (email_id, demographics_id, created_by)
SELECT LOG_Email_SEQ.CURRVAL AS email_id, demographics_id, #variables.created_by# AS created_by
FROM Demographics
WHERE 1=0<cfloop from="1" to="#variables.loop_count#" index="variables.grouping_ii">
	OR demographics_id IN (#evaluate("variables.email_recipients_demographics_id_#variables.grouping_ii#")#)</cfloop>
</cfquery>