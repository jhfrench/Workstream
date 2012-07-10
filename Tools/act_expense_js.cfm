
<!--common_files/act_calendar.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<script language="Javascript">
<!--
var ilayer = 0 ;
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
   var lLay ;
   

   if (IE) {
      lLay = document.all['popCal'] ;
   } else {
      lLay = document.layers['FormLayer'].document.layers['popCal'] ;
   }
	
   if (gotlayers) {
	if (on) {
		moveLayers() ;
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
	var i = document.tL1.CURRENT_TIMESTAMP ;
	document.myform.Date_Due.value = i ;
    return ;
   }
</script>
<script language="Javascript">
<!--
function SeeDate(i)
{
  var thedoc ;
  if (NS) 
	thedoc = document.layers['FormLayer'].document.f ;
  else
  	thedoc = document.f ;
  if (ilayer == 1) 
  	thedoc.DateField1.value = i;
  if (ilayer == 2) 
  	thedoc.DateField2.value = i;
  if (ilayer == 3) 
  	thedoc.DateField3.value = i;
  HideDate();
  return;
}

function ShowDate(i)
{
  if (ilayer > 0) {
	  HideDate() ;
  }
  ilayer = i ;
  popUp(true);
  return;
}

function moveLayers()
{
   var lLay, x, y  ;
   x = 295 ;
   y = (ilayer * 32) - 28 ;
   if (IE) {
      lLay = document.all['popCal'] ;
   } else {
      lLay = document.layers['FormLayer'].document.layers['popCal'] ;
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
  popUp(false) ;
  return;
}
// -->
</script>
