<!--common_files/act_calendar.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the JavaChart pop-up calendars.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:40:57  daugherty
Initial revision

Revision 1.2  2001-11-02 12:05:32-05  long
still done

Revision 1.1  2001-10-11 10:58:07-04  long
Added $log $ for edits to all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
<cfset counter=0>
<cfparam name="attributes.form_name" default="myform">
<cfparam name="attributes.field_name" default="DateField1">
<cfparam name="attributes.x_pos" default="400">
<cfparam name="attributes.y_pos" default="300">
</cfsilent>
<cfoutput>
<script language="Javascript">
<!--
var ilayer = 0;
var gotlayers = 0;
NS = (document.layers) ? 1 : 0;
IE = (document.all) ? 1 : 0;

if (NS) {
	gotlayers = 1;
}
if (IE) {
	gotlayers = 1;
}

function popUp(on)
{
   var lLay;
   if (IE) {
      lLay = document.all['popCal'];
   } else {
      lLay = document.layers['FormLayer'].document.layers['popCal'];
   }
	
   if (gotlayers) {
	if (on) {
		moveLayers();
		if (IE) {
			lLay.style.visibility = "visible";
		} else {
			lLay.visibility = "show";
		}
	} else {
		if (IE) {
			lLay.style.visibility = "hidden";
		} else {
			lLay.visibility = "hide";
		}
	}
   }
}

//-->
</script>
<script language="Javascript">
function seeDate() 
   {
<cfloop list="#attributes.field_name#" index="ii">
	var i = document.tL1.GETDATE();
	document.#attributes.form_name#.#ii#.value = i;
</cfloop>
    return;
   }
</script>
<script language="Javascript">
<!--
function SeeDate(i)
{
  var thedoc;
  if (NS) 
	thedoc = document.layers['FormLayer'].document.f;
  else
  	thedoc = document.f ;
<cfloop list="#attributes.field_name#" index="ii">
<cfset counter=incrementvalue(counter)>
  if (ilayer == #counter#) 
  	document.#attributes.form_name#.#ii#.value = i;
</cfloop>
  HideDate();
  return;
}

function ShowDate(i)
{
  if (ilayer > 0) {
	  HideDate();
  }
  ilayer = i;
  popUp(true);
  return;
}

function moveLayers()
{
   var lLay, x, y ;
   <cfif attributes.x_pos EQ "relative"> 
	 	x = window.event.x + document.body.scrollLeft - 280 ;
	  	y = window.event.y + document.body.scrollTop - 5 ;
   <cfelse>
		x = #attributes.x_pos#;
		y = #attributes.y_pos#;
   </cfif> 
  
  
   if (IE) {
      lLay = document.all['popCal'];
   } else {
      lLay = document.layers['FormLayer'].document.layers['popCal'];
   }
   if (gotlayers) {
	if (NS) {
		lLay.left = x;
		lLay.top = y;
	} else {
		lLay.style.pixelLeft = x;
		lLay.style.pixelTop = y;
	}
   }
}

function HideDate()
{
  popUp(false);
  return;
}
// -->
</script>
</cfoutput>