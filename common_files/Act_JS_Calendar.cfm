
<!-- common_files/Act_JS_Calendar.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the code for the JS clendar.

	||
	Edits: 
	$Log$
	||
	Variables:
	
	END FUSEDOC --->
<iframe src="<cfoutput>#request.dir_level#</cfoutput>common_files/pop_cal/popcjs.htm" name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" scrolling="no" frameborder="0" style="border:ridge;visibility:hidden;position:absolute;z-index:65535"></iframe>