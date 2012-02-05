<!-- Help/dsp_screen_help.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_screen_help.cfm">
	<responsibilities>
		I show the Help_Article records associated with the fuseaction of the page the user is viewing.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="7/16/2007" role="FuseCoder" comments="Created File">
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
<cfinclude template="../common_files/qry_get_screen_help_articles.cfm">
<cfinclude template="../common_files/qry_get_screen_help_faqs.cfm">
<cfparam name="application.use_help_faq_ind" default="0">
<cfparam name="application.use_help_search_ind" default="0">
<cfset variables.button_width=220/(1+application.use_help_faq_ind+application.use_help_search_ind)>
<cfoutput>
<script type="text/javascript" language="javascript">
// <![CDATA[

function show_articles() {
	new Effect.Morph('button_article', {
	  style: 'background-color:##ecf2f5; border-bottom-width:0px;', // CSS Properties
	  duration: 0.1 // Core Effect properties
	});
	Element.show('help_top_articles');
	Element.show('help_main_articles');<cfif listfind(variables.allowed_business_function_id, 246)>
	Element.show('help_foot_articles');</cfif>
	return false;
	}
	
function hide_articles() {
	new Effect.Morph('button_article', {
	  style: 'border-bottom-width:1px; background-color:##bbbbbb;', // CSS Properties
	  duration: 0.1 // Core Effect properties
	});
	Element.hide('help_top_articles');
	Element.hide('help_main_articles');<cfif listfind(variables.allowed_business_function_id, 246)>
	Element.hide('help_foot_articles');</cfif>
	return false;
	}

function show_faqs() {
	new Effect.Morph('button_faq', {
	  style: 'background-color:##ecf2f5; border-bottom-width: 0px;', // CSS Properties
	  duration: 0.1 // Core Effect properties
	});
	Element.show('help_top_faqs');
	Element.show('help_main_faqs');
	return false;
	}

function hide_faqs() {
	new Effect.Morph('button_faq', {
	  style: 'border-bottom-width: 1px; background-color:##bbbbbb;', // CSS Properties
	  duration: 0.1 // Core Effect properties
	});
	Element.hide('help_top_faqs');
	Element.hide('help_main_faqs');
	return false;
	}
	
function show_search() {
	new Effect.Morph('button_search', {
	  style: 'background-color:##ecf2f5; border-bottom-width: 0px;', // CSS Properties
	  duration: 0.1 // Core Effect properties
	});
	Element.show('help_top_search');
	Element.show('help_main_search_results');
	return false;
	}
	
function hide_search() {
	new Effect.Morph('button_search', {
	  style: 'border-bottom-width: 1px; background-color:##bbbbbb;', // CSS Properties
	  duration: 0.1 // Core Effect properties
	});
	Element.hide('help_top_search');
	Element.hide('help_main_search_results');
	return false;
	}
	
//submit the user's question
function submit_faq() {
	new Ajax.Updater('help_main_faqs', 'index.cfm?fuseaction=Help.submit_faq&screen_id=#get_screen_details.screen_id#&cache_escape=#variables.cache_escape#', {method: 'post', parameters: $('faq_form').serialize()});
	}

//from the search results, open the full selected article
function open_help_detail(article_type_id, article_id) {
	if (article_type_id==1) {
		var poststr="index.cfm?fuseaction=Help.view_help_article&cache_escape=#variables.cache_escape#&help_article_id=" + encodeURI( article_id );
	}
	else {
		var poststr="index.cfm?fuseaction=Help.view_help_faq&cache_escape=#variables.cache_escape#&help_faq_id=" + encodeURI( article_id );
	}
	new Ajax.Updater('help_main_search_results', poststr, {method:'get',evalScripts:true});
	}
// ]]>
</script>
<div id="help_area" class="sys_messages" style="margin-right:0px;">
	<table class="formname" border="0" cellpadding="0" cellspacing="0" bgcolor="##d1dee5" cols="3" width="100%" summary="Table to display help articles, frequently asked questions, and a capability to search either category.">
		<thead>
			<tr valign="top" align="center">
				<th colspan="3" class="menubar"><a href="javascript:void(Element.hide('help_area');)" onclick="Element.hide('help_area');" title="close the help section"><img src="images/close.png" align="right" class="closeBox" border="0" alt="close the help section" /></a>Help</th>
			</tr><cfif application.use_help_faq_ind+application.use_help_search_ind>
			<tr>
				<th id="button_article" style="background-color:##fcf2f5; border:1px solid black; width:#variables.button_width#px;"><a href="##button_article_a" onclick="javascript:show_articles();hide_faqs();hide_search();" name="button_article_a" style="text-decoration:none; cursor: pointer;">Articles</a></th>
				<cfif application.use_help_faq_ind><th id="button_faq" style="background-color:##bbbbbb; border:1px solid black; width:#variables.button_width#px;"><a href="##button_faq_a" onclick="javascript:hide_articles();show_faqs();<cfif application.use_help_search_ind>hide_search();</cfif>" name="button_faq_a" style="text-decoration:none; cursor: pointer;"><abbr title="Frequently Asked Questions">FAQ</abbr></a></th></cfif>
				<cfif application.use_help_search_ind><th id="button_search" style="background-color:##bbbbbb; border:1px solid black; width:#variables.button_width#px;"><a href="##button_search_a" onclick="javascript:hide_articles();<cfif application.use_help_faq_ind>hide_faqs();</cfif>show_search();" name="button_search_a" style="text-decoration:none; cursor: pointer;">Search</a></th></cfif>
			</tr></cfif>
		</thead>
		<tbody>
			<!--- top part shows the selections available --->
			<tr valign="top" align="left">
				<td bgcolor="##ecf2f5" colspan="3">
					<div id="help_top" style="float:left; width:220px; height:120px; overflow:hidden;">
						<div id="help_top_articles">
							<strong><cfif get_screen_help_articles.recordcount EQ 0>There are no a<cfelse>A</cfif>rticles related to this screen...</strong>
							<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_help_article" fuseaction="Administration.edit_help_article" field_name="help_article_id">
							<ul>
								<!--- display records from query --->
								<cfloop query="get_screen_help_articles">
									<li><a href="javascript:void(new Ajax.Updater('help_main_articles','index.cfm?fuseaction=Help.view_help_article&help_article_id=#help_article_id#',{method:'get',evalScripts:true});)" onclick="new Ajax.Updater('help_main_articles','index.cfm?fuseaction=Help.view_help_article&help_article_id=#help_article_id#',{method:'get',evalScripts:true});">#help_article_title#</a><cfif listfind(variables.allowed_business_function_id, 246)>&nbsp;(<a href="javascript:edit_help_article(#help_article_id#);">edit</a>)</cfif></li>
								</cfloop>
							</ul>
						</div><cfif application.use_help_faq_ind>
						<div id="help_top_faqs" style="display:none;">
							<strong><cfif get_screen_help_faqs.recordcount EQ 0>There are no f<cfelse>F</cfif>requently asked questions related to this screen...</strong>
							<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_help_faq" fuseaction="Administration.edit_help_faq" field_name="help_faq_id">
							<ul>
								<!--- display records from query --->
								<cfloop query="get_screen_help_faqs">
									<li><a href="javascript:void(new Ajax.Updater('help_main_faqs','index.cfm?fuseaction=Help.view_help_faq&help_faq_id=#help_faq_id#',{method:'get',evalScripts:true});)" onclick="new Ajax.Updater('help_main_faqs','index.cfm?fuseaction=Help.view_help_faq&help_faq_id=#help_faq_id#',{method:'get',evalScripts:true});">#question#</a><cfif listfind(variables.allowed_business_function_id, 246)>&nbsp;(<a href="javascript:edit_help_faq(#help_faq_id#);">edit</a>)</cfif></li>
								</cfloop>
							</ul>
						</div></cfif><cfif application.use_help_search_ind>
						<div id="help_top_search" style="display:none;">
							<script type="text/javascript" language="javascript">
							// <![CDATA[					
							//refresh the div with result from form submission
							function submit_search() {
								new Ajax.Updater('help_main_search_results', 'index.cfm?fuseaction=Help.view_help_search&cache_escape=#variables.cache_escape#', {method: 'post', parameters: $('help_search_form').serialize()});
								}
						
							// ]]>
							</script>
							<form name="help_search_form" id="help_search_form" action="javascript:submit_search();">
								<label for="search_string">Type the words for which you want to search</label><input type="text" name="search_string" id="search_string" value="" /><br />
								<label for="case_sensitive_ind">Case-sensitive</label> <input type="checkbox" name="case_sensitive_ind" id="case_sensitive_ind" value="1" /><br />
								<input type="hidden" name="from_search_ind" id="from_search_ind" value="1" /><!--- $issue$: some day, use this "from_search_ind" field to show question if user clicks on a FAQ entry from search results --->
								<input type="submit" value="Search" />
							</form>
						</div></cfif>
					</div>
					<div id="help_track_top" style="float: left; width: 2px;height: 120px; margin-left: 16px; background-color: ##aaa;">
						<div id="help_handle_top" style="width: 3px; height: 20px; background-color:##387da2; cursor: move;"></div>
					</div>
					<script type="text/javascript" language="javascript">
					// <![CDATA[
					// vertical slider control
					var slider_help=new Control.Slider('help_handle_top', 'help_track_top', {
						axis: 'vertical',
						onSlide: function(v) { scrollVertical(v, $('help_top'), slider_help);  },
						onChange: function(v) { scrollVertical(v, $('help_top'), slider_help); }
						});
				
					// scroll the element vertically based on its width and the slider maximum value
					function scrollVertical(value, element, slider) {
						element.scrollTop=Math.round(value/slider.maximum*(element.scrollHeight-element.offsetHeight));
						}
				
					// ]]>
					</script>
				</td>
			</tr>
			<!--- bottom part shows the contents of one help article --->
			<tr valign="top" align="left">
				<td colspan="3">
					<div id="help_main" style="float:left; width:220px; height:420px; overflow:hidden;">
						<div id="help_main_articles">
							<cfif get_screen_help_articles.recordcount>
								<cfset variables.help_article_id=get_screen_help_articles.help_article_id>
								<script type="text/javascript" language="javascript">
								// <![CDATA[
						
									new Ajax.Updater('help_main_articles','index.cfm?fuseaction=Help.view_help_article&help_article_id=#variables.help_article_id#',{method:'get',evalScripts:true});
							
								// ]]>
								</script>
							<cfelse>
								<cfset variables.help_article_id=0>
							</cfif>
						</div><cfif application.use_help_faq_ind>
						<div id="help_main_faqs" style="display:none;">
							<cfif get_screen_help_faqs.recordcount>
								<cfset variables.help_faq_id=get_screen_help_faqs.help_faq_id>
							<cfelse>
								<cfset variables.help_faq_id=0>
							</cfif>
							<script type="text/javascript" language="javascript">
							// <![CDATA[
					
								new Ajax.Updater('help_main_faqs','index.cfm?fuseaction=Help.view_help_faq&help_faq_id=#variables.help_faq_id#',{method:'get',evalScripts:true});
						
							// ]]>
							</script>
						</div></cfif><cfif application.use_help_search_ind>
						<div id="help_main_search_results" style="display:none;">
							Enter your search criteria above then press "Search".
						</div></cfif>
					</div>
					<div id="help_track_main" style="float: left;width: 2px;height: 420px;margin-left: 16px;background-color: ##aaa;">
						<div id="help_handle_main" style="width: 3px;height: 20px;background-color:##387da2;cursor: move;"></div>
					</div>
					<script type="text/javascript" language="javascript">
					// <![CDATA[
			
					// vertical slider control
					var slider_help2=new Control.Slider('help_handle_main', 'help_track_main', {
						axis: 'vertical',
						onSlide: function(v) { scrollVertical(v, $('help_main'), slider_help2);  },
						onChange: function(v) { scrollVertical(v, $('help_main'), slider_help2); }
						});
			
					// ]]>
					</script>
				</td>
			</tr>
		</tbody>
		<!--- if the user have access to administer help --->
		<cfif listfind(variables.allowed_business_function_id, 246)>
			<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="add_help_article" fuseaction="Administration.edit_help_article" field_name="screen_id">
			<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="add_help_faq" fuseaction="Administration.edit_help_faq" field_name="screen_id">
		<tfoot>
			<tr valign="top" align="left">
				<td bgcolor="##fcf2f5" colspan="3">
					<div id="help_foot_articles"><a href="javascript:add_help_article(#get_screen_details.screen_id#);">Add help article to this screen</a></div>
				</td>
			</tr>
		</tfoot>
		</cfif>
	</table>
</div>
</cfoutput>
<script type="text/javascript" language="javascript">
// <![CDATA[
	$('button_article').morph('background-color:#ecf2f5; border-bottom-width:0px;');
// ]]>
</script>