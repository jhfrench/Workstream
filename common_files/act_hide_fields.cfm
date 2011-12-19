
<!-- common_files/act_hide_fields.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I enable a wizard style of input by taking the fields that are on a page and putting them into hidden fields to be passed to the next page.

	||
	Edits: 
	$Log$
	||
	Variables:
	END FUSEDOC --->
<cfparam name="attributes.Exclude" default="">
</cfsilent>
<cfif isdefined("Form.Fieldnames")>
	<cfset fieldnames_processed="">
	<cfloop list="#form.fieldnames#" index="variables.ii">
		<cfif ListFind(fieldnames_processed, variables.ii) EQ 0 AND ListFindNoCase(attributes.Exclude, variables.ii) EQ 0>
			<cfoutput><input type="hidden" name="#variables.ii#" value="#HTMLEditFormat(form[variables.ii])#"></cfoutput>
			<cfset fieldnames_processed=listappend(fieldnames_processed, variables.ii)>
		</cfif>
	</cfloop>
</cfif>

