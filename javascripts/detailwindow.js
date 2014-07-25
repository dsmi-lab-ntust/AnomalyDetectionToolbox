document.ready = function(){
};

function createDiv(name){
	if(document.getElementById("detailwindow"+name)){
		return false;
	}
	var createDiv=document.createElement("div");
	createDiv.id="detailwindow"+name;
	createDiv.className="detailwindow";
	document.body.appendChild(createDiv);
	detailiframe = document.createElement("iframe");
	detailiframe.setAttribute("src", "detail/"+name+".html"); 
	createDiv.appendChild(detailiframe);
	detailiframe.height=detailiframe.contentWindow.document.body.scrollHeight+50+"px";
	detailiframe.width=detailiframe.contentWindow.document.body.scrollWidth+"px";
	createDiv.style.width = detailiframe.clientWidth+"px";
	createDiv.style.height = detailiframe.clientHeight+"px";
	closedetail(name);
}

function opendetail(name,target){
	createDiv(name);
	var detailwindow = document.getElementById("detailwindow"+name);
	var absolute_left = 0;
    var absolute_top  = 0;
	var obj = target;
    while(obj != document.body){
        absolute_left += obj.offsetLeft;
        absolute_top  += obj.offsetTop;

        obj = obj.offsetParent;
    }
	detailwindow.style.top = tempY+'px';
	detailwindow.style.left = tempX+'px';
	//detailwindow.style.width = '300px';
	//detailwindow.style.height = '200px';
	detailwindow.firstChild.style.display = 'inline';
}

function closedetail(name){
	var detailwindow = document.getElementById("detailwindow"+name);
	detailwindow.style.top = '0px';
	detailwindow.style.left = '0px';
	//detailwindow.style.width = '0px';
	//detailwindow.style.height = '0px';
	detailwindow.firstChild.style.display = 'none';
}

// Detect if the browser is IE or not.
// If it is not IE, we assume that the browser is NS.
var IE = document.all?true:false

// If NS -- that is, !IE -- then set up for mouse capture
if (!IE) document.captureEvents(Event.MOUSEMOVE)

// Set-up to use getMouseXY function onMouseMove
document.onmousemove = getMouseXY;

// Temporary variables to hold mouse x-y pos.s
var tempX = 0
var tempY = 0

// Main function to retrieve mouse x-y pos.s
function getMouseXY(e) {
  if (IE) { // grab the x-y pos.s if browser is IE
    tempX = event.clientX + document.body.scrollLeft
    tempY = event.clientY + document.body.scrollTop
  } else {  // grab the x-y pos.s if browser is NS
    tempX = e.pageX
    tempY = e.pageY
  } 
  // catch possible negative values in NS4
  if (tempX < 0){tempX = 0}
  if (tempY < 0){tempY = 0} 
  return true
}

function changeDoc(page_name,active_name,target_name,id){
	var xmlhttp;
	if (window.XMLHttpRequest){
		// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	}
	else{
	// code for IE6, IE5
	  xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			if(!target_name){
				target_name = "main_article";
			}
			document.getElementById(target_name).innerHTML = xmlhttp.responseText;
			if(active_name){
				var active_li = document.getElementById(active_name);
				var childNodes = active_li.parentNode.childNodes;
				for(x in childNodes){
					childNodes[x].className = "";
				}
				active_li.className = "active";
			}
			if(id){
				location.hash = "#"+id;
				location = location;
			}
		}
	}
	xmlhttp.open("GET",page_name,true);
	xmlhttp.send();
}
changeDoc("Introduction.html","Introduction");
