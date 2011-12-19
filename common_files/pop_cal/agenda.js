////////// Default Action when you click a normal date //////////
var gsAction=" ";


////////////// Add Agendas //////////////////////////////////////////
// Usage -- addEvent(date, message, color, action, imgsrc);
// Notice:
// 1. The format of event date is defined in fHoliday() plug-in. Current format is Y-M-D.
// 2. In the action part you can use any javascript statement.
// 3. Assign <null> to action part will result in a line-through effect of that day, while <" "> not.
// 4. imgsrc is the URL of your image, you can omit it if no image to show.
/////////////////////////////////////////////////////////////////////
addEvent("", gcBG, null);//2001-5-13", "Disabled Date!
addEvent("");//2001-5-14", "You may customize me!", "gray", "popup('mailto:popcal@yahoo.com?subject=Excellent Calendar')
addEvent("");//2001-7-20", " July 20, 2001 \n PopCalendarXP 4.0 Unleashed! ", "gold", "popup('readme.txt');


////////////////////////////////////////////////////////////////////////////////
// Holiday PLUG-IN Function -- return [message,color,action,imgsrc] like agenda!
////////////////////////////////////////////////////////////////////////////////
function fHoliday(y,m,d) {
///// Uncomment any of the following two lines will give you special effect! ///
// if (m!=gCurMonth[1]||y!=gCurMonth[0]) return ["",gcOtherDay,null];	// hide the days of other months
// if (new Date(y,m-1,d+1)<gd) return ["",gcBG];	// cross-over the past days
////////////////////////////////////////////////////////////////////////////////

  var r=agenda[y+"-"+m+"-"+d]; // Define your agenda date format here!!
  if (r) return r;	// put this line to the end will lower the priority of agenda events.

  //if (m==12&&d==25)
	//r=["Merry Xmas!", "seagreen"];
  //else if (m==12&&d==26)
	//r=[" Boxing Day! \n Let's go shopping ... ", "skyblue", "popup('readme.txt','main');"];
  //else if (m==10&&d==1)
	//r=[" China National Day! \n Let's enjoy a long vacation ... ", "skyblue", " "];
 
  return r;
}

