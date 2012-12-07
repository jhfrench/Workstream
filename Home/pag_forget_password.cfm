<!-- Home/pag_forget_password.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_forget_password.cfm">
	<responsibilities>
		I get passwords for users who have forgotten their passwords.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/31/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.user_name" default="">
<cfparam name="attributes.method" default="">
<div id="login_box">
	<em class="lead">
		This <abbr title="Applied Internet Technologies">AIT</abbr> system is for authorized users only.  By accessing this system you are consenting to complete monitoring with no expectation of privacy.  Unauthorized access or use may subject you to disciplinary action and criminal prosecution.
	</em>
	<div class="login_form">
		<cfif NOT comparenocase(attributes.method, "submit")>
			<cfinclude template="act_forget_password.cfm">
		<cfelse>
			<cfinclude template="dsp_forget_password_form.cfm">
		</cfif>
	</div>
</div>