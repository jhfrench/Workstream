<!-- common_files/act_drilldown_form.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_drilldown_form.cfm">
	<responsibilities>
		I act(send information to DB) for editing drilldown form.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/18/2007" role="FuseCoder" comments="Created File">
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
<cfsilent>
<!---ignore list must be in all caps because the listcompare is case-sensitive--->
<cfset variables.field2_error_message="<strong>Error:</strong> You must specify the value for field_2 in common_files/act_drilldown_form.cfm">
<cfset variables.ignore_these="FIELDNAMES,FUSEACTION,PROCESSFORM,FIELD_NAME,FIELD_VALUE,FIELD2_NAME,FIELD2_VALUE,FIELD2_VARIABLE_IND,FUNCTION_NAME,NO_RESET,EVALUATE_FIRST,fusebox.password">
<cfparam name="attributes.field_name" default="field_name">
<cfparam name="attributes.field_value" default="field_value">
<cfparam name="attributes.field2_name" default="">
<cfparam name="attributes.field2_value" default="">
<cfparam name="attributes.field2_variable_ind" default="0">
<cfparam name="attributes.fuseaction" default="">
<cfparam name="attributes.no_reset" default="">
<cfparam name="attributes.processform" default="0">
<cfset variables.javascript_ignore=listappend(lcase(variables.ignore_these),lcase(attributes.no_reset))>
</cfsilent>
<cfoutput>
<script language="JavaScript" type="text/javascript">
<!--
function #attributes.function_name#(fldValue<cfif attributes.field2_variable_ind>,fldValue2</cfif>) {
	document.#attributes.function_name#.#attributes.field_name#.value=fldValue;<cfif attributes.field2_variable_ind>
	document.#attributes.function_name#.#attributes.field2_name#.value=fldValue2;</cfif>
	<cfif attributes.processform>
		<cfloop collection="#attributes#" item="variables.field">
			<cfif NOT listcontains(variables.javascript_ignore,lcase(variables.field))>
				document.#attributes.function_name#.#variables.field#.value='#evaluate("attributes.#variables.field#")#';
			</cfif>
		</cfloop>
	</cfif>
	document.#attributes.function_name#.submit();
}
//-->
</script>

<form name="#attributes.function_name#" action="index.cfm?fuseaction=#attributes.fuseaction#"<cfif isdefined("attributes.target")> target="#attributes.target#"</cfif> method="post">
	<input type="hidden" name="#attributes.field_name#" value="#attributes.field_value#" />
	<cfif len(attributes.field2_name)>
		<input type="hidden" name="#attributes.field2_name#" value="#attributes.field2_value#" />
	</cfif>
	<cfif attributes.processform>
		<cfloop collection="#attributes#" item="variables.field">
			<cfif NOT listcontainsnocase(variables.ignore_these,variables.field)>
				<input type="hidden" name="#variables.field#" id="#variables.field#" value="#evaluate('attributes.#variables.field#')#" />
			</cfif>
		</cfloop>
	</cfif>
	<cfif isdefined("attributes.given_referer")>
		<input type="hidden" name="given_referer" value="#attributes.given_referer#" />
	</cfif>
</form>
</cfoutput>