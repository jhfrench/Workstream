<!-- Home/dsp_menu.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_menu.cfm">
	<responsibilities>
		I display navigation links for Home module.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.display_message" default="">
<cfparam name="session.first_name" default="none">
<cfparam name="session.last_name" default="none">
<cfoutput>
<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="Table displays logged in user">
	<tr>
		<td class="menuHead">
			Welcome #session.first_name# #session.last_name#
			<br />#attributes.display_message#
		</td>
	</tr>
</table>
</cfoutput>


<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="table head describes the data held in the tablebelow">
	<tr>
		<th align="left">
			<h2 style="margin:0px" id="top-side">Home</h2>
		</th>
	</tr>
</table>
<img src="images/spacer.gif" alt="" width="560" height="1"><br />
<table cellspacing="1" cellpadding="3" border="0" bgcolor="#eeeeee" width="100%" summary="Table displays menu">
	<tr valign="top">
		<td>
			<table cellspacing="1" cellpadding="3" border="0" bgcolor="#eeeeee" width="200"  summary="table displays menu">
				<tr><td class="menuHead">Home</td></tr>
				<tr><td class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});"><a href="index.cfm?fuseaction=Home.login">Log in </a></td></tr>
				<tr><td class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});"><a href="index.cfm?fuseaction=Home.main">My <cfoutput>#application.product_name#</cfoutput></a></td></tr>
				<tr><td class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});"><a href="index.cfm?fuseaction=Home.change_password">Change your password</a></td></tr>
				<tr><td class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});"><a href="index.cfm?fuseaction=Home.view_forum">View Forum</a></td></tr>
			</table>
		</td>
		<td>
			<table cellspacing="1" cellpadding="3" border="0" bgcolor="#eeeeee" width="200" summary="Table displays requuirement document links">
				<tr><td class="menuHead">Documentation</td></tr>
				<tr><td class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});"><a href="index.cfm?fuseaction=Requirements.requirements_document">Requirements Document</a></td></tr>
			</table>
		</td>
	</tr>
</table>