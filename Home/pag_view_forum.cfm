<!-- Home/pag_view_forum.cfm
	Author: Lawrence Darrah-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_view_forum.cfm">
	<responsibilities>
		I display the form for editing forum discussions and act (send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="lawrence.e.darrah@nasa.gov" author="Lawrence Darrah" type="create" date="7/24/2007" role="Cold Fusion Developer" comments="Created File">
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
<cfset variables.show_select_message_ind=1>

<cfif isdefined("attributes.delete_forum")>
	<cfquery name="deactivate_discussion" datasource="#application.datasources.main#">
	UPDATE Discussion
	SET active_ind=0
	WHERE discussion_id=#attributes.delete_forum#
	</cfquery>

	<cfif isdefined("attributes.sub_level")>

		<cfif isdefined("attributes.top_level")>
			<cflocation 																																																											url="index.cfm?fuseaction=Home.view_forum&parent_discussion_id=#attributes.top_level#&top_level=#attributes.top_level#">
		<cfelseif attributes.parent_discussion_id EQ 0>
			<cflocation url="index.cfm?fuseaction=Home.view_forum&parent_discussion_id=#attributes.discussion_id#">
		<cfelse>
			<cflocation url="index.cfm?fuseaction=Home.view_forum&parent_discussion_id=#attributes.parent_discussion_id#&top_level=#attributes.top_level#">
		</cfif>

	<cfelse>
		<cflocation url="index.cfm?fuseaction=Home.view_forum&deactivated_entry=yes">
	</cfif>

</cfif>


<cfset attributes.level=0>

<cfmodule template="qry_get_discussion.cfm" parent_discussion_id="0">

<!---  The custom tag should be placed wherever the discussion and form should apear in the app itself...  ie if the navigation is accross the top , include template for nav here then tag below etc.--->
<a name="begin_page_content"></a>
<table align="center" width="100%" cellspacing=3 cellpadding=3 border=0 summary="Table displays discussion navigation">
	<tr>
		<td rowspan="2" valign="top" align="left" bgcolor="044669" width="200" id="Discussion Forum Navigation Bar">
			<div id="discussion_nav" class="discussion_nav">
			<cfif get_discussion.recordcount EQ 0>
				<cfif listfind(variables.allowed_business_function_id, 120)>
					<a href="javascript:new_post(0);" class="mainNav">Insert Initial Discussion</a>
				<cfelse>
					There are currently no discussions in #application.product_name#. If you would like to add a discussion to #application.product_name# please contact Marlana Dorman.
				</cfif>
			<cfelse>
				<cfoutput query="get_discussion">
					<a href="javascript:view_forum(#discussion_id#,#discussion_id#);" class="mainNav">#discussion_title#</a><br/><br/>
				</cfoutput>
				<cfif listfind(variables.allowed_business_function_id, 120)>
					<a href="javascript:new_post(0);" class="mainNav">Start New Topic</a>
				</cfif>
			</cfif>
			</div>
		</td>
		<td align="left" valign="top">
			<!---  displays form for reply entry --->
			<cfif isdefined("attributes.reply_parent_discussion_id")>
				<cfif NOT isdefined("reply_parent_discussion_id")>
					<cfset attributes.parent_discussion_id=0>
				</cfif>
				<cfinclude template="dsp_discussion_form.cfm">
				<cfset variables.show_select_message_ind=0>
			</cfif>
	
			<!--- displays discussion with all Children --->
			<cfif isdefined("attributes.parent_discussion_id")>
	
				<cfmodule template="qry_get_discussion.cfm" discussion_id="#attributes.parent_discussion_id#">
		
				<cfmodule template="qry_get_discussion_attachment.cfm" discussion_id="#get_discussion.discussion_id#">
				<table align="left" cellpadding="5" cellspacing="0" width="700" summary="Table displays discussion threads">
				<cfoutput query="get_discussion">
			
						<tr bgcolor="D7D8DA">
						<!--- for formatting purposes the colspan of the top level must be equivalent to the number of levels defined in the custom tag.  the first td should contain the collapse and expand functionality --->				
							<td valign="top"><div class="forum" id="collapse#discussion_id#" title="icon will collapse or expand the entire discussion thread an all sub topics"><a href="javascript:void(0);" onclick="javascript:blocking('#discussion_id#');" /><img src="images/collapse.gif" alt="icon will collapse or expand discussion entry #discussion_id#" border="0" name="collapse-expand#discussion_id#" /></a></div>
					
							<div class="forum" id="#discussion_id#" title="Top level discussion thread entry">
							Posted By: #created_by# &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #dateformat(created_date, "mm/dd/yyyy")# at #timeformat(created_date, 'h:mm tt')#
							<br />
							#discussion_text#
							<cfif len(get_discussion.link)>
								<br /><i>Supporting Link:</i> <a href="#link#" target="discussion_#discussion_id#">#link#</a>
							</cfif>
						
							<cfif get_discussion_attachment.recordcount NEQ 0>
							<cfloop query="get_discussion_attachment">
								<cfset variables.attachment_link=listlast(attachment_path, "\")>
								<br /><i>Supporting Attachment:</i> <a href="Uploaded_Files/#variables.attachment_link#" target="#discussion_attachment_id#">#variables.attachment_link#</a>
							</cfloop>
							</cfif>
							<br /><a href="index.cfm?fuseaction=Home.view_forum&reply_parent_discussion_id=#discussion_id#&top_level=#discussion_id#">Reply</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<cfif listfind(variables.allowed_business_function_id, 120)><a href="index.cfm?fuseaction=Home.view_forum&parent_discussion_id=#discussion_id#&top_level=#discussion_id#&delete_forum=#discussion_id#" onclick="javascript: return confirm('Are you sure you want to remove this entry and all associated replies?');">Deactivate</a></cfif> <br />
				</cfoutput>
<!---  for fusebox permissions logic the custom tag must pass the variable allowed_business_function_id as an attribute within the custom tag....the permissions before the custom tag has been called and recalled within itself are located in the variables scope --->
				<cf_discussion datasource="discussion"
					parent_discussion_id="#attributes.parent_discussion_id#"
					count="0"
					level="0"
					discussion_definitions="#application.application_specific_settings.discussion_definitions#"
					level_bgcolors="D7D8DA,D7D8DA,D7D8DA,D7D8DA,D7D8DA"
					file_attachments="yes"
					allowed_business_function_id="#variables.allowed_business_function_id#">
				<!--- 4198BC,AAD4E6,CBDCE3,CCCCCC,EEEEEE ---></div>
				</td></tr>
				</table>
			<cfelseif get_discussion.recordcount NEQ 0>
	
				<cfif isdefined("attributes.deactivated_entry")>
				<i><strong>The discussion entry was successfully deactivated!</strong></i><br/><br/>
				</cfif>
				<cfif variables.show_select_message_ind>
					Select a discussion to view from the navigation on the left
				</cfif>
			</cfif>
		</td>
	</tr>
</table>
