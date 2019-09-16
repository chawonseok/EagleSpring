$(document).ready(function(){
	var search = false;
	

	//글씨 클릭 시 텍스트창 나오게하기
	$(".content").click(function(){
/*		$(".content span").animate({
			"opacity":"0"
		}, 500);
*/
		$('.content .search-site').animate({
			"opacity":"1"
		},500);
	});
	
	$("#visual ul").mouseover(function(event){
		
	});
	
	//navigation
	var nav = $("#header ul li");
	nav.eq(0).click(function(){
		var offset = $("#second-page").offset();
		$('html, body').animate({
        	scrollTop : offset.top}
        , 400);
		
		nav.css({
			
			
		});
		
		$("#second-page").css({
			
			
		});
	}); 
	nav.eq(1).click(function(){
		var offset = $("#third-page").offset();
		$('html, body').animate({
        	scrollTop : offset.top}
        , 400);
		
		
		
	}); 
	nav.eq(2).click(function(){
		var offset = $("#fourth-page").offset();
		$('html, body').animate({
        	scrollTop : offset.top}
        , 400);
		
		
		
	}); 
});