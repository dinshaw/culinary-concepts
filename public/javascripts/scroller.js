// gives up and down scroll buttons to images, spans, ... named up_name, down_name, respectively. 
// will keep the default scroll_box's style overflow if it encounters errors (so make overflow: auto;) 
// usage: put this after the scrollbox div:  var div_scroll1 = new TextScroll('div_scroll1', 'scroll_box'); 
function TextScroll(scrollname, div_name, up_name, down_name) 
{ 
	this.div_name = div_name; 
	this.name = scrollname; 
	this.scrollCursor = 0; 
	this.speed = 5; 
	this.timeoutID = 0; 
	this.div_obj = null; 
	this.up_name = up_name; 
	this.dn_name = down_name; 
	{ 
		if (document.getElementById) { 
			div_obj = document.getElementById(this.div_name);
			if (div_obj) { 
				this.div_obj = div_obj; 
				this.div_obj.style.overflow = 'hidden'; 
			}

			
			div_up_obj = document.getElementById(this.up_name); 
			div_dn_obj = document.getElementById(this.dn_name); 
			
			if (div_obj.scrollHeight > 330 || div_obj.className.indexOf("noheight") != -1) {
				if (div_up_obj && div_dn_obj) { 
					div_up_obj.onmouseover = function() { eval(scrollname + ".scrollUp();") }; 
					div_up_obj.onmouseout = function() { eval(scrollname + ".stopScroll();") }; 
					div_dn_obj.onmouseover = function() { eval(scrollname + ".scrollDown();") }; 
					div_dn_obj.onmouseout = function() { eval(scrollname + ".stopScroll();") }; 
				}
			}else{
				div_up_obj.style.display = "none";
 				div_dn_obj.style.display = "none";
			}  
		} 
	} 
	this.stopScroll = function() { 
		clearTimeout(this.timeoutID); 
	} 
	this.scrollUp = function() { 
		if (this.div_obj) { 
			this.scrollCursor = (this.scrollCursor - this.speed) < 0 ? 0 : this.scrollCursor - this.speed; 
			this.div_obj.scrollTop = this.scrollCursor; 
			this.timeoutID = setTimeout(this.name + ".scrollUp()", 60); 
		}  
	} 
	this.scrollDown = function() { 
		if (this.div_obj) { 
			this.scrollCursor += this.speed; 
			this.div_obj.scrollTop = this.scrollCursor; 
			if (this.div_obj.scrollTop == this.scrollCursor) { 
				this.timeoutID = setTimeout(this.name + ".scrollDown()", 60); 
			} else { 
				this.scrollCursor = this.div_obj.scrollTop; 
			} 
		} 
	} 

	this.resetScroll = function() { 
		if (this.div_obj) { 
			this.div_obj.scrollTop = 0; 
			this.scrollCursor = 0; 
		} 
	} 
}

