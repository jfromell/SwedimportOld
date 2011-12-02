// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
	
	$("#mainSlider").jCarouselLite({
		btnNext: "#sliderNextBtn",
		btnPrev: "#sliderPrevBtn",
		visible: 1
	});
	
	centerSideBarImage();
	
	$("#serviceListContainer .centerContainer .oneThird").last().addClass('last');
	
	$("table tbody tr:odd").addClass('odd');
	
});

function centerSideBarImage(){
	var imageWidth 		= $(".sidebarGeneral .img img").width();
	var imagePadding	= ((183 - imageWidth) / 2) - 2;
	
	$(".sidebarGeneral .img img").css('padding', imagePadding);
}

$.tablesorter.addParser({
  
  id: 'strippedChars',
  is:function(s){
    return false;
  },
  
  format: function(s){
    
    string = s.toString().replace(/[a-zA-Z]+/, '');
    
    while(string.length < 3){
      
      string = '0' + string;
      
    }
    
    return string;
    
  },
  
  type: 'numeric'
  
});