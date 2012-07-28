<!---
<fusedoc fuse="js_reload_and_close.cfm">
	<responsibilities>
		To update the Counselor Experience
	</responsibilities>
	<io>
		<in>
			<string name="attributes.counselor_id" comments="counselor record ID" />
			<string name="attributes.experience_id" comments="List of experience that the counselor has jurisdictions" />
		</in>
	</io>
</fusedoc>
--->
<cf_htmlhead>
<script language="JavaScript">
	/*Set an indicator to false to determine whether we have the hidden form field that 
	contains the current tab, this way if the parent page doesn't have tabs it won't error out
	when this functionality attempts to reload the page.*/
	var curr_layer="";

	for (var ii=0; ii<window.opener.document.forms.length; ii++){

		//Loop over all the elements in the page and check each ones name for the hidden filed.
		for (var xx=0; xx<window.opener.document.forms[ii].elements.length; xx++){
			//If we find the form field, then set our indicator to true
			if (window.opener.document.forms[ii].elements[xx].name=="current_tab"){
				curr_layer=window.opener.document.forms[ii].current_tab.value;
			}
		}
	}

	//If we found our hidden field, then grab it's value and concatonate onto the URL
	if (curr_layer!=""){
		//Get the current value of the URL
		var parent_url=opener.location.href;
		//Remove any previous tabs we loaded before this call
		var url_array=parent_url.split("&current_tab=");
		//Build our new URL
		parent_url=url_array[0]+"&current_tab="+curr_layer;
		//Set the paren't URL to the new concatonated version
		opener.location.href=parent_url;
		//Use go instead of reload to retain page properties
		opener.history.go(1);
	}else{
		opener.location.reload();
	}




	//Close the child window
	window.close();
</script>
</cf_htmlhead>