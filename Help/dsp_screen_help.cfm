<!-- Help/dsp_screen_help.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_screen_help.cfm">
	<responsibilities>
		I show the Help_Article records associated with the fuseaction of the page the user is viewing.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/16/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(8/5/11 | JF)
			Instead of loading the help area to the screen then fading it out with the on-load event, we should just load it with style display:none.
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
<cfinclude template="../common_files/qry_get_screen_help_articles.cfm">
<cfinclude template="../common_files/qry_get_screen_help_faqs.cfm">
<cfscript>
if (listfind(variables.allowed_business_function_id, application.help.admin_business_function_id)) {
	variables.help_admin_ind=1;
}
else {
	variables.help_admin_ind=0;
};
variables.tab_class=' class="active"';
variables.tab_content_class=' active in';
</cfscript>
<cfoutput>
	<ul id="help_tabs" class="nav nav-tabs" role="tablist"><cfif application.help.article_active_ind>
		<li#variables.tab_class# role="tab" aria-controls="help_content_article"><a href="##help_content_article" data-toggle="tab" id="button_article"><h4>Articles</h4></a></li><cfset variables.tab_class=""></cfif><cfif application.help.faq_active_ind>
		<li#variables.tab_class# role="tab" aria-controls="help_content_faq"><a href="##help_content_faq" data-toggle="tab" id="button_faq"><h4><abbr title="Frequently Asked Questions">FAQ</abbr>s</h4></a></li></cfif><cfif application.help.search_active_ind>
		<li role="tab" aria-controls="help_content_search"><a href="##help_content_search" data-toggle="tab" id="button_search"><h4>Search</h4></a></li></cfif>
	</ul>
	<div id="help_content" class="tab-content"><cfif application.help.article_active_ind>
		<div id="help_content_article" class="tab-pane fade#variables.tab_content_class#" role="tabpanel">
			<div id="help_top_article" class="help_top">
			<cfif get_screen_help_articles.recordcount EQ 0>
				<h4>There are no articles related to this screen.</h4>
			<cfelse>
				<h4>Articles related to this screen...</h4>
				<ul>
				<!--- display records from query --->
				<cfloop query="get_screen_help_articles">
					<li><a href="index.cfm?fuseaction=Help.view_help_article&help_article_id=#help_article_id#" data-id="#help_article_id#" id="data#help_article_id#" title="Load this help article" class="article">#help_article_title#</a><cfif variables.help_admin_ind>&nbsp;(<a href="index.cfm?fuseaction=Administration.edit_help_article&help_article_id=#help_article_id#" data-id="#help_article_id#" title="Edit this help article" class="edit">edit</a>)</cfif></li>
				</cfloop>
				</ul>
			</cfif>
			</div>
			<div id="help_main_article" class="help_main">
				<cfif get_screen_help_articles.recordcount>
					<cfset variables.help_article_id=get_screen_help_articles.help_article_id>
				<cfelse>
					<cfset variables.help_article_id=0>
				</cfif>
				<script type="text/javascript" language="javascript">
				var default_help=#variables.help_article_id#;
				</script>
			</div>
			<!--- if the user has access to administer help --->
			<cfif variables.help_admin_ind>
				<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_help_article" fuseaction="Administration.edit_help_article" field_name="help_article_id">
				<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="add_help_article" fuseaction="Administration.edit_help_article" field_name="screen_id">
				<p id="help_admin"><a href="javascript:add_help_article(#get_screen_details.screen_id#);" class="btn">Create help article</a> to this screen</p>
			</cfif>
		</div><cfset variables.tab_content_class=""></cfif><cfif application.help.faq_active_ind>
		<div id="help_content_faq" class="tab-pane fade#variables.tab_content_class#" role="tabpanel">
			<div id="help_top_faq" class="help_top">
			<cfif get_screen_help_faqs.recordcount EQ 0>
				<h4>There are no frequently asked questions related to this screen...</h4>
			<cfelse>
				<h4>Frequently asked questions related to this screen...</h4>
				<ul>
				<!--- display records from query --->
				<cfloop query="get_screen_help_faqs">
					<li><a href="index.cfm?fuseaction=Help.view_help_faq&help_faq_id=#help_faq_id#" data-id="#help_faq_id#" title="Load the answer to this question" class="question">#question#</a><cfif variables.help_admin_ind>&nbsp;(<a href="index.cfm?fuseaction=Administration.edit_help_faq&help_faq_id=#help_faq_id#" data-id="#help_faq_id#" title="Edit this question/answer pair" class="edit">edit</a>)</cfif></li>
				</cfloop>
				</ul>
			</cfif>
			</div>
			<div class="help_main">
				<div id="help_main_faq">
					<cfif get_screen_help_faqs.recordcount>
						<cfset variables.help_faq_id=get_screen_help_faqs.help_faq_id>
					<cfelse>
						<cfset variables.help_faq_id=0>
					</cfif>
					<script type="text/javascript" language="javascript">
					var default_faq=#variables.help_faq_id#;
					</script>
				</div>
				<div id="faq_form_container">
					<hr />
					<form name="faq_form" id="faq_form" action="index.cfm?fuseaction=Help.submit_faq" method="post">
						<fieldset>
							<legend id="faq_form_legend">Don't see what you're looking for?</legend>
							<div class="control-group">
								<label id="question_label" class="control-label" for="question">Ask your own question</label>
								<div class="controls">
									<textarea name="question" id="question" cols="25" rows="3" wrap="virtual" required="required"></textarea>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="email_requested_ind">Email the response to me</label>
								<div class="controls">
									<label class="checkbox"><input type="checkbox" name="email_requested_ind" id="email_requested_ind" value="1" /> Yes</label>
								</div>
							</div>
							<cfif NOT (isdefined("variables.user_identification") AND len(session.email_address))>
							<div class="control-group">
								<label class="control-label" for="asker_email_address">Your email address</label>
								<div class="controls">
									<input type="email" name="asker_email_address" id="asker_email_address" value="" placeholder="username@something.com" />
									<p class="help-block">If you want us to email the response to you</p>
								</div>
							</div>
							</cfif>
							<div class="form-actions">
								<input type="hidden" name="screen_id" value="#get_screen_details.screen_id#" />
								<input type="submit" value="Send" class="btn btn-primary" />
							</div>
						</fieldset>
					</form>
				</div>
			</div>
			<!--- if the user has access to administer help --->
			<cfif variables.help_admin_ind>
				<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_help_faq" fuseaction="Administration.edit_help_faq" field_name="help_faq_id">
			</cfif>
		</div></cfif><cfif application.help.search_active_ind>
		<div id="help_content_search" class="tab-pane fade" role="tabpanel">
			<div id="help_top_search" class="help_top">
				<h4>Enter your search criteria then press "Search".</h4>
				<form name="help_search_form" id="help_search_form" action="index.cfm?fuseaction=Help.view_help_search" method="post">
					<div class="control-group">
						<label class="control-label" for="search_string">Enter the words for which you want to search</label>
						<div class="controls">
							<input type="text" name="search_string" id="search_string" placeholder="your search string" value="" />
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<label class="checkbox" for="case_sensitive_ind"><input type="checkbox" name="case_sensitive_ind" id="case_sensitive_ind" value="1" />Case-sensitive</label>
						</div>
					</div>
					<div class="form-actions">
						<input type="submit" value="Search" class="btn btn-primary" aria-controls="help_main_search" />
					</div>
				</form>
			</div>
			<div id="help_main_search" class="help_main">
			</div>
		</div></cfif>
	</div>
</cfoutput>