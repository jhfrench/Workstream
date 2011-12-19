
<!-- Administration/pag_list_link_tables.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_list_link_tables.cfm">
	<responsibilities>
	</responsibilities>
		I show a list of link tables that can be administered developers. 
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/10/2007" role="FuseCoder" comments="Created File">
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

<table width="100%" cellpadding="0" cellspacing="0" border="0" summary "table head describes the data held in the table below">
	<tr>
		<th align="left"><h2 style="margin:0px">Administer System LINK Tables</h2></th>
	</tr>
</table>
<img src="images/spacer.gif" alt="" width="560" height="1" /><br />
<table cellspacing="1" cellpadding="3" border="0" bgcolor="#eeeeee" width="100%" summary="Table displays active links navigation">
	<tr valign="top">
		<td>
			<table cellspacing="1" cellpadding="3" border="0" bgcolor="#eeeeee" width="200" summary="Table displys active links">
				<tr>
					<td class="menuHead">List of Active Link Tables:</td>
				</tr>
				<tr>
					<td class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});"><a href="index.cfm?fuseaction=Administration.edit_link_business_function_hier">Link_Business_Function_Hier</a></td>
				</tr>
				<tr>
					<td class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});"><a href="index.cfm?fuseaction=Administration.edit_link_module_privilege">Link_Module_Privilege</a></td>
				</tr>
				<tr>
					<td class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});"><a href="index.cfm?fuseaction=Administration.edit_link_program_year_hierarchy">Link_Program_Year_Hierarchy</a></td>
				</tr>
				<tr>
					<td class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});"><a href="index.cfm?fuseaction=Administration.edit_link_screen_comments">Link_Screen_Comments</a></td>
				</tr>
			</table>
		</td>
		<td>
			<table cellspacing="1" cellpadding="3" border="0" bgcolor="#eeeeee" width="200" summary="Table displays inactive links">
				<tr>
					<th class="menuHead">List of Inactive Link Tables:</th>
				</tr>
				<tr>
					<td class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});"><a href="index.cfm?fuseaction=Administration.edit_link_nsm_variance_explanation">Link_NSM_Variance_Explanation</a></td>
				</tr>
				<tr>
					<td class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});"><a href="index.cfm?fuseaction=Administration.edit_link_screen_help_article">Link_Screen_Help_Article</a></td>
				</tr>
				<tr>
					<td class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});"><a href="index.cfm?fuseaction=Administration.edit_link_screen_requirement">Link_Screen_Requirement</a></td>
				</tr>
				<tr>
					<td class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});"><a href="index.cfm?fuseaction=Administration.edit_link_user_account_status">Link_User_Account_Status</a></td>
				</tr>
			</table>
		</td>
	</tr>
</table>