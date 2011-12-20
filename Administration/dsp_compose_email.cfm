<!-- Administration/dsp_compose_email.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_compose_email.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/23/2009" role="FuseCoder" comments="Created File">
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


<cfoutput>
<label for="reply_to" style="width:100px">Reply To:</label> <cfinput type="text" name="reply_to" id="reply_to" value="smallbusiness@nasa.gov" size="50" maxlength="100" validate="email" message="Please enter properly-formatted email addresses in the reply-to field." /><br />

<label for="send_to" style="width:100px">To:</label>&nbsp;
<cfif get_target_email_audience.recordcount>
	<a onclick="javascript:Element.toggle('target_audience');Element.toggle('show_target_audience');Element.toggle('hide_target_audience');" id="show_target_audience"><img src="images/expand.gif" border="0" alt="Show child details"> Show target audience</a><a onclick="javascript:Element.toggle('target_audience');Element.toggle('show_target_audience');Element.toggle('hide_target_audience');" id="hide_target_audience" style="display:none;"><img src="images/collapse.gif" border="0" alt="Hide child details" /> Hide target audience</a><br />
	<div id="target_audience" style="display:none;">
	<img src="images/spacer.gif" alt="" align="left" height="1" width="100" border="0" />
		<table width="280" summary="Table lists email addresses which qualify based on your selected criteria. If the user has 'opted-out' of receiving emails that fact is noted, and that user will not be sent this message.">
			<tr>
				<th scope="column" align="left">include</th>
				<th scope="column" align="left">email</th>
				<th scope="column" align="left">opted-out</th>
			</tr>
			<cfloop query="get_target_email_audience">
			<tr<cfif currentrow MOD 2> bgcolor="##cccccc"</cfif>>
				<td align="center"><input type="checkbox" name="email_recipients_demographics_id" id="email_recipients_demographics_id#demographics_id#" value="#demographics_id#" <cfif blacklist_ind>disabled="disabled"<cfelse>checked="checked"</cfif> /></td>
				<td align="left" scope="row"><label for="email_recipients_demographics_id#demographics_id#">#email_address#</label></td>
				<td align="center"><cfif blacklist_ind>X<cfelse>&nbsp;</cfif></td>
			</tr>
			</cfloop>
		</table>
	</div>
<cfelse>
	Your criteria returned no potential recipients.<br />
</cfif>

<label for="carbon_copy_to" style="width:100px"><acronym title="Carbon Copy">CC</acronym>:</label> <cfinput type="text" name="carbon_copy_to" id="cc" value="" size="50" maxlength="4000" /><br />

<label for="subject" style="width:100px">Subject:</label> <cfinput type="text" name="subject" id="subject" value="" size="50" maxlength="200" required="yes" message="Please enter a subject." /><br />

<label for="email_body" style="width:100px">Text</label><br />
<cftextarea name="email_body" id="email_body" cols="85" rows="15" required="yes" message="Please enter the text of your email."></cftextarea><br />

<label for="upload_id" style="width:100px">Attach files</label> 
<a onclick="javascript:Element.toggle('upload_frame');Element.toggle('show_upload_frame');Element.toggle('hide_upload_frame');" id="show_upload_frame"><img src="images/expand.gif" border="0" alt="Show child details"> Show Upload</a><a onclick="javascript:Element.toggle('upload_frame');Element.toggle('show_upload_frame');Element.toggle('hide_upload_frame');" id="hide_upload_frame" style="display:none;"><img src="images/collapse.gif" border="0" alt="Hide child details" /> Hide Upload</a><br />

<cfset attributes.upload_source_id=2>
<cfinclude template="../common_files/act_upload.cfm">
<div align="center">
	<iframe id="upload_frame" style="display:none;width:400px; height:210px; border:0px;" frameborder="0" src="index.cfm?fuseaction=common_files.process_upload&upload_source_type_id=2&<cfoutput>user_account_id=#session.user_account_id#&cache_escape=#variables.cache_escape#</cfoutput>" title="Upload documents">
</div>
</iframe>

<div align="center">
	<input type="hidden" name="upload_id" id="upload_id" value="0" />
	<input type="hidden" name="step" value="3" />
	<input type="submit" value="send your message" />
</div>

</cfoutput>