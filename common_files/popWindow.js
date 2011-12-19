<!--
/*
	popWindow.js
	Use this for pop-up windows.  The Random function is used so we can have multiple windows open 
	at the same time. - Josh 10-SEPT-2003
*/
function Random() 
	{
	limit = 99999999;
	today = new Date();
	num = today.getTime();
	num = Math.round(Math.abs(Math.sin(num) * 1000000)) % limit;
	return num;
	}

function popWindow(URL,h,w) 
	{
	LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
	TopPosition = (screen.height) ? (screen.height-h)/4 : 0;
	WindowName = Random(); //set the window to a random name
	popupWin = window.open(URL, 'PopUpWindow_' + WindowName,'height='+ h + ',width='+ w + ',top='+TopPosition+',left='+LeftPosition+', toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
	if (!popupWin.opener) 
		{
	  	popupWin.opener = self;
		}
	popupWin.focus();
	}

-->