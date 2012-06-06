<!-- Administration/dsp_edit_help_articles.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_help_articles.cfm">
	<responsibilities>
		I display the form for help articles maintenance.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/18/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.help_article_id" default="0">
<cfparam name="attributes.screen_id" default="0">

<cfset variables.active_ind_on=0>
<cfset variables.active_ind_off=1>
<cfif attributes.help_article_id NEQ 0 AND get_help_article.active_ind>
	<cfset variables.active_ind_on=1>
	<cfset variables.active_ind_off=0>
</cfif>

<cfoutput>
<cfform name="form_help_article_entry" action="index.cfm?fuseaction=Administration.edit_help_article" method="post">

<div style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="Manage help article">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.help_article_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> HELP ARTICLE</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Displays form for editing a specific help article.">
			<tr>
				<td colspan="2">
					<label for="help_article_title">Help Article Title</label>:
					<br /><cfif attributes.help_article_id NEQ 0>
						<cfinput type="text" name="help_article_title" id="help_article_title" value="#get_help_article.help_article_title#" size="60" maxlength="60" required="yes" message="Please enter a help article title." />
					<cfelse>
						<cfinput type="text" name="help_article_title" id="help_article_title" value="" size="60" maxlength="60" required="yes" message="Please enter a help article title." />
					</cfif>
				</td>
			<tr>
			<tr>
				<td colspan="2">
					<cfif attributes.help_article_id NEQ 0>
						<cfset variables.help_article_text=trim(get_help_article.help_article_text)>
					<cfelse>
						<cfset variables.help_article_text="">
					</cfif>
					<p id="help_article_text_top">
					<a href="javascript:return false;" onfocus="scroll_and_focus('help_article_text');" title="" style="cursor:default;"><img src="images/bullet1.gif" height="15" width="15" border="0" alt="reposition to top"  /></a>
					<label for="help_article_text">Help Article Text</label>:<br />
					<cftextarea name="help_article_text" id="help_article_text" title="Help Article Text" summary="This textarea includes buttons for formatting entered text. You may make text bold, italicized, bulleted. You may also insert or edit Hyper-Text Markup Language links." cols="90" rows="16" height="600" width="480" richtext="yes" toolbar="Basic" skin="silver" toolbaronfocus="yes" wrap="virtual" value="#variables.help_article_text#"></cftextarea>
					</p>
				</td>
			</tr>
			</tr>
				<td colspan="2">
					<label for="screen_id">This help article applies to these screens</label>:
					<br />
					<cfselect name="screen_id" id="screen_id" query="get_fuseactions" value="screen_id" display="fuseaction" multiple="yes" selected="#attributes.screen_id#" size="5" required="yes" message="Please specify the fuseaction for this requirement." />
				</td>
			</tr>
			<tr>
				<td>
				<cfif attributes.help_article_id EQ 0>
					<input type="hidden" name="active_ind" value="1" />
				<cfelse>
					<span title="describes the purpose of the radio buttons that follow">Active?</span>
					<br /><cfinput type="radio" name="active_ind" id="active_ind_on" value="1" checked="#variables.active_ind_on#"><label for="active_ind_on">Yes</label>
					<cfinput type="radio" name="active_ind" id="active_ind_off" value="0" checked="#variables.active_ind_off#"><label for="active_ind_off">No</label>
				</cfif>
				</td>
				<td><label for="sort_order">Sort Order</label>:
					<br /><cfif attributes.help_article_id NEQ 0>
						<cfinput type="text" name="sort_order" id="sort_order" value="#get_help_article.sort_order#" size="3" maxlength="3" required="yes" validate="integer" message="Please enter a sort order.">
					<cfelse>
						<cfinput type="text" name="sort_order" id="sort_order" value="" size="3" maxlength="3" required="yes" validate="integer" message="Please enter a sort order.">
					</cfif>
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr bgcolor="##dddddd">
		<td align="center">
			<input type="hidden" name="help_article_id" value="#attributes.help_article_id#" />
			<cfif attributes.help_article_id EQ 0>
				<input type="submit" alt="Submit Help Article" name="send_help_article" value="Submit Help Article" />
			<cfelse>
				<cfif get_help_article.active_ind EQ 0>
					You cannot edit an inactive help article<br />
				<cfelse>
					<input type="submit" alt="Update Help Article" name="send_help_article" value="Update Help Article" />
				</cfif>
			</cfif>
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>
