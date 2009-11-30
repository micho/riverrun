jQuery.fn.updatePiece = function(n) {
  $("td.piece").hide();
}

jQuery(document).ready(function($){

  setInterval(function(){ 
    $("table#work_show td.piece").each(function(n,obj){
      $.ajax({
    		type: "GET",
    		url: "/piece/" + obj.id,
    		data: "_method=GET",
    		dataType: "script",
    		beforeSend: function(xhr) {xhr.setRequestHeader("Accept", "text/javascript");}
      });
    })
  }, 3000);

});
