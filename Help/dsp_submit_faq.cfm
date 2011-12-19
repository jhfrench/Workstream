<!-- Help/dsp_submit_faq.cfm
	Author: Jeromy French -->
<!--- 
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_submit_faq.cfm">
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
<cfset variables.question_processed_ind=0>
<cfif len(attributes.question)>
	<cfinclude template="act_submit_faq.cfm">
</cfif>

<cfoutput>
<table cols="1" summary="Table displays the answer to a frequently asked question">
	<tr>
		<td>
		<cfif variables.question_processed_ind>
			Your questions was submitted and will be answered as soon as possible.<br />
			<img src="images/spacer.gif" alt="" height="210" width="1" border="0" />
		<cfelse>
			<img src="images/spacer.gif" alt="" height="255" width="1" border="0" />
		</cfif>
		<hr />
		<form name="faq_form" id="faq_form" action="javascript:submit_faq();">
			You can also <label for="question">ask your own question</label>:<br />
			<textarea name="question" id="question" cols="25" rows="3" wrap="virtual"></textarea><br />
			<input type="checkbox" name="email_requested_ind" id="email_requested_ind" value="1" /><label for="email_requested_ind">Email the response to me</label> <br />
			<cfif isdefined("attributes.asker_email_address") AND len(attributes.asker_email_address)>
				<input type="hidden" name="asker_email_address" id="asker_email_address" value="#attributes.asker_email_address#" />
			<cfelseif NOT isdefined("session.user_account_id")>
				<label for="asker_email_address">Your email address</label>:<input type="text" name="asker_email_address" id="asker_email_address" value="" size="25" /><br />
			</cfif>
			<input type="submit" value="Send" />
		</form>
		</td>
	<tr>
</table>
</cfoutput>