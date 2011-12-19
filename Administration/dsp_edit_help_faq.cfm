<!-- Administration/dsp_edit_help_faq.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_help_faq.cfm">
	<responsibilities>
		I display the form for faq maintenance.
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

<cfparam name="attributes.help_faq_id" default="0">
<cfparam name="attributes.screen_id" default="0">
<cfparam name="attributes.question" default="">
<cfparam name="attributes.asked_by" default="#session.user_account_id#">
<cfparam name="attributes.email_requested_ind" default="0">
<cfparam name="attributes.asker_email_address" default="">
<cfparam name="attributes.answer" default="">
<cfparam name="attributes.sort_order" default="999">
<cfparam name="attributes.questioner" default="">

<cfscript>
	variables.sort_order="";
	variables.public_ind_on=0;
	variables.public_ind_off=1;
	variables.active_ind_on=0;
	variables.active_ind_off=1;
	if (attributes.help_faq_id NEQ 0) {
		variables.sort_order=get_help_faq.sort_order;
		if (get_help_faq.public_ind) {
			variables.public_ind_on=1;
			variables.public_ind_off=0;
		}
		if (get_help_faq.active_ind) {
			variables.active_ind_on=1;
			variables.active_ind_off=0;
		}
	}
</cfscript>

<cfoutput>
<cfform name="form_help_faq_entry" action="index.cfm?fuseaction=Administration.edit_help_faq" method="post">

<div style="border:1px solid ##999999">
<table cols="2" cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="Manage frequently asked questions">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.help_faq_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> FREQUENTLY ASKED QUESTION</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Displays form for editing a specific frequently asked question.">
			<tr>
				<td colspan="3">
					<label for="question">Question</label>:<br />
					<cfinput type="text" name="question" id="question" value="#attributes.question#" size="60" maxlength="60" required="yes" tabindex="1" message="Please include text for the question.">
				</td>
			<tr>
			<tr>
				<td colspan="3">
					<p id="answer_top">
					<a href="javascript:return false;" onfocus="scroll_and_focus('answer');" title="" style="cursor:default;"><img src="images/bullet1.gif" height="15" width="15" border="0" alt="reposition to top"  /></a>
					<label for="answer">Answer</label>:<br />
					<cftextarea name="answer" id="answer" title="Frequently Asked Question's answer." summary="This textarea includes buttons for formatting entered text. You may make text bold, italicized, bulleted. You may also insert or edit Hyper-Text Markup Language links." cols="90" rows="16" height="600" width="480" richtext="yes" toolbar="Basic" skin="silver" toolbaronfocus="yes" wrap="virtual" value="#attributes.answer#"></cftextarea>
					</p>
				</td>
			</tr>
			<tr>
				<td>
					<span title="describes the purpose of the radio buttons that follow">Let all users see this question?</span>
					<br /><cfinput type="radio" name="public_ind" id="public_ind_on" value="1" checked="#variables.public_ind_on#"><label for="public_ind_on">Yes</label>
					<cfinput type="radio" name="public_ind" id="public_ind_off" value="0" checked="#variables.public_ind_off#"><label for="public_ind_off">No</label>
				</td>
				<td>
				<cfif attributes.help_faq_id EQ 0>
					<input type="hidden" name="active_ind" value="1" />
				<cfelse>
					<span title="describes the purpose of the radio buttons that follow">Is this question/answer pair active?</span>
					<br /><cfinput type="radio" name="active_ind" id="active_ind_on" value="1" checked="#variables.active_ind_on#"><label for="active_ind_on">Yes</label>
					<cfinput type="radio" name="active_ind" id="active_ind_off" value="0" checked="#variables.active_ind_off#"><label for="active_ind_off">No</label>
				</cfif>
				</td>
				<td><label for="sort_order">sort order</label>:
					<br />
						<cfinput type="text" name="sort_order" id="sort_order" value="#get_help_faq.sort_order#" size="3" maxlength="3" required="yes" validate="integer" tabindex="2" message="Please enter a sort order.">
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<label for="screen_id">This question applies to these screens</label>:
					<br />
					<cfselect name="screen_id" id="screen_id" query="get_fuseactions" value="screen_id" display="display" multiple="yes" selected="#attributes.selected_screen_id#" size="5" required="yes" message="Please specify the fuseaction(s) where this frequently asked question and answer pair should be displayed." />
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr bgcolor="##dddddd">
		<td align="center">
			<input type="hidden" name="answered_by" value="#session.user_account_id#" />
			<input type="hidden" name="answered_previously_ind" value="#len(attributes.answer)#" />
			<input type="hidden" name="asked_by" value="#attributes.asked_by#" />
			<input type="hidden" name="asker_email_address" value="#attributes.asker_email_address#" />
			<input type="hidden" name="email_requested_ind" value="#attributes.email_requested_ind#" />
			<input type="hidden" name="help_faq_id" value="#attributes.help_faq_id#" />
			<cfif attributes.email_requested_ind AND len(attributes.asker_email_address)>
				A copy of this response <cfif len(attributes.answer)>has been<cfelse>will also be</cfif> sent to #attributes.asker_email_address#<br />
			<cfelseif NOT len(attributes.asker_email_address)>
				<acronym title="For Your Information">FYI</acronym>: The user <cfif isdefined("attributes.questioner") AND len(attributes.questioner)>(#attributes.questioner#) </cfif>asked to have the response emailed to them, but they did not provide an email address.
			</cfif>
			<cfif attributes.help_faq_id EQ 0>
				<input type="submit" name="send_help_faq" value="Submit FAQ" alt="Submit FAQ" />
			<cfelse>
				<cfif get_help_faq.active_ind EQ 0>
					You cannot edit an inactive help <acronym title="Frequently Asked Question">FAQ</acronym><br />
				<cfelse>
					<input type="submit" name="send_help_faq" value="Update FAQ" alt="Update FAQ" />
				</cfif>
			</cfif>
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>
