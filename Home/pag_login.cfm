<!-- Home/pag_login.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_login.cfm">
	<responsibilities>
		I act as the page that contains the login form and the login action template.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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
<cfscript>
	if (NOT isdefined("attributes.method")) {
		attributes.method="";
	};
	if (NOT isdefined("attributes.requested_page")) {
		attributes.requested_page=application.fusebox.defaultfuseaction;
	};
	if (NOT isdefined("attributes.user_name")) {
		attributes.user_name="";
	};
	if (NOT isdefined("variables.display_message")) {
		variables.display_message="";
	};
</cfscript>

<!--- if the form is submitted --->
<cfif NOT comparenocase(attributes.method,"login")>
	<cfinclude template="act_login.cfm">
</cfif>

<div class="row-fluid">
	<div class="span4 login_background">
		<div id="login_box">
			<em class="lead">
				This <abbr title="Applied Internet Technologies">AIT</abbr> system is for authorized users only.  By accessing this system you are consenting to complete monitoring with no expectation of privacy.  Unauthorized access or use may subject you to disciplinary action and criminal prosecution.
			</em>
			<div class="login_form">
			<cfinclude template="dsp_login.cfm">
			</div>
		</div>
	</div>
	<div class="span4">
		<div id="clock_tower"></div>
	</div>
</div>