
<!--common_files/act_redirect_browser.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I redirect the browser to another page as defined by the passed parameters.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> [attributes.delay]: number of seconds to delay before reloacting to the specified page
	--> [attributes.directory_action]: string containing directory structure information and any relative linking
	--> [attributes.display]: string containing message to display on the browser
	--> [attributes.fuseaction]: string that dictates which page to show
	END FUSEDOC --->
<cfparam name="attributes.delay" default="0">
<cfparam name="attributes.directory_action" default="">
<cfparam name="attributes.display" default="You are being redirected to your task list">
<cfparam name="attributes.fuseaction" default="task_list">
</cfsilent>
<cfoutput>
	<META HTTP-EQUIV="Refresh" Content= "#attributes.delay#; URL=#attributes.directory_action#index.cfm?fuseaction=#attributes.fuseaction#">
	<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;
	<div align="center" class="HeadText#session.workstream_text_size#">#attributes.display#</div>
</cfoutput>

