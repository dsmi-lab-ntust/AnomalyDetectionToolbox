document.ready = function(){
	var createDiv=document.createElement("div");
	createDiv.id="smallwindow";
	document.body.appendChild(createDiv);
	createDiv.innerHTML = "testpage1";
	openwindow();
};

function closewindow(){
	var smallwindow = document.getElementById("smallwindow");
	smallwindow.top = 0;
	smallwindow.left = 0;
	smallwindow.width = 0;
	smallwindow.height = 0;
	smallwindow.innerHTML = "";
}

function openwindow(){
	var smallwindow = document.getElementById("smallwindow");
	smallwindow.top = '0px';
	smallwindow.left = '0px';
	smallwindow.width = '100px';
	smallwindow.height = '100px';
}