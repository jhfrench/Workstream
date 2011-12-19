<!-- Administration/dsp_list_help_articles.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_list_help_articles.cfm">
	<responsibilities>
		Page displays a list of help articles.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="9/21/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 7/19/10) Cleaning up verbiage and row coloring.
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
<cfparam name="attributes.fuseaction" default="">
<cfparam name="attributes.sort_order" default="0">

<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="table head describes the data held in the table below">
	<tr>
		<th align="left"><h2 style="margin:0px" id="top-side">Administer Help Articles</h2></th>
	</tr>
	<tr>
		<td align="left" class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});">
			<a href="javascript:edit_listed_help_article(0);">Add new help article</a>
		</td>
	</tr>
</table>

<img src="images/spacer.gif" alt="" width="560" height="1"><br />

<div class="datachart" style="border:1px solid #999999">
<table cols="3" cellpadding="3" cellspacing="0" width="100%" border="0"  summary="Table displays help articles">
	<tr align="left" bgcolor="#999999">
		<th>Title</th>
		<th>Author</th>
		<th>Sort Order</th>
	</tr>
	<cfoutput query="get_all_help_articles">
	<cfif currentrow MOD 2>
		<cfset variables.row_color="eeeeee">
	<cfelse>
		<cfset variables.row_color="dddddd">
	</cfif>
	<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cfdee3';this.style.cursor='hand';" onmouseout="this.bgColor='###variables.row_color#';this.style.cursor='default';" onclick="javascript:Element.toggle('var_id_#currentrow#'); return false;">
		<td><a href="javascript:edit_listed_help_article(#help_article_id#);">#help_article_title#</a></td>
		<td>#first_name# #last_name#</td>
		<td>#sort_order#</td>
	</tr>
	</cfoutput>
</table>
</div>
