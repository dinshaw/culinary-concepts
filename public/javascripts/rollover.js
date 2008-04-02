function prepareNav() {

	if (!document.getElementsByTagName) return false;
	if (!document.getElementById) return false;


	//Check if the tab exsists, if not do nothing
	if(document.getElementById("nav_main")) {

		var nav = document.getElementById("nav_main");

		var links = nav.getElementsByTagName("a");

		for ( var i=0; i < links.length; i++) {

			links[i].onmouseover = function() {
				return navRollOver(this,"over");
			}
			links[i].onmouseout = function() {
				return navRollOver(this,"out");
			}
		}
	}
}

function navRollOver(anchor, state) {

	//get the first image element
	var img =  anchor.getElementsByTagName("img")[0]
	
	if(state == "over") {
		
		img.setAttribute("src",img.src.replace(/-off/,"-on"));	

	}else if (state == "out") {
	
		img.setAttribute("src",img.src.replace(/-on/,"-off"));			
	}


	//set the image src

}

addLoadEvent(prepareNav);