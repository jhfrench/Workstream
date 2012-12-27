<!-- common_files/act_related_selects.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_related_selects.cfm">
	<responsibilities>
		I process hierarchy level for related selects.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/2/2007" role="FuseCoder" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>
			List of attributes:
			1. select_boxes (required)
			2. Query (required)
			3. FieldName1....FieldNameN (required)
			4. Display1....DisplayN (optional)
			5. Value1....ValueN (required)
			6. selected_value1......selected_valueN (optional)
			7. function_name (optional)
			8. FormName (required)
			9. blank_option (optional)
			10. html_before1......html_beforeN (optional)
			11. select_size1......select_sizeN (optional)
		</in>
		<passthrough>

		</passthrough>
		<out>

		</out>
	</IO>
</fusedoc>
--->

<cfparam name="attributes.query">
<cfparam name="attributes.call_as_module" default=1>
<cfparam name="attributes.select_boxes" default=0>
<cfparam name="attributes.function_name" default="Sel">
<cfparam name="attributes.show_all_option_ind" default=0>

<cfset variables.error_message="">
<cfif len(attributes.query) EQ 0>
	<cfset variables.error_message=variables.error_message & "<br />Please specify a query to be processed.">
</cfif>
<cfif NOT isnumeric(attributes.select_boxes) OR attributes.select_boxes EQ 0>
	<cfset variables.error_message=variables.error_message & "<br />Please enter a positive integer for the number of select boxes you want.">
</cfif>
<cfif NOT isdefined("attributes.FormName")>
	<cfset variables.error_message=variables.error_message & "<br />Please specify a form name.">
</cfif>
<cfloop from="1" to="#attributes.select_boxes#" index="select_box_ii">
	<cfif NOT isdefined("attributes.FieldName#select_box_ii#")>
		<cfset variables.error_message=variables.error_message & "<br />Please specify the form field name attribute for each select box. For eg. FieldName1, FieldName1 .....till the number of select_boxes">
	</cfif>
	<cfparam name="attributes.Value#select_box_ii#" default="attributes.FieldName#select_box_ii#">
	<cfparam name="attributes.blank_option#select_box_ii#" default="Please choose...&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;">
</cfloop>

<cfif len(variables.error_message)>
	<cfthrow detail="#variables.error_message#" message="Error encountered while processing the CF_MultiRelatedSelects tag.">
	<cfabort>
</cfif>

<!---Tag Code--->
<cfif attributes.call_as_module EQ 1>
	<cfset variables.hierarchy_query=evaluate("caller." & attributes.query)>
<cfelse>
	<cfset variables.hierarchy_query=evaluate(attributes.query)>
</cfif>

<script language="JavaScript" type="text/javascript">
	var <cfoutput>#attributes.function_name#</cfoutput>_optValArr=new Array();
	<cfset variables.loop_counter=0>

	<cfoutput query="variables.hierarchy_query">
		#attributes.function_name#_optValArr[#variables.loop_counter#]=new Array(<cfloop from="1" to="#attributes.select_boxes#" index="item">new Array("<cfif isdefined("attributes.display#item#")>#evaluate(evaluate("attributes.display" & item))#<cfelse>#evaluate(evaluate("attributes.Value" & item))#</cfif>","#evaluate(evaluate("attributes.Value" & item))#") <cfif item LT attributes.select_boxes>,</cfif></cfloop>);
		<cfset variables.loop_counter=incrementValue(variables.loop_counter)>
	</cfoutput>
	<cfoutput>
	<cfset selList="">
	<cfloop from="1" to="#attributes.select_boxes#" index="item">
		<cfset selList=ListAppend(selList,"Sel" & item)>
	</cfloop>
	function <cfoutput>#attributes.function_name#</cfoutput>(thisSel,pos,nextSel,subNodes) {
			for (i=0; i < subNodes.length; i++) {
				subNodes[i].options.length=0;
				<cfif attributes.show_all_option_ind EQ 1>subNodes[i].options[0]=new Option("All","");</cfif>
			}
			if(thisSel.options[thisSel.selectedIndex].value!="") {
				optPos=<cfoutput>#attributes.show_all_option_ind#</cfoutput>;
				lastVal="";
				for (i=0; i < <cfoutput>#attributes.function_name#</cfoutput>_optValArr.length; i++) {
					if(<cfoutput>#attributes.function_name#</cfoutput>_optValArr[i][pos][1]==thisSel.options[thisSel.selectedIndex].value){
						if(<cfoutput>#attributes.function_name#</cfoutput>_optValArr[i][eval(pos+1)][1]!=lastVal){
							lastVal=<cfoutput>#attributes.function_name#</cfoutput>_optValArr[i][eval(pos+1)][1];
							subNodes[0].options[optPos]=new Option(<cfoutput>#attributes.function_name#</cfoutput>_optValArr[i][eval(pos+1)][0],<cfoutput>#attributes.function_name#</cfoutput>_optValArr[i][eval(pos+1)][1]);
							optPos++;
						}
					}
				}
			}
	}
</cfoutput>
</script>
<cfoutput>
<cfloop from="1" to="#attributes.select_boxes#" index="variables.select_field_ii">
	<cfparam name="attributes.class#variables.select_field_ii#" default="">
	<cfparam name="attributes.select_size#variables.select_field_ii#" default="4">
	<cfset variables.select_name=evaluate("attributes.FieldName" & variables.select_field_ii)>
	<cfif isdefined("attributes.html_before#variables.select_field_ii#")>#evaluate("attributes.html_before" & variables.select_field_ii)#</cfif>
	<select name="#variables.select_name#" id="#variables.select_name#" size="#evaluate('attributes.select_size#variables.select_field_ii#')#" class="#evaluate('attributes.class#variables.select_field_ii#')#"<cfif variables.select_field_ii LT attributes.select_boxes> onchange="#attributes.function_name#(this,#evaluate(variables.select_field_ii-1)#,this.form.#evaluate("attributes.FieldName" & (variables.select_field_ii+1))#,new Array(<cfloop from="#(variables.select_field_ii+1)#" to="#attributes.select_boxes#" index="nextSel">this.form.#evaluate("attributes.FieldName" & (nextSel))#<cfif nextSel LT attributes.select_boxes>,</cfif></cfloop>));"</cfif>>
		<option value="0">#evaluate("attributes.blank_option" & variables.select_field_ii)#</option>
	<cfif variables.select_field_ii EQ 1>
		<cfloop query="variables.hierarchy_query" group="#evaluate('attributes.value' & variables.select_field_ii)#">
		<option value="#evaluate(evaluate("attributes.value" & variables.select_field_ii))#"<cfif isdefined("attributes.selected_value" & variables.select_field_ii) AND evaluate("attributes.selected_value" & variables.select_field_ii) EQ evaluate(evaluate("attributes.value" & variables.select_field_ii))> selected="selected"</cfif>><cfif isdefined("attributes.display#variables.select_field_ii#")>#evaluate(evaluate("attributes.display" & variables.select_field_ii))#<cfelse>#evaluate(evaluate("attributes.Value" & variables.select_field_ii))#</cfif></option>
		</cfloop>
	<cfelseif isdefined("attributes.selected_value" & variables.select_field_ii)>
		<!---Get the values available for this set--->
		<cfloop query="variables.hierarchy_query" group="#evaluate('attributes.value' & variables.select_field_ii)#">
		<cfif evaluate("attributes.selected_value" & (variables.select_field_ii-1)) EQ evaluate(evaluate("attributes.value" & (variables.select_field_ii-1)))>
			<option value="#evaluate(evaluate("attributes.value" & variables.select_field_ii))#"<cfif isdefined("attributes.selected_value" & variables.select_field_ii) and evaluate("attributes.selected_value" & variables.select_field_ii) EQ evaluate(evaluate("attributes.value" & variables.select_field_ii))> selected="selected"</cfif>><cfif isdefined("attributes.display#variables.select_field_ii#")>#evaluate(evaluate("attributes.display" & variables.select_field_ii))#<cfelse>#evaluate(evaluate("attributes.Value" & variables.select_field_ii))#</cfif></option>
		</cfif>
		</cfloop>
	</cfif>
	</select>
</cfloop>
</cfoutput>
<!---tag code ends--->