var scr_btn = document.getElementById('scr_btn'),
	docElem = document.documentElement,
	offset,
	scrollPos,
	docHeight;
	docHeight = Math.max(docElem.offsetHeight ,docElem.scrollHeight);
	scrollPos = docElem.scrollTop;
	
	if(docHeight != 'undefined'){
		offset = docHeight / 4;
	}
	
	window.addEventListener('scroll', function(){
		scrollPos = docElem.scrollTop;
		
		scr_btn.className = (scrollPos > offset) ? 'visible' : '' ;
	});
	
	scr_btn.addEventListener('click',function(){
		window.scrollTo(0,0);
	});