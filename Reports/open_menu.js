<script>
function goto(arg, arg1){
document.input_form.submit();
}

	function MM_displayStatusMsg(msgStr) { //v2.0
  		status=msgStr;
  		document.MM_returnValue = true;
		}
	function FolderInit(){
	tempColl = document.all("SubMenu");
		for (i=0; i<tempColl.length; i++) {
			tempColl(i).style.display = "none";
		}
	}
	function openMenu($1){
		//FolderInit();
		tempCollSub = document.all("SubMenu");
		i = eval($1);
		
		if(tempCollSub(i).style.display == "block"){
			tempCollSub(i).style.display = "none";
		}else{
			tempCollSub(i).style.display = "block";
			}
		for (m=0; m<tempCollSub.length; m++) {
			if(m != i){
			tempCollSub(m).style.display = "none";
			}
		}
	}
	function opensubMenu($1){
		//FolderInit();
		tempCollSub = document.all("SubSubMenu");
		i = eval($1);
		
		if(tempCollSub(i).style.display == "block"){
			tempCollSub(i).style.display = "none";
		}else{
			tempCollSub(i).style.display = "block";
			}
		for (m=0; m<tempCollSub.length; m++) {
			if(m != i){
			tempCollSub(m).style.display = "none";
			}
		}
	}
	function opensubsubMenu($1){
		//FolderInit();
		tempCollSub = document.all("SubSubSubMenu");
		i = eval($1);
		
		if(tempCollSub(i).style.display == "block"){
			tempCollSub(i).style.display = "none";
		}else{
			tempCollSub(i).style.display = "block";
			}
		for (m=0; m<tempCollSub.length; m++) {
			if(m != i){
			tempCollSub(m).style.display = "none";
			}
		}
	}
</script>