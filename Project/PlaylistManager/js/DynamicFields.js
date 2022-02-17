var room = 1;
function education_fields() {
    room++;
    var objTo = document.getElementById('education_fields')
    var divtest = document.createElement("div");
	divtest.setAttribute("class", "form-group removeclass"+room);
	var rdiv = 'removeclass'+room;
    divtest.innerHTML = '<div style="display: inline;"><div style="display: inline;" class="form-group"><input style="width: 30%; display: inline;" type="url" class="form-control" id="VideoURL' + room + '" name="Url" value="" placeholder="Video URL"></div></div><div style="display: inline;"><div style="display: inline;" class="form-group"><div style="display: inline;" class="input-group"><div style="display: inline;" class="input-group-btn"><button style="display: inline;" class="btn btn-danger" type="button" onclick="remove_education_fields(' + room +');"><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></button></div></div></div></div><div class="clear"></div>';
    
    objTo.appendChild(divtest)
}
   function remove_education_fields(rid) {
	   $('.removeclass'+rid).remove();
   }