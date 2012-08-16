
<!--Reports/act_gross_hours_ytd_js.cfm
	Author: Joshua Peters -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the Javascript for the Gross Hours Detail Report.
	||
	Name: Joshua Peters
	||
	Edits:
	 || 
	END FUSEDOC --->
</cfsilent>
<script language="javascript">
<!--
//function selectAllList(list,list_sting): This function is needed for selecting all items from 
//a list when the specified passed string('list_string') is selected.  All items, but the passed operand are selected
//in the list which is also passed to the function via 'list'. Josh Peters 11/12/2001
	function selectAllList(list,list_sting){
		//Dynamically load the current form name that the caller is coming from
		var form = document.forms[0].name;

		//Don't do this as you would a when retreiving a normal select box value(s) 
		//because we just want to check the first selection is not 'ALL'
		var list_val = eval(form + "." + list + ".value");

		//If the user has selected ALL, then iterate over list and select all items except for ALL (position 1)
		if (list_val == list_sting){

			//Grab the number of items in list and select them all
			var list_len = eval(form + "." + list + ".length");

			//Make sure the list allows multi-selects by setting to true 
			eval(form + "." + list + ".multiple=true");

			//Loop over and select all items in list
			for(var ii=1  ;ii < list_len; ii++){
				eval(form + "." + list + ".options[ii].selected =true");
			}

			//Return the user back to the top of the list
			eval(form + "." + list + ".options[0].selected =true");

		}

		//Give something back to the caller just in case some idiot is making a referencial call on function
		return false;
	}
//-->
</script>