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
if (NOT isdefined("application.use_help_faq_ind")) {
	application.use_help_faq_ind=0;
}
if (NOT isdefined("application.use_help_search_ind")) {
	application.use_help_search_ind=0;
}
variables.button_width=220/(1+application.use_help_faq_ind+application.use_help_search_ind);
if (listfind(variables.allowed_business_function_id, 246)) {
	variables.help_admin_ind=1;
}
else {
	variables.help_admin_ind=0;
}
</cfscript>

<script type="text/javascript" language="javascript">
function submit_faq() {
	var errorMessage='';
	var fieldFocus='';
	
	//if user requests an email response to their FAQ, require that they specify an email address
	console.log($('#faq_form #asker_email_address').val());
	if($('#faq_form #asker_email_address').attr('required') === 'required' && $('#faq_form #asker_email_address').val() === '') {
		errorMessage+='Please enter your email address so we can send the response to you as (you requested).';
		fieldFocus='#asker_email_address';
	};
	
	//require a question
	console.log($('#faq_form #question').val());
	if($('#faq_form #question').val() === '') {
		errorMessage='Please enter your question.\n'+errorMessage;
		fieldFocus='#question';
	};
	
	if( errorMessage !== '') {
		alert(errorMessage);
		$(fieldFocus).focus();
	}
	else {
		$('div #help_main_faq').load(
			'index.cfm?fuseaction=Help.submit_faq #faq_result',
			$('#faq_form').serialize(),
			function(response, status, xhr) {
				if (status == 'error') {
					$('div #help_main_faq').html('<h2>Oh boy</h2><p>Sorry, but there was an error:' + xhr.status + ' ' + xhr.statusText+ '</p>');
				}
				return this;
			}
		);
	}
};

function submit_search() {	
	$('div #help_main_search').load(
		'index.cfm?fuseaction=Help.view_help_search #search_result',
		$('#help_search_form').serialize(),
		function(response, status, xhr) {
			if (status == 'error') {
				$('div #help_main_faq').html('<h2>Oh boy</h2><p>Sorry, but there was an error:' + xhr.status + ' ' + xhr.statusText+ '</p>');
			};
			return this;
		}
	);
};

// <![CDATA[
<!---$issue$: jQuery conversion
//from the search results, open the full selected article
function open_help_detail(article_type_id, article_id) {
	if (article_type_id==1) {
		var poststr="index.cfm?fuseaction=Help.view_help_article&cache_escape=#variables.cache_escape#&help_article_id=" + encodeURI( article_id );
	}
	else {
		var poststr="index.cfm?fuseaction=Help.view_help_faq&cache_escape=#variables.cache_escape#&help_faq_id=" + encodeURI( article_id );
	}
	new Ajax.Updater('help_main_search', poststr, {method:'get',evalScripts:true});
	}
// ]]>
			//refresh the div with result from form submission
			function submit_search() {
				new Ajax.Updater('help_main_search', 'index.cfm?fuseaction=Help.view_help_search&cache_escape=#variables.cache_escape#', {method: 'post', parameters: $('help_search_form').serialize()});
				}
--->
</script>
<cfoutput>
<div id="help_area" role="complementary">
	<div class="menubar"><a href="javascript:void('Close the Workstream help system');" id="help_close" title="close the help section"><img src="images/close.png" align="right" class="closeBox" border="0" alt="close the help section" /></a>Help</div>
	<ul id="help_tabs" class="nav nav-tabs">
		<li class="active"><a href="##help_content_article" data-toggle="tab" id="button_article">Articles</a></li><cfif application.use_help_faq_ind>
		<li class=""><a href="##help_content_faq" data-toggle="tab" id="button_faq"><acronym title="Frequently Asked Questions">FAQ</acronym></a></li></cfif><cfif application.use_help_search_ind>
		<li class=""><a href="##help_content_search" data-toggle="tab" id="button_search">Search</a></li></cfif>
	</ul>
	<div id="help_content" class="tab-content">
		<div id="help_content_article" class="tab-pane fade active in">
			<div id="help_top_article" class="help_top">
			<cfif get_screen_help_articles.recordcount EQ 0>
				<h4>There are no articles related to this screen.</h4>
			<cfelse>
				<h4>Articles related to this screen...</h4>
				<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_help_article" fuseaction="Administration.edit_help_article" field_name="help_article_id">
				<ul>
					<!--- display records from query --->
					<cfloop query="get_screen_help_articles">
						<li><a href="##help_area" onclick="javascript: getHelp('article', #help_article_id#);" title="Load this help article">#help_article_title#</a><cfif variables.help_admin_ind>&nbsp;(<a href="javascript:edit_help_article(#help_article_id#);">edit</a>)</cfif></li>
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
			<!--- if the user have access to administer help --->
			<cfif variables.help_admin_ind>
				<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="add_help_article" fuseaction="Administration.edit_help_article" field_name="screen_id">
				<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="add_help_faq" fuseaction="Administration.edit_help_faq" field_name="screen_id">
				<p id="help_admin"><a href="javascript:add_help_article(#get_screen_details.screen_id#);">Add help article to this screen</a></p>
			</cfif>
		</div><cfif application.use_help_faq_ind>
		<div id="help_content_faq" class="tab-pane fade">
			<div id="help_top_faq" class="help_top">
			<cfif get_screen_help_faqs.recordcount EQ 0>
				<h4>There are no frequently asked questions related to this screen...</h4>
			<cfelse>
				<h4>Frequently asked questions related to this screen...</h4>
				<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_help_faq" fuseaction="Administration.edit_help_faq" field_name="help_faq_id">
				<ul>
					<!--- display records from query --->
					<cfloop query="get_screen_help_faqs">
						<li><a href="##help_area" onclick="getHelp('faq', #help_faq_id#);">#question#</a><cfif variables.help_admin_ind>&nbsp;(<a href="javascript:edit_help_faq(#help_faq_id#);">edit</a>)</cfif></li>
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
					<form name="faq_form" id="faq_form" action="javascript:submit_faq();">
						<fieldset>
							<legend>Don't see what you're looking for?</legend>
							<div class="control-group">
								<label class="control-label" for="question">Ask your own question</label>
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
							<cfif NOT(isdefined("session.user_account_id") AND len(session.email_address))>
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
		</div></cfif><cfif application.use_help_search_ind>
		<div id="help_content_search" class="tab-pane fade">
			<div id="help_top_search" class="help_top">
				<h4>Enter your search criteria then press "Search".</h4>
				<form name="help_search_form" id="help_search_form" action="javascript:submit_search();">
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
						<input type="hidden" name="from_search_ind" id="from_search_ind" value="1" /><!--- $issue$: some day, use this "from_search_ind" field to show question if user clicks on a FAQ entry from search results --->
						<input type="submit" value="Search" class="btn btn-primary" />
					</div>
				</form>
			</div>
			<div class="help_main">
				<div id="help_main_search">
				</div>
			</div>
		</div></cfif>
	</div>
</div>
</cfoutput>