<!-- Home/dsp_discussion_form.cfm
	Author: Lawrence Darrah-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_discussion_form.cfm">
	<responsibilities>
		I display the form for the user to add a discussion and an attachment to discussion.
	</responsibilities>
	<properties>
		<history email="lawrence.e.darrah@nasa.gov" author="Lawrence Darrah" type="create" date="7/24/2007" role="FuseCoder" comments="Created File">
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

<cfset variables.full_file_path="#GetDirectoryfromPath(GettemplatePath())#Uploaded_Files">

<cfif isdefined("attributes.post_reply")>

	<cftransaction>
		<cfquery name="insert_discussion" datasource="#application.datasources.main#">
		INSERT INTO Discussion (parent_discussion_id, discussion_category, discussion_title,
			discussion_text, link, created_by)
		VALUES (#attributes.parent_discussion_id#, '#attributes.discussion_category#', '#left(attributes.discussion_text,30)#',
			'#attributes.discussion_text#', '#attributes.link#', #session.user_account_id#)
		</cfquery>

		<!--- get the id of the inserted record --->
		<cfquery name="get_discussion_id" datasource="#application.datasources.main#">
		SELECT CURRVAL('Discussion_discuss_id_SEQ') AS discussion_id
		FROM Dual
		</cfquery>
		<cfset attributes.discussion_id=get_discussion_id.discussion_id>

		<cfif NOT len(file_attachment)>
			<cfset variables.new_file_name="">
			<!--- if NULL skips upload scripts --->
		<cfelse>
			<!---  Upload scripts --->
			<cffile action="UPLOAD" filefield="file_attachment" destination="#variables.full_file_path#" nameconflict="MAKEUNIQUE" mode="660" />

			<!---  for MAC issues takes file saved, checks for extension if no extension in filesaved file, appends extension to file by renameing with cffile, then sets variable name to variables.new_file_name weather its uploaded by a mac or not --->
			<cfset variables.file_list_length=listlen(file.serverfile,".")>
			<cfif variables.file_list_length GT 1>
				<cfset variables.new_file_name="#listdeleteat(file.serverfile, variables.file_list_length, '.')#.#file_type#">
			<cfelse>
				<cfset variables.new_file_name=file.serverfile>
			</cfif>

			<cfquery name="insert_discussion_attachment" datasource="#application.datasources.main#">
			INSERT INTO Discussion_Attachment (discussion_id, attachment_path, original_file_name,
				created_by)
			VALUES (#attributes.discussion_id#, '#variables.new_file_name#', '#attributes.file_attachment#',
				#session.user_account_id#)
			</cfquery>
		</cfif>
	</cftransaction>


	<cfif isdefined("attributes.top_level")>
		<cflocation url="index.cfm?fuseaction=Home.view_forum&parent_discussion_id=#attributes.top_level#&top_level=#attributes.top_level#">
	<cfelseif attributes.parent_discussion_id EQ 0>
		<cflocation url="index.cfm?fuseaction=Home.view_forum&parent_discussion_id=#attributes.discussion_id#">
	<cfelse>
		<cflocation url="index.cfm?fuseaction=Home.view_forum&parent_discussion_id=#attributes.parent_discussion_id#&top_level=#attributes.top_level#">
	</cfif>
</cfif>

<cfmodule template="qry_get_discussion.cfm" discussion_id="#reply_parent_discussion_id#">
<a name="#begin_page_content"></a>
<cfoutput>
	<table align="left" width="500" cellspacing="1" celpadding="1" border="0" bgcolor="silver" summary="Table allows replying of discussion form">
		<tr>
			<td colspan=2>
				<i><strong><cfif reply_parent_discussion_id EQ 0>Enter New Discussion<cfelse>Reply to:  '#left(get_discussion.discussion_text, 50)#...'</cfif></strong></i>
			</td>
		</tr>
		<cfform action="index.cfm?fuseaction=Home.add_forum_message" method="post" enctype="multipart/form-data" name="discussion_entry_form">
			<cfif isdefined("attributes.top_level")>
				<input type="hidden" name="top_level" value="#attributes.top_level#">
			</cfif>
			<input type="hidden" name="parent_discussion_id" value="#reply_parent_discussion_id#" />
			<input type="hidden" name="post_reply" value="yes" />
			<input type="hidden" name="discussion_category" value="work" />
			<tr>
				<td align=right><strong><label for="discussion_text">Text</label>:</strong></td>
				<td>
					<textarea name="discussion_text" cols="35" rows="3" wrap="soft" required="required"></textarea>
				</td>
			</tr>
			<tr>
				<td align=right><strong><label for="link">Supporting Link</label>:</strong></td>
				<td>
					<cfinput type="text" name="link" id="link" size="30" maxlength="50">
				</td>
			</tr>
			<tr>
				<td align=right><label for="file_attachment"><strong>Attachment:</strong></label></td>
				<td>
					<input type="File" size="30" name="file_attachment" id="file_attachment" />
				</td>
			</tr>
			<tr>
				<td align=right><strong><label for="file_type">*File Type</label>:</strong></td>
				<td>
					<select name="file_type" id="file_type">
						<cfloop list="#application.application_specific_settings.allowed_forum_file_types#" index="file_type" delimiters=",">
							<option value="#file_type#">#file_type#</option>
						</cfloop>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan=2 align=right><i><font size=-1>*File name may not contain spaces.</font></i></td>
			</tr>
			<tr>
				<td colspan=2 align=center>
					<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" value="Reset" />
				</td>
			</tr>
		</cfform>
	</table>
</cfoutput>