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