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
	createDiv.innerHTML = "<iframe src=\"detail/"+name+".html\"></iframe>"
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
	detailwindow.style.top = absolute_top+target.offsetHeight+'px';
	detailwindow.style.left = absolute_left+target.offsetWidth+'px';
	detailwindow.style.width = '300px';
	detailwindow.style.height = '200px';
	detailwindow.firstChild.style.display = 'inline';
}

function closedetail(name){
	var detailwindow = document.getElementById("detailwindow"+name);
	detailwindow.style.top = '0px';
	detailwindow.style.left = '0px';
	detailwindow.style.width = '0px';
	detailwindow.style.height = '0px';
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