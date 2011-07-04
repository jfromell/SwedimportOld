$(document).ready(function(){
	
	// Load treeTable
	$("#doTree").treeTable({
		treeColumn: 1
	});
	
	// Set button to disabled if no checkbox is checked
	$(":checkbox").click(countChecked);
	$(".bulk_delete").attr('disabled', true);
	
	// Toggle more pictures
	$("li.hidden").first().removeClass('hidden');
	$("a#addPhoto").click(function(e){
		e.preventDefault();
		
		$("li.hidden").first().removeClass('hidden').show();
	});
	
	// Add multiple records
	$("form a.add_record").live('click', function(){
		var assoc		= $(this).attr('data-model');
		var content	= $('#' + assoc + '_fields_template').html();
		
		var regexp = new RegExp('new-id-here', 'g');
		var new_id = new Date().getTime();
		
		content = content.replace(/new-id-here/gi, new_id);
		
		console.log(content);
		
		$(this).parent().before(content);
		
		return false;
	});
	
	$('form a.remove_record').live('click', function(){
		$(this).closest('.new_fields').remove();
		
		return false;
	});
	
});

function countChecked(){
	var n = $("input:checked");
	//alert (n);
	
	if(n.length > 0){
		$(".bulk_delete").attr('disabled', false);
	} else {
		$(".bulk_delete").attr('disabled', true);
	}
}