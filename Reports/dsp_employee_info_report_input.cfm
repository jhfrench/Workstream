
<!--Report/dsp_employee_info_report_input.cfm
	Author: Joshua Peters  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the input page for the HR report criteria.
	||
	Name: Joshua Peters
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfoutput>

<cfset attributes.report_elements="Merit Pool,Dept,Status,EE Type,PT Hours,Employee Name,Birth Date,Gender,Hire Date,Term Date,Separation Code,Job Title,Job Date,Manager,Latest Perform Level,Annual Salary,Salary Change Date,% Inc,Inc Type,Annual Inc Amt,Benefits Start Date,Med CVG,PP Deduct Medical,Den CVG,PP Deduct Dental,PP LTD Dental,PP HCA Deduct 2002,PP DCA Deduct 2002,Flex Spending,PP CSP Deduct,Metro Check Deduct,Savings Bond Deduct,Company,Office"> <!--- Merit Pool,Dept,Status,EE Type,PT Hours,Employee Name,Birth Date,Gender,Spouse Name,SSN,Address,Home Phone,Hire Date,Term Date,Separation Code,Job Title,Job Date,Manager,FY2000 Perf. Level,FY2001 Perf. Level,FY2002 Perf. Level,FY2003 Mid-Year,Curr Annual Salary,% Inc.,Inc. Type,Annual Inc Amt,Interim Salary,10/31/02 Annual Salary,10/31/01 Annual Salary,Benefits Start Date,Med CVG,PP Deduct Medical,Den CVG,PP Deduct Dental,PP LTD Deduct,PP HCA Deduct 2002,PP DCA 2002,Flex Spending,HCA Deduct 2003,DCA Deduct 2003,PP CSP Deduct,Metro Check Deduct,Savings Bond Deduct,Company,Office--->
<cfparam name="attributes.omitted_column_header_list" default="">

<cfform action="index.cfm?fuseaction=Reports.hr_output" method="POST">
	<input type="hidden" name="columns_not_to_print" value="">
	<input type="hidden" name="columns_to_print" value="">
	<input type="hidden" name="report_elements" value="#attributes.report_elements#">
	
	<tr class="SubHeadText">
		<td colspan="3">Report Date&nbsp;&nbsp;<cfinput type="Text" name="start_date" required="no" size="15" maxlength="10" validate="date" message="You must enter a valid from date" class="RegText"></td>
	</tr>
	<tr class="SubHeadText">
		<td colspan="3">Columns Displayed in Report</td>
	</tr>
	
	<tr class="SubHeadText">	
		<td>
			<select name="report_columns" class="RegText" multiple size="10" style="width:145px;">
				<cfloop list="#attributes.report_elements#" index="dex">
					<option value="#dex#">#dex#</option>
				</cfloop>
			</select>
		</td>
		<td align="center"><input type="button" value="Remove >>>" name="remove" style="width:120px;" onclick="javascript: RemoveListItem('report_columns','removed_elements');" class="RegText"><br />
		<input type="button" value="<<< Add" name="add" style="width:120px;" onclick="javascript: RemoveListItem('removed_elements','report_columns');" class="RegText"></td>
		<td>
			<select name="removed_elements" class="RegText" multiple size="10" style="width:145px;">
					<option></option>
			</select>
		</td>
	</tr>	
	<tr>
		<td align="center" colspan="3">
			<input type="button" name="Get_Report" value="Generate Report" class="RegText" onclick="submit_form();">
		</td>
	</tr>	
</cfform>
</cfoutput>

<script language="javascript">

function submit_form(){
	var item_count = document.forms[0].removed_elements.length;
	var list="";
	
	for (var xx=0; xx<item_count; xx++){
	
		if (list==""){
			list=document.forms[0].removed_elements.options[xx].value;
		}else{
			list=list + "," + document.forms[0].removed_elements.options[xx].value;
		}
		
		
	}
	document.forms[0].columns_not_to_print.value=list;	
	document.forms[0].submit();
	return true;

}

/*
	---> ResetColumnList(Select list we're removing the items from,Select list we're adding the items to):
	This function takes the passed list argument 'remove_from_list_name' and selects all the
	options it contains.  It then calls the function for moving selected list items with
	both the list to get the items from and the list name where the items should be placed.
*/
function ResetColumnList(remove_from_list_name, add_back_to_list_name){
	var item_count = eval("document.forms[0]."+ remove_from_list_name + ".length");

	for (var xx=0; xx<item_count; xx++){
		eval("document.forms[0]." + remove_from_list_name + ".options[xx].selected = true");
	}
	
	RemoveListItem(remove_from_list_name,add_back_to_list_name);
	return true;
}
			
/*
	---> RemoveListItem(Select list we're removing the items from,Select list we're adding the items to):
	This function is called when the users selects to move an element.  I pass two values
	so this function can be interchangable between adding back and element and removing one.
	The first parameter is the list the element is going to be removed from and the second
	parameter is the list the value will be added to.
*/
function RemoveListItem(remove_from_select,add_to_select){
	var original_list_dex = eval("document.forms[0]." + remove_from_select + ".selectedIndex");
	var total_included_items = eval("document.forms[0]." + remove_from_select + ".length");
	var max_list_index = eval("document.forms[0]." + remove_from_select + ".length - 1");
	var is_item_selected_ind = false;

	//Make sure they have selected something, if -1, they have not
	if (original_list_dex == -1){
		alert("You must first select an item.");
	}else{
	
		//Don't allow them to remove the last item in the list
		if (total_included_items<2 && remove_from_select=="report_columns"){
		
			alert("You must leave at least one item to display in the report.");
			
		}else{	
			
			//Decrement Loop over since we allow multiple items to be selected at once
			for (var xx=max_list_index; xx>=0; xx--){
			 	
				//Get the selected boolean for this item
				//is_item_selected_ind = eval("document.forms[0]." + remove_from_select + ".options[xx].selected");

				//If the current list item is selected, then perform the option move
				if (eval("document.forms[0]." + remove_from_select + ".options[xx].selected")==true){
				
					//Get the selected tags value and display text so we can add them to the other select box
					var option_text = eval("document.forms[0]." + remove_from_select + ".options[xx].text");
					var option_value = eval("document.forms[0]." + remove_from_select + ".options[xx].value");
					
					//Get the number of items in the 'Removed Items' select list AND Add use for option tag index in new list
					var removed_items_len = eval("document.forms[0]." + add_to_select + ".length");								
					var max_add_list_index = (removed_items_len - 1);
					
					//Move all the items down one, start with the last option value
					for (var tt=max_add_list_index; tt>=0; tt--){
						var move_to_dex = (tt + 1);
						var move_text = eval("document.forms[0]." + add_to_select + ".options[tt].text");
						var move_value = eval("document.forms[0]." + add_to_select + ".options[tt].value");
						
						eval("document.forms[0]." + add_to_select + ".options[move_to_dex] = new Option(move_text,move_value)");
					}
					
					//Now, add the selected item to the 'Removed Items' select list.  The Option pair goes Option("Display Text", "Option Value")
					eval("document.forms[0]." + add_to_select + ".options[0] = new Option(option_text,option_value)");
					
					//Select the new entry in the select box
					eval("document.forms[0]." + add_to_select + ".selectedIndex = removed_items_len");
					//Now, remove the selected item from the original select box
					eval("document.forms[0]." + remove_from_select + ".options[xx] = null");					
				}
			}			
			//Select the top item in the select box
			eval("document.forms[0]." + remove_from_select + ".selectedIndex = 0");	
			eval("document.forms[0]." + add_to_select + ".selectedIndex = 0");	
		}
	}	
	//Exit function
	return true;				
}

</script>