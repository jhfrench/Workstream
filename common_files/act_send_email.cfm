<!-- common_files/act_send_email.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_send_email.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/4/2009" role="FuseCoder" comments="Created File">
			$Id:$
			(1/11/11 | JF)
			Accomodating SQL limitation for more than 1000 recipients.
			(6/6/11 | JF)
			The email server doesn't seem to like large recipient lists, so grouping anything sent to more than 249 people into 250 person lists.
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
	if (NOT isdefined("attributes.email_recipients_demographics_id"))
		attributes.email_recipients_demographics_id=0;
	variables.carbon_copy_to=listchangedelims(attributes.carbon_copy_to,","," ;");
	if (NOT isdefined("attributes.show_message_ind"))
		attributes.show_message_ind=1;
		
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
</cfscript>

<!--- consolidate CC list with recipient list; do not send to emails listed in "Email_Blacklist" table --->
<cfinclude template="qry_get_email_recipients.cfm">

<cfif get_email_recipients.recordcount EQ 0>
	<cfoutput>Your message has no valid recipients, so it cannot be sent<cfif len(attributes.carbon_copy_to)>;<br /> the following recipient(s) have opted out of receiving <abbr title="#application.html_title#">#application.product_name#</abbr> emails:<br /> #variables.carbon_copy_to#</cfif>.</cfoutput>
<cfelse>
	<cfscript>
		if (isdefined("session.user_account_id")) {
			variables.created_by=session.user_account_id;
		}
		else {
			variables.created_by=0;
		}
	</cfscript>
	<!--- LOG_Email --->
	<cfinclude template="act_log_email.cfm">
	
	<cfif len(attributes.upload_id)>
		<!--- Link_Email_Upload --->
		<cfinclude template="qry_insert_link_email_upload.cfm">
		<cfinclude template="qry_get_log_upload.cfm">
		<cfset variables.upload_directory_path="#getdirectoryfrompath(gettemplatepath())#Uploaded_Files">
	</cfif>
	
	<!--- SEND THE MESSAGE --->
	<cfif get_email_recipients.recordcount GT 250>
	<!---if our recipient list is over 250 people, let's chunk the message up--->
		<cfscript>
		//accomodate email server limitation for large recipient lists
		variables.working_list=valuelist(get_email_recipients.email_address);
		variables.loop_count=ceiling(listlen(variables.working_list)/249);
		</cfscript>
		<cfloop from="1" to="#variables.loop_count#" index="variables.grouping_ii">
			<cfscript>
				if (listlen(variables.working_list) GT 249) {
					variables.delimiter=",#listgetat(variables.working_list,250)#";
					variables.string_position=find(variables.delimiter, variables.working_list);
					variables.email_recipients=left(variables.working_list, variables.string_position-1);
					variables.working_list=right(variables.working_list, len(variables.working_list)-variables.string_position);
				}
				else {
					variables.email_recipients=variables.working_list;
				}
			</cfscript>
			<cfinclude template="act_send_prepared_email.cfm">
		</cfloop>
	<cfelse>
		<cfset variables.email_recipients=valuelist(get_email_recipients.email_address)>
		<cfinclude template="act_send_prepared_email.cfm">
	</cfif>
	<cfif attributes.show_message_ind EQ 1>Your message has been sent.</cfif>
</cfif>
