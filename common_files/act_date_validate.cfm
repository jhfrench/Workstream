
<!-- common_files/ACT_DATE_VALIDATE.CFM
	Author: Josh P.-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I 
	||
	Name: Josh Peters
	||
	Edits: 
	$Log$
	||
	Variables:
	
	END FUSEDOC --->

<cf_htmlhead>	
<script language="javascript">
<!--
//This function is used througout the website for all date validation.  We want all our dates to
//be in a uniform mm/dd/yyyy 10-digit format. Then the date will be tested to verify that the user
//entered valid values for all 3 parts of date (month specific).  This function also verifies correct days 
//values for any months that fall in Feb.  Anytime a problem is found with the date entered, the user will
//receive a JS prompt telling them to change their entry.  The only parameter used specifically by this
//function is 'thisObj', all of the other parameters that are passed are legacy parameters from the old
//function; we did not remove them so that we were able to easily plug this function in and also just in 
//case we may need them in the future. - Josh Peters 10-January-2002.
	function VerifyThisdate(thisObj){	
		var today = new Date();						//Build valid year range based off of current year
		var minYear = (today.getYear() - 100);		//The nums I'm adding are abritrary, I wanted to go pretty
		var maxYear = (today.getYear() + 35);		//far back for the min because we do test birthdates.
		var dtFieldDate = thisObj.value;			//Get value entered by user	
	
		//Load months so we can display alpha version of month in validation messages to user
		var months = new Array("","January","Februrary","March","April","May","June","July","August","September","October","November","December");
		
		//Make sure the field is not empty. Don't do anything except return true if it is blank
		if (dtFieldDate != ""){							
			var datePartArray = dtFieldDate.split("/");	//Split the specified value on the / delimiter	
			
			//Test date entered to make sure it is 10 characters long and that, when split, the array has 3 elements
			if (dtFieldDate.length!=10 || datePartArray.length!=3){	
				alert(dtFieldDate + " is an invalid date. Please re-enter the 10-digit date in mm/dd/yyyy format or leave blank if not required.");
				thisObj.focus();					//Don't let the user click back out until they've fixed the problem
				thisObj.value='';
				return false;	
				
			} else {	
				var mm = datePartArray[0];				//Loading date part variables
				mm_dex = mm.replace("0","");			//Remove any leading zeroes from the number b/c JS doesn't like it
				var dd = datePartArray[1];
				var yyyy = datePartArray[2];
				
				//Test the year to make sure its 4 digits, a number and between our specified range			
				if ((isNaN(yyyy)==true) || yyyy < minYear || yyyy > maxYear || yyyy.length!=4){	
					alert(yyyy + " is not a valid year. Year must be 4 digits (e.g. 1987).");
					thisObj.focus();
					thisObj.value='';
					return false;	
				} else {
			
					//Test the specified month and make sure it is 2 digits, a number and between 1 and 12. We do more in depth testing below			
					if ((isNaN(mm)==true) || mm < 1 || mm > 12 || mm.length!=2){
						alert(mm + " is not a valid month. Please re-enter the 2-digit month or leave blank if not required.");
						thisObj.focus();
						thisObj.value='';
						return false;	
					} else {
					
						//Test the day, make sure its a 2-digit number and between 1 and 31. We do more in depth testing below
						if ((isNaN(dd)==true) || dd < 1 || dd > 31 || dd.length!=2){
							alert(dd + " is not a valid day. Please re-enter the 2-digit day or leave blank if not required.");
							thisObj.focus();
							thisObj.value='';
							return false;	
						} else {
						
							//If the month passed is a month with only 30 days in, then verify it isn't over 30
							if ((mm==4 || mm==6 || mm==9 || mm==11) && dd > 30){					
								
								alert(months[mm_dex] + " has only 30 days.");
								thisObj.focus();
								thisObj.value='';
								return false;					
							} else {//Otherwise, account for the other months that will have 31 days in
							
								//Validate all other months except for Feb
								if ((mm==1 || mm==3 || mm==5 || mm==7 || mm==8 || mm==10 || mm==12) && dd > 31){				
									alert(months[mm_dex] + " has only 31 days.");
									thisObj.focus();
									thisObj.value='';
									return false;					
								}		
								//Validate if month is Februrary that it isn't over the year's number of Feb dates
								else{
	
									//FEB-LEAP YEAR VALIDATION: If the remainder of the year divided by 4 is not 0, then the month has 28 days in it
									if (mm==2 && yyyy % 4 > 0 && dd > 28){				
										alert("Februrary of " + yyyy + " has only 28 days.");
										thisObj.focus();
										thisObj.value='';
										return false;				
									}
									//If the remainder of the year divided by 4 does equal 0, then feb has 29 days in it
									else if (mm==2 && yyyy % 4 == 0 && dd > 29){				
										alert("Februrary of " + yyyy + " has only 29 days.");
										thisObj.focus();
										thisObj.value='';
										return false;				
									}		
								}			
							}				
						}					
					}						
				}							
			}								
		}									
		return true;						//If it made it here, then the date is either blank or in valid format
	}										//End Function
//-->
</script>
</cf_htmlhead>
</cfsilent>
