
<!--Timekeeping/dsp_express_input.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the .
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
 --->
</cfsilent>
<cfoutput>
<form name="form_time_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST" class="add_row">
	<h2><em>-Express=</em> Time Entry</h2>
	<span class="template">
		<div class="row-fluid">
			<div class="span3">
				<input type="date" name="date" min="#variables.min_date#" max="#variables.max_date#" value="" maxlength="10" required="required" class="span8 date" />
			</div>
			<div class="span1">
				<input type="number" name="hours" step="0.25" min="0" max="24" required="required" class="number span12" />
			</div>
			<div class="span4">
				#variables.select_work_item#
			</div>
			<div class="span4">
				<textarea rows="1" cols="25" name="notes_1" id="notes_1" wrap="soft" data-name_prefix="notes_" required="required" class="span12"></textarea>
			</div>
		</div>
	</span>
	<div class="row-fluid">
		<div class="span12">
			<input type="hidden" name="date_locked" value="#get_date_locked.date_locked#" />
			<input type="hidden" name="last_loaded" value="#now()#" />
			<input type="submit" name="Submit" value="Submit Time Entry" class="btn btn-primary" />
		</div>
	</div>
</form>
</cfoutput>


<script language="JavaScript" type="text/javascript">
var enableExpress=function(){
	//$('div.tree>ul').find('ul>li').hide();
	var $template=$('form.add_row').find('span.template');
	$template
		.find('div.span3:first').prepend('<button type="button" class="btn btn-small btn-danger remove-row"><i class="icon-minus icon-white"></i><span class="visible-desktop"> Delete</span></button>')
		.end().after('<div class="row-fluid"><div class="span2"><button type="button" name="add_row" id="add_row" class="btn btn-inverse btn-small"><i class="icon-plus icon-white"></i> Add entry</button></div></div>');
	var new_row=$template.html(),
		rebuildName=function(){
			$('[data-name_prefix]').each(function(index){
				var completeName=$(this).attr('data-name_prefix')+(index+1);
				$(this).prop('id', completeName).attr('name', completeName);
			});
		};
	rebuildName();
	$('#add_row').click(function(){
		$template.append( new_row ).find('button.remove-row').click(function(){
			$(this).closest('div.row-fluid').remove();
		});
		rebuildName();
	});
	$('button.remove-row').click(function(){
		$(this).closest('div.row-fluid').remove();
		rebuildName();
	});
	return true;
};
</script>