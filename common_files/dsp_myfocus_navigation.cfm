<!-- common_files/dsp_Main_navigation.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_Main_navigation.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="9/27/2007" role="FuseCoder" comments="Created File">
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
<div style="visibility:hidden; height:1px; overflow:hidden">
Navigation
</div>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="new_post" fuseaction="Home.view_forum" field_name="reply_parent_discussion_id" field_value="" processform="0">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="view_forum" fuseaction="Home.view_forum" field_name="parent_discussion_id" field_value="" processform="0" field2_variable_ind="1" field2_name="top_level" field2_value="">
<div id="sys2" class="sys_messages">
<table class="formname" border="0" cellpadding="6" cellspacing="0" bgcolor="#d1dee5" cols="1" width="100%" summary="My FAAD Navigation table">
		<tr valign="top">
			<th class="menubar" align="center"><span id="menubar_title">Main</span></th>
		</tr>
	<tbody>
		<tr valign="top">
			<td class="iconbar">
				<div id="div_iconbar" style="float:left; width:235px; height:40px;">
					<cfoutput>
					<table border="0" width="235" height="40" cellspacing="0" cellpadding="0" cols="#get_module_navigation.recordcount+variables.icon_number#" summary="Table contains site navigation buttons">
						<tr valign="middle" align="center">
							<td><a href="javascript:void($('mcommands').innerHTML=loadScr);void(Element.hide('track_modulebar'));void(Element.show('modulebar'));void(new Ajax.Updater('mcommands','index.cfm?fuseaction=Home.forum_commands&cache_escape=#variables.cache_escape#',{method:'get',evalScripts:true}))" onclick="$('mcommands').innerHTML=loadScr;Element.hide('track_modulebar');Element.show('modulebar');new Ajax.Updater('mcommands','index.cfm?fuseaction=Home.forum_commands&cache_escape=#variables.cache_escape#',{method:'get',evalScripts:true});" onmouseover="javascript:$('menubar_title').innerHTML='Main - Forum';scaleIcon(1);"><img src="images/forum.png" alt="forum" width="25" height="25" border="0" id="icon1"></a></td>
							<td><a href="javascript:void($('mcommands').innerHTML=loadScr);void(Element.hide('track_modulebar'));void(Element.show('modulebar'));void(new Ajax.Updater('mcommands','index.cfm?fuseaction=Home.calendar_commands&cache_escape=#variables.cache_escape#',{method:'get',evalScripts:true}))" onclick="$('mcommands').innerHTML=loadScr;Element.hide('track_modulebar');Element.show('modulebar');new Ajax.Updater('mcommands','index.cfm?fuseaction=Home.calendar_commands&cache_escape=#variables.cache_escape#',{method:'get',evalScripts:true});"><img src="images/calendar.png" alt="calendar" width="25" height="25" border="0" id="icon2" onmouseover="javascript:$('menubar_title').innerHTML='Main - Calendar';scaleIcon(2);"></a></td>
							<td><a href="javascript:void($('mcommands').innerHTML=loadScr);void(Element.hide('track_modulebar'));void(Element.show('modulebar'));void(new Ajax.Updater('mcommands','index.cfm?fuseaction=Home.message_commands&cache_escape=#variables.cache_escape#',{method:'get',evalScripts:true}))" onclick="$('mcommands').innerHTML=loadScr;Element.hide('track_modulebar');Element.show('modulebar');new Ajax.Updater('mcommands','index.cfm?fuseaction=Home.message_commands&cache_escape=#variables.cache_escape#',{method:'get',evalScripts:true});" onmouseover="javascript:$('menubar_title').innerHTML='Main - Show Messages';scaleIcon(3);"><img src="images/messages.png" alt="messages" width="25" height="25" border="0" id="icon3"></a></td>
					</cfoutput>
						<cfoutput query="get_module_navigation">
							<cfset variables.icon_number=variables.icon_number+1>
							<td><a href="javascript:void($('mcommands').innerHTML=loadScr);void(Element.hide('track_modulebar'));void(Element.show('modulebar'));void(new Ajax.Updater('mcommands','index.cfm?fuseaction=Home.module_commands&module_id=#module_id#&program_year_id=#attributes.program_year_id#&cache_escape=#variables.cache_escape#',{method:'get',evalScripts:true}))" onclick="$('mcommands').innerHTML=loadScr;Element.hide('track_modulebar');Element.show('modulebar');new Ajax.Updater('mcommands','index.cfm?fuseaction=Home.module_commands&module_id=#module_id#&program_year_id=#attributes.program_year_id#&cache_escape=#variables.cache_escape#',{method:'get',evalScripts:true});" onmouseover="javascript:$('menubar_title').innerHTML='Main - #replace(module_description, 'Main', 'Preferences')#';scaleIcon(#variables.icon_number#);"><img src="images/module_#module_id#.png" alt="#module_description#" width="25" height="25" border="0" id="icon#variables.icon_number#"></a></td>
						</cfoutput>
						</tr>
					</table>
				</div>
			</td>
		</tr>
		<tr valign="top" id="modulebar">
			<td class="modulebar"><img src="images/spacer.gif" alt="" width="1" height="135" align="left">
				<div id="modulebar_area" style="float:left; top:-110px; width:220px; height:323px; overflow:hidden; color:white;">
					<div id="mcommands">
						<strong>Loading Module Commands...</strong>
						<br /><img src="images/loading.gif" alt="loading" width="48" height="48" style="padding:30px;margin-left:60px;" align="center">
					</div>
				</div>
				<div id="track_modulebar" style="float: right;width:2px;height:323px;margin-left:10px;background-color: #aaa;">
					<div id="handle_modulebar" style="width: 3px;height: 20px;background-color:white;cursor: move;"></div>
				</div>
				<script type="text/javascript" language="javascript">
				// <![CDATA[
		
				// vertical slider control
				var slider_modulebar=new Control.Slider('handle_modulebar', 'track_modulebar', {
					axis: 'vertical',
					onSlide: function(v) { scrollVertical(v, $('modulebar_area'), slider_modulebar);  },
					onChange: function(v) { scrollVertical(v, $('modulebar_area'), slider_modulebar); }
				});
		
				// scroll the element vertically based on its width and the slider maximum value
				function scrollVertical(value, element, slider) {
					element.scrollTop=Math.round(value/slider.maximum*(element.scrollHeight-element.offsetHeight));
				}
		
				// mouse wheel code from http://adomas.org/javascript-mouse-wheel/
				function handle_modulebar(delta) {
					slider_modulebar.setValueBy(-delta);
				}
		
				/** Event handle_modulebarr for mouse wheel event. */
				function wheel(event){
					var delta=0;
					if (!event) /* For IE. */
					event=window.event;
					if (event.wheelDelta) { /* IE/Opera. */
					delta=event.wheelDelta/120;
					/** In Opera 9, delta differs in sign as compared to IE. */
					if (window.opera)
						delta=-delta;
					} else if (event.detail) { /** Mozilla case. */
					/** In Mozilla, sign of delta is different than in IE.
					* Also, delta is multiple of 3.
					*/
					delta=-event.detail/3;
					}
		
					/** If delta is nonzero, handle_modulebar it.
					* Basically, delta is now positive if wheel was scrolled up,
					* and negative, if wheel was scrolled down.
					*/
					if (delta)
					handle_modulebar(delta);
			
					/** Prevent default actions caused by mouse wheel.
					* That might be ugly, but we handle_modulebar scrolls somehow
					* anyway, so don't bother here..
					*/
					if (event.preventDefault)
					event.preventDefault();
			
					event.returnValue=false;
				}
		
				// mozilla
				Event.observe('modulebar_area', 'DOMMouseScroll', wheel);
				Event.observe('modulebar', 'DOMMouseScroll', wheel);
				Event.observe('track_modulebar', 'DOMMouseScroll', wheel);
		
				// IE/Opera
				Event.observe('modulebar_area', 'mousewheel', wheel);
				Event.observe('modulebar', 'mousewheel', wheel);
				Event.observe('track_modulebar', 'mousewheel', wheel);
		
				// ]]>
				</script>
			</td>
		</tr>
	</tbody>
</table>
</div>