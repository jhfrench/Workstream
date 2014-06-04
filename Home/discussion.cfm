<!-- Home/discussion.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="discussion.cfm">
	<responsibilities>
		I provide an input for a user to add an attachment.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/24/2007" role="Cold Fusion Developer" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>
			file_attachment: ANY VALUE provides an input for a user to add an attachment IF NO ATTACHMENT INPUT IS NEEDED LEAVE ATTRIBUTE OUT
			file type: REQUIRED IF FILE_ATTACHMENT IS DEFINED comma delimited list WITH NO SPACES BETWEEN COMMAS of file extensions that are allowed to be uploaded as attachment displays a drop box of acceptable file types for user to select (to avoid Mac upload/download issues) IF NO ATTACHMENT INPUT IS NEEDED LEAVE ATTRIBUTE OUT
			level_bgcolors: list of background colors that will correspond to the levels within the discussion forum the Top Level will always be level 0 DO NOT USE # SIGNS in your hex codes as this will cause a ColdFusion Error
		</in>
		<passthrough>

		</passthrough>
		<out>

		</out>
	</IO>
</fusedoc>
--->

<!--- set style levels equal to the attributes count so with each recursion a new style is drawn from sheet --->
<cfif isdefined("attributes.level_bgcolors")>
	<cfset variables.bgcolor_list=listdeleteat(attributes.level_bgcolors, 1, ',')>
</cfif>



<cfset variables.last_level=listlen(attributes.level_bgcolors)>


<cfif isdefined("attributes.level")>
	<cfset attributes.level=attributes.level+1>
</cfif>

<cfmodule template="qry_get_discussion.cfm" parent_discussion_id="#attributes.parent_discussion_id#">

<cfif get_discussion.recordcount EQ 0>
	<cfset attributes.level=attributes.level-1>
</cfif>

<cfset variables.loop_counter=0>

<cfoutput>
<style>
<cfloop query="get_discussion">
.forum#discussion_id# {
	font-family:Arial;
	font-size:12px;
	position:relative;
	left:#attributes.level*10#;
	padding:1px;
	}
</cfloop>
</style>

<cfloop query="get_discussion">

	<cfmodule template="qry_get_discussion_attachment.cfm" discussion_id="#get_discussion.discussion_id#">



	<cfif (attributes.count MOD 2) NEQ 0>
		<cfset attributes.count=attributes.count-1>
	</cfif>

	<cfif attributes.parent_discussion_id EQ 0>
		<cfset attributes.count=0>
	</cfif>


<div class="forum#discussion_id#" title="icon will collapse or expand the #attributes.level# level and all subtopics of the discussion thread" id="collapse#discussion_id#"><a href="##" onclick="blocking('#discussion_id#'); return false;"><i class="icon-zoom-out"></i></div><!--- </td> --->



			<div class="forum#discussion_id#" id="#discussion_id#" title="#attributes.level# level discussion thread">
			Posted By: #created_by# &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #dateformat(created_date, "mm/dd/yyyy")# at #timeformat(created_date, 'h:mm tt')#<br />
			#get_discussion.discussion_text#<br />
			<cfif len(get_discussion.link)>
				<i>Supporting Link: </i><a href="#get_discussion.link#">#get_discussion.link#</a><br />
			</cfif>

			<cfif get_discussion_attachment.recordcount NEQ 0>
			<i>Supporting Attachment: </i>
			<cfloop query="get_discussion_attachment">
				<cfset variables.attachment_link=listlast(attachment_path, '\')>
				<a href="Uploaded_Files/#variables.attachment_link#" target="#discussion_attachment_id#">#variables.attachment_link#</a><br />
			</cfloop>
			</cfif>

			<cfif attributes.level NEQ (variables.last_level-1)>
				<a href="index.cfm?fuseaction=Home.view_forum&reply_parent_discussion_id=#get_discussion.discussion_id#&top_level=#top_level#">Reply</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</cfif><cfif listfind(attributes.allowed_business_function_id, 120)><a href="index.cfm?fuseaction=Home.view_forum&parent_discussion_id=#discussion_id#&top_level=#top_level#&delete_forum=#discussion_id#&sub_level=yes" onclick="return confirm('Are you sure you want to remove this entry and all of it's replies?');">Deactivate</a></cfif>
<!--- for fusebox permissions logic the custom tag must pass the variable allowed_business_function_id as an attribute within the custom tag....the permissions before the custom tag has been called and recalled within itself are located in the variables scope --->
	<cf_discussion
		parent_discussion_id="#get_discussion.discussion_id#"
		count="#incrementvalue(attributes.count)#"
		datasource="#application.datasources.main#"
		level="#attributes.level#"
		discussion_definitions="#application.application_specific_settings.discussion_definitions#"
		level_bgcolors="#attributes.level_bgcolors#"
		allowed_business_function_id="#attributes.allowed_business_function_id#">
</div>
</cfloop>
</cfoutput>
