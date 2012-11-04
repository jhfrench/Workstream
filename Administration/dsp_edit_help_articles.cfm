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
<cfoutput>
<cfform name="form_help_article_entry" action="index.cfm?fuseaction=Administration.edit_help_article" method="post" class="form-horizontal">
	<legend><cfif attributes.help_article_id EQ 0>Add new<cfelse>Edit existing</cfif> help article</legend>
	<div class="control-group">
		<label class="control-label" for="help_article_title">Help Article Title</label>
		<div class="controls">
			<cfinput type="text" name="help_article_title" id="help_article_title" value="#get_help_article.help_article_title#" size="60" maxlength="60" required="yes" message="Please enter a help article title." class="span6" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="help_article_text">Help Article Text</label>
		<div class="controls">
			<textarea name="help_article_text" id="help_article_text" title="Help Article Text" cols="90" rows="16" height="600" richtext="yes" toolbar="Basic" wrap="virtual" value="#get_help_article.help_article_text#" class="span6"></textarea>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="screen_id">This help article applies to these screens</label>
		<div class="controls">
			<cfselect name="screen_id" id="screen_id" query="get_fuseactions" value="screen_id" display="fuseaction" multiple="yes" selected="#attributes.selected_screen_id#" size="5" required="yes" message="Please specify the fuseaction for this requirement." class="span6" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="sort_order">Sort Order</label>
		<div class="controls">
			<input type="number" name="sort_order" id="sort_order" value="#attributes.sort_order#" step="1" min="1" required="required" class="span3" />
		</div>
	</div>
<cfif attributes.help_article_id EQ 0>
	<input type="hidden" name="active_ind" value="1" />
<cfelse>
	<div class="control-group">
		<label class="control-label">Active?</label>
		<div class="controls">
			<label for="active_ind_on"><cfinput type="radio" name="active_ind" id="active_ind_on" value="1" checked="#variables.active_ind_on#">Yes</label>
			<label for="active_ind_off"><cfinput type="radio" name="active_ind" id="active_ind_off" value="0" checked="#variables.active_ind_off#">No</label>
			<cfif get_help_article.active_ind EQ 0>
				<div class="alert alert-info">This article is currently inactive, so users will not be able to see it unless you mark it as active.</div>
			</cfif>
		</div>
	</div>
</cfif>
	<div class="form-actions">
		<input type="hidden" name="help_article_id" value="#attributes.help_article_id#" />
		<cfif attributes.help_article_id EQ 0>
			<input type="submit" name="send_help_article" value="Submit Help Article" class="btn btn-primary" />
		<cfelse>
			<input type="submit" name="send_help_article" value="Update Help Article" class="btn btn-primary" />
		</cfif>
		<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
	</div>
</cfform>
</cfoutput>