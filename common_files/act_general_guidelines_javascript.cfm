<!-- common_files/act_general_guidelines_javascript.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_general_guidelines_javascript.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="1/11/2007" role="FuseCoder" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>

		</in>
		<passthrough>

		</passthrough>
		<out>

		</out>
	</IO>
</fusedoc>
--->


<script type="text/javascript">

function checkNum(field_id)
	{

	var div_id=field_id;
	div_id=div_id.replace(/Text/, "Div");
	if ($F(field_id)!=parsefloat($F(field_id)))
		{
			alert('You must enter a valid numerical expression with no letters or special characters (such as $, %, @, etc).');
			$(field_id).value=$(div_id).innerHTML;
			//calcChart();
			$(field_id).select();
		}
	else
		{
			$(div_id).innerHTML=$F(field_id);
			Element.toggle(div_id); //show the table cell
			Element.toggle(field_id); //hide the text input
		}
	}

function ModifyDiv(field_id,colID)
	{

	var div_id=field_id;
	div_id=div_id.replace(/Text/, "Div");

	$(div_id).innerHTML=$F(field_id);
	Element.toggle(div_id); //show the table cell
	Element.toggle(field_id); //hide the text input

	}

function AddNewRow()
	{
	var currCount=$('currRowCount');
	var maxCount=10;

	if(parseInt(currCount.value) + 1 >=parseInt(maxCount))
		{
			alert('Sorry, but max number of rows has been reached');
			return false;
		}
	else
		{
			var tr="hidden_tr_" + parseInt(currCount.value);
			Element.toggle(tr);
			currCount.value=parseInt(currCount.value) + 1;	 
			return true;
		}
	}
function AddColumn()
	{
	var rowCount=$('rowCount');
	var currCount=$('curr_hidden_count');
	var maxCount=$('max_hidden_count');

	if(parseInt(currCount.value) + 1 >=parseInt(maxCount.value))
		{
			alert('Sorry, but max number of columns has been reached');
			return false;
		}
	else
		{

			var th="hidden_th_" + parseInt(currCount.value);

			Element.toggle(th);

			for (var x=1; x <=rowCount.value; x++)
				{
			   		var td="hidden_td_" + x + "_" + parseInt(currCount.value);
			   		Element.toggle(td); 
			   	}
			currCount.value=parseInt(currCount.value) + 1;	 
			return true;
		}
	}

function RemoveColumn(colID)
	{
	var rowCount=$('rowCount');
	var currCount=$('curr_hidden_count');

	var th="hidden_th_" + colID;

	Element.toggle(th);

	for (var x=1; x <=rowCount.value; x++)
		{
	   		var td="hidden_td_" + x + "_" + colID;
	   		Element.toggle(td); 
	   	}
	<!--- currCount.value=parseInt(currCount.value) - 1;	 ---> 
	return true;

	}

</script>