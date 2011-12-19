<!-- Administration/pag_welcome.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_welcome.cfm">
	<responsibilities>
		Page to display navigation links of Administration module.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/17/2007" role="FuseCoder" comments="Created File">
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
<cfset attributes.module_description="">
<cfinclude template="../common_files/qry_get_module_sub_navigation.cfm" />
<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="Table displays administration information">
	<tr>
		<th align="left"><h2 style="margin:0px">Administration</h2>
		</th>
	</tr>
</table><img src="images/spacer.gif" alt="" width="560" height="1" /><br />
<table cellspacing="1" cellpadding="3" border="0" bgcolor="#eeeeee" width="100%" summary="Table displays module navigation">
	<tr valign="top">
		<td>
			<table cellspacing="1" cellpadding="3" border="0" bgcolor="#eeeeee" width="200" summary="Table shows module navigation">
			<cfoutput query="get_module_sub_navigation">
				<tr>
					<td class="menuItem" bgcolor="##eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'##5394bd',endcolor:'##5394bd',restorecolor:'##5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'##999999',endcolor:'##bbbbbb',restorecolor:'##eeeeee'});"><a href="index.cfm?fuseaction=#fuseaction#">#business_function_description#</a></td>
				</tr>
			</cfoutput>
			<cfif NOT comparenocase(application.environment_name,"development")>
				<tr>
					<th class="menuHead">Viewable in development only</th>
				</tr>
				<tr>
					<td class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});"><a href="index.cfm?fuseaction=Administration.clean_up_old_accounts">
Deactivate Old Accounts
</a>(THIS WILL SEND EMAILS, DONT RUN UNLESS YOU'RE SURE EMAILS ARE SCRUBBED)
					</td>
				</tr>
				<tr>
					<th class="menuHead">Admin Tasks</th>
				</tr>
				<tr>
					<td class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});"><a href="index.cfm?fusebox.password=default&fusebox.parse=true&fusebox.load=true">
Reparse Fusebox Application
</a>
					</td>
				</tr>
				<tr>
					<td class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});"><a href="index.cfm?fuseaction=Administration.reset_application_variables">
Reset Application Variables
</a>
					</td>
				</tr>
				<tr>
					<td class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});"><a href="index.cfm?fuseaction=Administration.view_application_variables">
View All Application Variables
</a>
					</td>
				</tr>
				<tr>
					<td class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});"><a href="index.cfm?fuseaction=Administration.administer_sorter_table">
Administer System Sorter Table
</a>
					</td>
				</tr>
				<tr>
					<td class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});"><a href="index.cfm?fuseaction=Administration.list_link_tables">
Administer System LINK Tables
</a>
					</td>
				</tr>
				<tr>
					<td class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});"><a href="index.cfm?fuseaction=Administration.edit_system_note">
Administer System Notes
</a>
					</td>
				</tr>
				<tr>
					<td class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});"><a href="index.cfm?fuseaction=Administration.list_system_notes">
List of System Notes
</a>
					</td>
				</tr>
				<tr>
					<th class="menuHead">Help</th>
				</tr>
				<tr>
					<td class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});"><a href="index.cfm?fuseaction=Administration.edit_help_article">
Add/Edit Articles
</a>
					</td>
				</tr>
				<tr>
					<td class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});"><a href="index.cfm?fuseaction=Administration.list_help_articles">
List Articles
</a>
					</td>
				</tr>
			</cfif>
			</table>
		</td>
	</tr>
</table>
