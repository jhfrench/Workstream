<!-- Administration/dsp_list_help_faqs.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_list_help_faqs.cfm">
	<responsibilities>
		Page displays a list of help faqs.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="9/21/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.help_faq_id" default="0">
<cfparam name="attributes.fuseaction" default="">
<cfparam name="attributes.sort_order" default="0">

<h2>Administer Frequently Asked Questions</h2>
<a href="javascript:edit_listed_help_faq(0);" class="btn">Add a new <abbr title="Frequently Asked Question">FAQ</abbr></a>
<table cols="5" summary="Table displays frequently asked questions that can be edited" class="table table-striped table-bordered table-condensed">
	<thead>
		<tr>
			<th>Question</th>
			<th>Asked By</th>
			<th>Answered By</th>
			<th>Public</th>
			<th>Sort Order</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_all_help_faqs">
		<tr>
			<td scope="column"><a href="javascript:edit_listed_help_faq(#help_faq_id#);" title="Edit this question/answer pair">#question#</a></td>
			<td>#asked_by#</td>
			<td>#answered_by#</td>
			<td>#public_ind#</td>
			<td>#sort_order#</td>
		</tr>
	</cfoutput>
	</tbody>
</table>
