jQuery.fn.updatePiece = function(n) {
  $("td.piece").hide();
}

jQuery(document).ready(function($){

  setInterval(function(){ 
    $("table#work_show td.piece").each(function(n,obj){
      $.ajax({
    		type: "GET",
    		url: "/refresh/work/" + obj.id,
    		data: "_method=GET",
    		dataType: "script",
    		beforeSend: function(xhr) {xhr.setRequestHeader("Accept", "text/javascript");}
      });
    })
  }, 3000);

  setInterval(function(){ 
    $("body.edit_pieces input").each(function(n,obj){
      if(obj.disabled)
      {
        $.ajax({
      		type: "GET",
      		url: "/refresh/edit/" + obj.id,
      		data: "_method=GET",
      		dataType: "script",
      		beforeSend: function(xhr) {xhr.setRequestHeader("Accept", "text/javascript");}
        });
      }
    })
  }, 3000);

});
