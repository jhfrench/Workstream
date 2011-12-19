<!-- common_files/act_related_selects.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_related_selects.cfm">
	<responsibilities>
		I process and display hierarchically-related select boxes.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/2/2007" role="FuseCoder" comments="Created File">
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
			9. blank_option1......blank_optionN (optional)
			10. html_before1......html_beforeN (optional)
			11. select_size1......select_sizeN (optional)
			12. class (optional)
			11. onchange1......onchangeN (optional)
			11. multipleN (optional--only last select can be multiple) 
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
<cfparam name="attributes.all_option_label" default=0>
<cfparam name="attributes.all_option_value" default="">

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
	<cfparam name="attributes.value#select_box_ii#" default="attributes.FieldName#select_box_ii#">
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
		#attributes.function_name#_optValArr[#variables.loop_counter#]=new Array(<cfloop from="1" to="#attributes.select_boxes#" index="item">new Array("<cfif isdefined("attributes.display#item#")>#evaluate(evaluate("attributes.display" & item))#<cfelse>#evaluate(evaluate("attributes.value" & item))#</cfif>","#evaluate(evaluate("attributes.value" & item))#") <cfif item LT attributes.select_boxes>,</cfif></cfloop>);
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
				<cfif attributes.show_all_option_ind EQ 1>subNodes[i].options[0]=new Option("#attributes.all_option_label#","#attributes.all_option_value#");</cfif>
			}<!--- 
				alert(thisSel.options[thisSel.selectedIndex].value); --->
			if(thisSel.options[thisSel.selectedIndex].value !="") {
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
	}<!--- 
	function auto_select_<cfoutput>#attributes.function_name#</cfoutput>(parent_default,pos,nextSel,subNodes) {
		alert(parent_default);
			for (i=0; i < subNodes.length; i++) {
				subNodes[i].options.length=0;
				<cfif attributes.show_all_option_ind EQ 1>subNodes[i].options[0]=new Option("#attributes.all_option_label#","#attributes.all_option_value#");</cfif>
			}
				alert(thisSel.options[thisSel.selectedIndex].value);
			if(parent_default !="") {
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
	<cfloop from="1" to="#attributes.select_boxes#" index="variables.select_field_ii">
		<cfif isdefined("attributes.selected_value" & variables.select_field_ii)>
			<cfif variables.select_field_ii EQ 1>window.onload=</cfif>alert(document.getElementById('#evaluate("attributes.FieldName" & variables.select_field_ii)#').options[0].value);<!--- auto_select_related_category(document.getElementById("#evaluate("attributes.FieldName" & variables.select_field_ii)#").options[0].value,0,document.#attributes.FormName#.InterestSubCategoryID,new Array(document.#attributes.FormName#.InterestSubCategoryID)) --->;
		</cfif>
	</cfloop> --->
</cfoutput>
</script>

<cfloop from="1" to="#attributes.select_boxes#" index="variables.select_field_ii">
	<cfset variables.select_name=evaluate("attributes.FieldName" & variables.select_field_ii)>
	<cfoutput><cfif isdefined("attributes.html_before#variables.select_field_ii#")>#evaluate("attributes.html_before" & variables.select_field_ii)#</cfif>
	<cfif isdefined("attributes.label#variables.select_field_ii#")><strong><label for="#variables.select_name#">#evaluate("attributes.label" & variables.select_field_ii)#</label></strong></cfif>
	<select name="#variables.select_name#" id="#variables.select_name#" size="<cfif isdefined("attributes.select_size#variables.select_field_ii#")>#evaluate("attributes.select_size#variables.select_field_ii#")#<cfelse>4</cfif>" onchange="<cfif variables.select_field_ii LT attributes.select_boxes>#attributes.function_name#(this,#evaluate(variables.select_field_ii-1)#,this.form.#evaluate("attributes.FieldName" & (variables.select_field_ii+1))#,new Array(<cfloop from="#(variables.select_field_ii+1)#" to="#attributes.select_boxes#" index="nextSel">this.form.#evaluate("attributes.FieldName" & (nextSel))#<cfif nextSel LT attributes.select_boxes>,</cfif></cfloop>));</cfif><cfif isdefined("attributes.onchange#variables.select_field_ii#")>#evaluate("attributes.onchange#variables.select_field_ii#")#</cfif>"<cfif isdefined("attributes.multiple#variables.select_field_ii#")> multiple</cfif><cfif isdefined("attributes.class")> class="#attributes.class#"</cfif>>
	<option value="0"<cfif isdefined("attributes.selected_value" & variables.select_field_ii) AND listfind(evaluate("attributes.selected_value" & variables.select_field_ii), 0)> SELECTED</cfif>>#evaluate("attributes.blank_option" & variables.select_field_ii)#</option></cfoutput>
	<cfif variables.select_field_ii EQ 1>
		<cfoutput query="variables.hierarchy_query" group="#evaluate("attributes.value" & variables.select_field_ii)#">
		<option value="#evaluate(evaluate("attributes.value" & variables.select_field_ii))#"<cfif isdefined("attributes.selected_value" & variables.select_field_ii) AND listfind(evaluate("attributes.selected_value" & variables.select_field_ii), evaluate(evaluate("attributes.value" & variables.select_field_ii)))> SELECTED</cfif>><cfif isdefined("attributes.display#variables.select_field_ii#")>#evaluate(evaluate("attributes.display" & variables.select_field_ii))#<cfelse>#evaluate(evaluate("attributes.value" & variables.select_field_ii))#</cfif></option>
		</cfoutput>
	<cfelseif isdefined("attributes.selected_value" & variables.select_field_ii)>
		<!---Get the values available for this set--->
		<cfoutput query="variables.hierarchy_query" group="#evaluate("attributes.value" & variables.select_field_ii)#">
		<cfif evaluate("attributes.selected_value" & (variables.select_field_ii-1)) EQ evaluate(evaluate("attributes.value" & (variables.select_field_ii-1)))>
			<option value="#evaluate(evaluate("attributes.value" & variables.select_field_ii))#"<cfif isdefined("attributes.selected_value" & variables.select_field_ii) AND listfind(evaluate("attributes.selected_value" & variables.select_field_ii), evaluate(evaluate("attributes.value" & variables.select_field_ii)))> SELECTED</cfif>><cfif isdefined("attributes.display#variables.select_field_ii#")>#evaluate(evaluate("attributes.display" & variables.select_field_ii))#<cfelse>#evaluate(evaluate("attributes.value" & variables.select_field_ii))#</cfif></option>
		</cfif>
		</cfoutput>
	</cfif>
	</select>
	<cfoutput><!--- 
	<br><input type="button" onclick="related_category(document.getElementById('#evaluate("attributes.FieldName" & variables.select_field_ii)#'),0,document.#attributes.FormName#.InterestSubCategoryID,new Array(document.#attributes.FormName#.InterestSubCategoryID));" value="try"> --->
	</cfoutput>
</cfloop>

<!--- the following javascript needs to be down here so that it runs after releated select boxes and javascript are in place --->
<script language="JavaScript" type="text/JavaScript">
<!--
<cfif NOT isdefined("caller.attributes.related_selects_initiated_ind")>
<cfset caller.attributes.related_selects_initiated_ind=1>
function set_select_by_value(select_name, desired_value) {
	value_selected=0;
	sel = document.getElementById(select_name);
	var desired_value_array=desired_value.split(',');
	for (desired_value_ii=0; desired_value_ii<desired_value_array.length; desired_value_ii++) {
	//alert('array_length='+desired_value_array.length);
		for (i=0; i<sel.options.length; i++) {
			//alert('value='+sel.options[i].value+', desired='+desired_value_array[desired_value_ii]);
			if (sel.options[i].value == desired_value_array[desired_value_ii]) {
				sel.options[i].selected = true;
				value_selected=1;
			}
		}
	}
	if (value_selected==0) {
		sel.selectedIndex = 0; //default to first item in list
	}
} 
</cfif>
<cfoutput>
<cfloop from="1" to="#attributes.select_boxes#" index="variables.select_field_ii">
	<cfset variables.select_name=evaluate("attributes.FieldName" & variables.select_field_ii)>
<cfif isdefined("attributes.selected_value#variables.select_field_ii#") AND len(evaluate("attributes.selected_value#variables.select_field_ii#"))>set_select_by_value('#variables.select_name#', '#evaluate("attributes.selected_value" & variables.select_field_ii)#');
<cfif variables.select_field_ii NEQ attributes.select_boxes>if (value_selected==1) {
	#attributes.function_name#(
		document.getElementById('#variables.select_name#'),
		#variables.select_field_ii-1#,
		document.getElementById('#evaluate("attributes.FieldName" & variables.select_field_ii+1)#'),
		new Array(document.getElementById('#variables.select_name#').form.#evaluate("attributes.FieldName" & variables.select_field_ii+1)#)
	);
}</cfif></cfif>
</cfloop>
-->
</cfoutput>
</script>
<!---tag code ends--->