
<!-- timekeeping/act_validate_hours_js.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I validate the hours field in the express/time entry screens

	||
	Edits: 
	$Log$
	||
	Variables:
	
	END FUSEDOC --->
</cfsilent>
<script language="JavaScript" type="text/javascript">
<!--
function validate_number(arg1){
	
	if (arg1.length){
		if(isNaN(arg1)){
			return 0;
		}
	}
}

function check_form(arg1){
	var stop = 0;
	var i = 0;
	while(i < document.myform.elements.length){
		if(document.myform.elements[i].name == arg1){
			valid = validate_number(document.myform.elements[i].value);
			if (valid == 0){
				stop = 1;
				break;
			}
		}
		i++;
	}
	if(stop == 1){
		alert('Please make sure that all hours entries are numeric.')
		return 0;
	} else {
		document.myform.submit();	
	}

}
//-->
</SCRIPT>