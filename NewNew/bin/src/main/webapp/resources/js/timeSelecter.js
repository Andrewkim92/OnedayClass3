//board timeSelecter

$(document).ready(function timeSelecter() {
	var len = document.getElementsByName("hourSelect").length;
	var len2 = document.getElementsByName("minSelect").length;
	
	for(var j = 0; j < len; j++){
		var timeSelect = document.getElementsByName("hourSelect")[j];
		var docfrag = document.createDocumentFragment();
		var hour = "";
		for(var i = 0; i <24; i++){
			hour = i < 10 ? "0" + i : i;
			
			var option = document.createElement("option");
			var optionElement = i == 0 ? 
					"<option value ='" + hour + "' selected>" + hour + "</option>" 
					: "<option value ='" + hour + "'>" + hour + "</option>";
					
			option.innerHTML = optionElement;
			docfrag.appendChild(option);
		}
		timeSelect.appendChild(docfrag);
	}
	
	for(var j = 0; j < len2; j++){
		var timeSelect = document.getElementsByName("minSelect")[j];
		var docfrag = document.createDocumentFragment();
		var min = "";
		for(var i = 0; i <6; i++){
			min = i + "0";
			
			var option = document.createElement("option");
			var optionElement = i == 0 ? 
					"<option value ='" + min + "' selected>" + min + "</option>" 
					: "<option value ='" + min + "'>" + min + "</option>";
					
			option.innerHTML = optionElement;
			docfrag.appendChild(option);
		}
		timeSelect.appendChild(docfrag);
	}
});

