<!-- Administration/dsp_edit_help_faq.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_help_faq.cfm">
	<responsibilities>
		I display the form for FAQs maintenance.
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

<cfoutput>
<cfform name="form_faq_entry" action="index.cfm?fuseaction=Administration.edit_help_faq" method="post" class="form-horizontal">
	<legend><cfif attributes.help_faq_id EQ 0>Add new<cfelse>Edit existing</cfif> <abbr title="Frequently Asked Question">FAQ</abbr></legend>
	<div class="control-group">
		<label class="control-label" for="question">Question</label>
		<div class="controls">
				<cftextarea name="question" id="question" title="Frequently Asked Question's answer." summary="This textarea includes buttons for formatting entered text. You may make text bold, italicized, bulleted. You may also insert or edit Hyper-Text Markup Language links." cols="90" rows="8" height="300" width="480" richtext="yes" toolbar="Basic" skin="silver" toolbaronfocus="yes" wrap="virtual" value="#get_help_faq.question#" required="yes" message="Please include text for the question."></cftextarea>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="answer">Answer</label>
		<div class="controls">
			<cftextarea name="answer" id="answer" title="Frequently Asked Question's answer." summary="This textarea includes buttons for formatting entered text. You may make text bold, italicized, bulleted. You may also insert or edit Hyper-Text Markup Language links." cols="90" rows="16" height="600" width="480" richtext="yes" toolbar="Basic" skin="silver" toolbaronfocus="yes" wrap="virtual" value="#get_help_faq.answer#"></cftextarea>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">Let all users see this question?</label>
		<div class="controls">
			<label for="public_ind_on"><cfinput type="radio" name="public_ind" id="public_ind_on" value="1" checked="#variables.public_ind_on#">Yes</label>
				<label for="public_ind_off"><cfinput type="radio" name="public_ind" id="public_ind_off" value="0" checked="#variables.public_ind_off#">No</label>
			<cfif get_help_faq.active_ind EQ 0>
				<div class="alert alert-info">This article is currently inactive, so users will not be able to see it unless you mark it as active.</div>
			</cfif>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="screen_id">This <abbr title="Frequently Asked Question">FAQ</abbr> applies to these screens</label>
		<div class="controls">
			<cfselect name="screen_id" id="screen_id" query="get_fuseactions" value="screen_id" display="fuseaction" multiple="yes" selected="#attributes.selected_screen_id#" size="5" required="yes" message="Please specify the fuseaction for this requirement." class="span6" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="sort_order">Sort Order</label>
		<div class="controls">
			<cfinput type="text" name="sort_order" id="sort_order" value="#attributes.sort_order#" size="3" maxlength="3" required="yes" validate="integer" message="Please enter a sort order." class="span3">
		</div>
	</div>
<cfif attributes.help_faq_id EQ 0>
	<input type="hidden" name="active_ind" value="1" />
<cfelse>
	<div class="control-group">
		<label class="control-label">Active?</label>
		<div class="controls">
			<label for="active_ind_on"><cfinput type="radio" name="active_ind" id="active_ind_on" value="1" checked="#variables.active_ind_on#">Yes</label>
			<label for="active_ind_off"><cfinput type="radio" name="active_ind" id="active_ind_off" value="0" checked="#variables.active_ind_off#">No</label>
			<cfif get_help_faq.active_ind EQ 0>
				<div class="alert alert-info">This article is currently inactive, so users will not be able to see it unless you mark it as active.</div>
			</cfif>
		</div>
	</div>
</cfif>
<cfif attributes.email_requested_ind AND NOT attributes.answered_previously_ind>
	<div class="alert">
		 <cfif len(get_help_faq.asker_email_address)>
			A copy of this response will also be sent to #get_help_faq.asker_email_address#<br />
		<cfelse>
			<abbr title="For Your Information">FYI</abbr>: The user asked to have the response emailed to them, but they did not provide an email address.
		</cfif>
	</div>
</cfif>
	<div class="form-actions">
		<input type="hidden" name="answered_by" value="#session.user_account_id#" />
		<input type="hidden" name="answered_previously_ind" value="#attributes.answered_previously_ind#" />
		<input type="hidden" name="asked_by" value="#attributes.asked_by#" />
		<input type="hidden" name="asker_email_address" value="#get_help_faq.asker_email_address#" />
		<input type="hidden" name="email_requested_ind" value="#attributes.email_requested_ind#" />
		<input type="hidden" name="help_faq_id" value="#attributes.help_faq_id#" />
		<cfif attributes.help_faq_id EQ 0>
			<input type="submit" name="send_faq" value="Submit Frequently Asked Question" class="btn btn-primary" />
		<cfelse>
			<input type="submit" name="send_faq" value="Update Frequently Asked Question" class="btn btn-primary" />
		</cfif>
		<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
	</div>
</cfform>
</cfoutput>
