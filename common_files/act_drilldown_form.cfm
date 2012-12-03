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
			(5/26/11 | JF)
			Added xmlformat() to filter out injection attacks.
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
<cfscript>
	variables.field2_error_message="<strong>Error:</strong> You must specify the value for field_2 in common_files/act_drilldown_form.cfm";
	//ignore list must be in all caps because the listcompare is case-sensitive
	variables.ignore_these="FIELDNAMES,FUSEACTION,PROCESSFORM,FIELD_NAME,FIELD_VALUE,FIELD2_NAME,FIELD2_VALUE,FIELD2_VARIABLE_IND,FUNCTION_NAME,NO_RESET,EVALUATE_FIRST,fusebox.password";
	if (NOT isdefined("attributes.field_name"))
		attributes.field_name="field_name";
	if (NOT isdefined("attributes.field_value"))
		attributes.field_value="field_value";
	if (NOT isdefined("attributes.field2_name"))
		attributes.field2_name="";
	if (NOT isdefined("attributes.field2_value"))
		attributes.field2_value="";
	if (NOT isdefined("attributes.field2_variable_ind"))
		attributes.field2_variable_ind=0;
	if (NOT isdefined("attributes.fuseaction"))
		attributes.fuseaction="";
	if (NOT isdefined("attributes.no_reset"))
		attributes.no_reset="";
	if (NOT isdefined("attributes.processform"))
		attributes.processform=0;
	variables.javascript_ignore=listappend(lcase(variables.ignore_these),lcase(attributes.no_reset));
</cfscript>
</cfsilent>
<cfoutput>
<script language="JavaScript" type="text/javascript">
var #attributes.function_name#=function(fldValue,fldValue2) {
	"use strict"; //let's avoid tom-foolery in this function
	document.#attributes.function_name#.#attributes.field_name#.value=fldValue;<cfif attributes.field2_variable_ind>
	document.#attributes.function_name#.#attributes.field2_name#.value=fldValue2;</cfif>
	<cfif attributes.processform>
		<cfloop collection="#attributes#" item="variables.field">
			<cfif NOT listcontains(variables.javascript_ignore,lcase(variables.field))>
				document.#attributes.function_name#.#variables.field#.value='#xmlformat(evaluate("attributes.#variables.field#"))#';
			</cfif>
		</cfloop>
	</cfif>
	document.#attributes.function_name#.submit();
}
</script>

<form name="#attributes.function_name#" id="form_#attributes.function_name#" action="index.cfm?fuseaction=#attributes.fuseaction#"<cfif isdefined("attributes.target")> target="#attributes.target#"</cfif> method="post">
	<input type="hidden" name="#attributes.field_name#" id="#attributes.field_name#" value="#attributes.field_value#" />
	<cfif len(attributes.field2_name)>
		<input type="hidden" name="#attributes.field2_name#" id="#attributes.field2_name#" value="#attributes.field2_value#" />
	</cfif>
	<cfif attributes.processform>
		<cfloop collection="#attributes#" item="field">
			<cfif NOT listcontains(variables.ignore_these,field)>
				<input type="hidden" name="#field#" id="#field#" value="#xmlformat(evaluate("attributes.#field#"))#" />
			</cfif>
		</cfloop>
	</cfif>
	<cfif isdefined("attributes.given_referer")>
		<input type="hidden" name="given_referer" value="#attributes.given_referer#" /><!--- $issue$ does this need its own explicit condition/set? Why not jsut use process_form=true and given_refere="xyz"?  --->
	</cfif>
</form>
</cfoutput>