<!-- Help/dsp_view_help_faq.cfm
	Author: Jeromy French -->
<!--- 
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_view_help_faq.cfm">
	<responsibilities>
		I show the Help_Article records associated with the fuseaction of the page the user is viewing.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/18/2007" role="FuseCoder" comments="Created File">
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
<cfsetting showdebugoutput="no">
<cfset attributes.help_faqs_lookup_type_id=1>
<cfinclude template="../common_files/qry_get_screen_help_faqs.cfm">

<cfoutput>
<table cols="1" summary="Table displays the answer to a frequently asked question">
	<tr>
		<td width="224px">
		<cfif get_screen_help_faqs.recordcount>
			#get_screen_help_faqs.answer#
			<img src="images/spacer.gif" alt="" height="80" width="1" border="0" align="right" />
		</cfif>
			<hr />
			<form name="faq_form" id="faq_form" action="javascript:submit_faq();">
				<h3>Don't see what you're looking for?</h3>
				<label for="question">Ask your own question</label> here:<br />
				<textarea name="question" id="question" cols="25" rows="3" wrap="virtual"></textarea><br />
				<input type="checkbox" name="email_requested_ind" id="email_requested_ind" value="1" /><label for="email_requested_ind">Email the response to me</label> <br /><cfif NOT isdefined("session.user_account_id")>
				<label for="asker_email_address">Your email address</label>:<input type="text" name="asker_email_address" id="asker_email_address" value="" size="25" /> <br /></cfif>
				<input type="submit" value="Send" />
			</form>
		</td>
	<tr>
</table>
</cfoutput>