<!-- Administration/pag_view_application_variables.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_view_application_variables.cfm">
	<responsibilities>
		I show the contents of the application, session, fusebox, and variables scopes.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/19/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(5/26/11 | JF)
			Enhancing the application scope viewing functionality so you can see only the things you want to.

			(5/26/11 | JF)
			Added exception handling; not all version use the same fusebox variables (for whatever reason).
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
<cfscript>
	if (NOT isdefined("attributes.show_application_ind"))
		attributes.show_application_ind=0;
	else {

		try {
			request.small_application=duplicate(application);
			structdelete(request.small_application,"fusebox",true);
		}
		catch (any error_event) {
			request.small_application="";
		}
	}

	if (NOT isdefined("attributes.show_fusebox_ind"))
		attributes.show_fusebox_ind=0;
	else {

		try {
			request.small_fusebox=duplicate(application.fusebox);
		}
		catch (any error_event) {
			request.small_fusebox="";
		}
	}

	if (NOT isdefined("attributes.show_server_ind"))
		attributes.show_server_ind=0;
	else {

		try {
			request.small_server=duplicate(server);
		}
		catch (any error_event) {
			request.small_server="";
		}

		try {
			structdelete(request.small_server,"DMSEC",true);
		}
		catch (any error_event) {}
	}

	if (NOT isdefined("attributes.show_session_ind"))
		attributes.show_session_ind=0;
	if (NOT isdefined("attributes.show_variables_ind"))
		attributes.show_variables_ind=0;
	else {
		request.small_variables=duplicate(variables);

		try {
			structdelete(request.small_variables,"__FUSEBOXAPPCFC",true);
		}
		catch (any error_event) {}

		try {
			structdelete(request.small_variables,"_FBA",true);
		}
		catch (any error_event) {}

		try {
			structdelete(request.small_variables,"_PARSEDFILEDATA",true);
		}
		catch (any error_event) {}
		try {
			structdelete(request.small_variables,"ATTRIBUTES",true);
		}
		catch (any error_event) {}

		try {
			structdelete(request.small_variables,"CALLER",true);
		}
		catch (any error_event) {}

		try {
			structdelete(request.small_variables,"EVENT",true);
		}
		catch (any error_event) {}

		try {
			structdelete(request.small_variables,"EXPOSED",true);
		}
		catch (any error_event) {}

		try {
			structdelete(request.small_variables,"LOADFUSEBOX",true);
		}
		catch (any error_event) {}

		try {
			structdelete(request.small_variables,"MYFUSEBOX",true);
		}
		catch (any error_event) {}

		try {
			structdelete(request.small_variables,"THIS",true);
		}
		catch (any error_event) {}

		try {
			structdelete(request.small_variables,"XFA",true);
		}
		catch (any error_event) {}
	}
</cfscript>

<ul class="breadcrumb">
	<h2>
		<li>Administration <span class="divider">/</span></li>
		<li>System Configuration <span class="divider">/</span></li>
		<li class="active">View Application Variables</li>
	</h2>
</ul>
<a href="index.cfm?fuseaction=Administration.cause_error" class="btn btn-danger">Cause an error</a>
<form name="" action="index.cfm?fuseaction=Administration.view_application_variables" method="post">
	<input type="checkbox" name="show_application_ind" id="show_application_ind" value="1"<cfif attributes.show_application_ind> checked="checked"</cfif> /><label for="show_application_ind">Show application scope</label><br />
	<input type="checkbox" name="show_fusebox_ind" id="show_fusebox_ind" value="1"<cfif attributes.show_fusebox_ind> checked="checked"</cfif> /><label for="show_fusebox_ind">Show fusebox variables</label><br />
	<input type="checkbox" name="show_server_ind" id="show_server_ind" value="1"<cfif attributes.show_server_ind> checked="checked"</cfif> /><label for="show_server_ind">Show server scope</label><br />
	<input type="checkbox" name="show_session_ind" id="show_session_ind" value="1"<cfif attributes.show_session_ind> checked="checked"</cfif> /><label for="show_session_ind">Show session scope</label><br />
	<input type="checkbox" name="show_variables_ind" id="show_variables_ind" value="1"<cfif attributes.show_variables_ind> checked="checked"</cfif> /><label for="show_variables_ind">Show variables scope</label><br />
	<input type="submit" value="show selected scopes" />
</form>
<cfif attributes.show_application_ind>
	<p>Application Scope
	<cfdump var="#request.small_application#">
	</p>
</cfif>
<cfif attributes.show_fusebox_ind>
	<p>Fusebox Variables
	<cfdump var="#request.small_fusebox#">
	</p>
</cfif>
<cfif attributes.show_server_ind>
	<p>Server Scope
	<cfdump var="#server#">
	</p>
</cfif>
<cfif attributes.show_session_ind>
	<p>Session Scope
	<cfdump var="#session#">
	</p>
</cfif>
<cfif attributes.show_variables_ind>
	<p>Variables Scope
	<cfdump var="#request.small_variables#">
	</p>
</cfif>
<cfif attributes.show_application_ind+attributes.show_fusebox_ind+attributes.show_server_ind+attributes.show_session_ind+attributes.show_variables_ind EQ 0>
	Please specify which scope(s) you'd like to see.
</cfif>