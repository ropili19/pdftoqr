

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<link href="/css/micss.css" media="all" rel="stylesheet" type="text/css" />
</head>
<body>

<div class="container">
 <DIV id="PANEL_0" class="panel panel-info text-justify">
  <h2>Bienvenido al proceso de transformacion de Videos de PDF a QR</h2>
  <form action="" id="form1" name="form1"  enctype="multipart/form-data">
  <input type="file" name="file" id="file" >
  <button type="button" class="btn btn-info btn-lg" id ="inicio" data-toggle="modal" data-target="#myModal">Iniciar</button>
</form>
</div>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">PDF Multimedia a QR</h4>
        </div>
        <div class="modal-body">
          <p id="mensaje"></p>
          <div id="resultado">
          <form id="form2" class="form-inline" action="">
          
          </form>
          </div>
        </div>
        <div class="modal-footer" id="footerM">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>










	 
	 
	 
	 <div class="container-fluid">
    <h3>Bootstrap Timeline Example</h3>
    <ul class="timeline">
        <li>
          <div class="timeline-badge info"><i class="glyphicon glyphicon-hand-left"></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">Bootstrap 3 released</h4>
              <p><small class="text-muted"><i class="glyphicon glyphicon-time"></i> August 2013</small></p>
            </div>
            <div class="timeline-body">
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis pharetra varius quam sit amet vulputate. 
              Quisque mauris augue, molestie tincidunt condimentum vitae, gravida a libero. Aenean sit amet felis 
              dolor, in sagittis nisi. Sed ac orci quis tortor imperdiet venenatis. Duis elementum auctor accumsan. 
              Aliquam in felis sit amet augue.</p>
            </div>
          </div>
        </li>
        <li class="timeline-inverted">
          <div class="timeline-badge warning"><i class="glyphicon glyphicon-chevron-right"></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">Bootstrap 2</h4>
            </div>
            <div class="timeline-body">
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis pharetra varius quam sit amet vulputate. 
              Quisque mauris augue, molestie tincidunt condimentum vitae, gravida a libero. Aenean sit amet felis 
              dolor, in sagittis nisi. Sed ac orci quis tortor imperdiet venenatis. Duis elementum auctor accumsan. 
              Aliquam in felis sit amet augue.</p>
            </div>
          </div>
        </li>
        <li>
          <div class="timeline-badge danger"><i class="glyphicon glyphicon-eye-open"></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">Left Event</h4>
              <p><small class="text-muted"><i class="glyphicon glyphicon-time"></i> 3 years ago</small></p>
            </div>
            <div class="timeline-body">
              <p>Add more progress events and milestones to the left or right side of the timeline. Each event can be tagged with a date and given a beautiful icon to symbolize it's spectacular meaning.</p>
            </div>
          </div>
        </li>
        <li class="timeline-inverted">
          <div class="timeline-badge default"><i class="glyphicon glyphicon-home"></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">Right Event</h4>
            </div>
            <div class="timeline-body">
              <p>Add more progress events and milestones to the left or right side of the timeline. Each event can be tagged with a date and given a beautiful icon to symbolize it's spectacular meaning.</p>
            </div>
          </div>
        </li>
        <li>
          <div class="timeline-badge default"><i class="glyphicon glyphicon-home"></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">Left Event</h4>
            </div>
            <div class="timeline-body">
              <p>Add more progress events and milestones to the left or right side of the timeline. Each event can be tagged with a date and given a beautiful icon to symbolize it's spectacular meaning.</p>
            
              <hr>
              <div class="btn-group">
                <button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-toggle="dropdown">
                  <i class="glyphicon glyphicon-cog"></i> <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li class="divider"></li>
                  <li><a href="#">Separated link</a></li>
                </ul>
              </div>
            </div>
          </div>
        </li>
        <li>
           <div class="timeline-badge default"><i class="glyphicon glyphicon-arrow-left"></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">Left Event</h4>
            </div>
            <div class="timeline-body">
              <p>Add more progress events and milestones to the left or right side of the timeline. Each event can be tagged with a date and given a beautiful icon to symbolize it's spectacular meaning.</p>
            </div>
          </div>
        </li>
        <li class="timeline-inverted">
          <div class="timeline-badge success"><i class="glyphicon glyphicon-thumbs-up"></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">Oldest event</h4>
            </div>
            <div class="timeline-body">
              <p>Add more progress events and milestones to the left or right side of the timeline. Each event can be tagged with a date and given a beautiful icon to symbolize it's spectacular meaning.</p>
            </div>
          </div>
        </li>
    </ul>
</div>
	 
	 
	 
	 
	 
	 


</body>
</html>

<script type="text/javascript">
var fich;
function compruebaUrl(){
	
	var urls=$("[id*=url]");
	$(urls).each(function(){
	     var url=$(this);
	     if(url==""){
	     	return false;
	     }
	});
	return true;
}
function guardarUrl(){
	if(compruebaUrl){//lanzo ajax 
	 	info=JSON.stringify($("#form2").serializeArray())
      	
      	 var form = new FormData();
            form.append('file',file.files[0]);
            form.append('info', info);
		 $.ajax(
            {
                type: "POST",
                url:   "http://localhost:8444/procesa",
                data: form,
                contentType: false,
                processData: false,
                cache: false,
                beforeSend: function (xhr) {
                  //  xhr.setRequestHeader("Accept", "application/json");
                   // xhr.setRequestHeader("Content-Type", "application/json");
                },
                success: function (data)
                {
                     
 					$('#myModal').modal('hide');
                   alert(data);
 
                },
                 error: function (data, status, er) {
                    alert("error: " + data + " status: " + status + " er:" + er);
                }
	});
	}
	return false;
	
}
  $('#inicio').click(function(){
  $('#result').html('');
 
  var oMyForm = new FormData();
var info=JSON.stringify($("#form2").serializeArray())
  oMyForm.append("file", file.files[0]);
  oMyForm.append("info",info);
  fich=oMyForm;
 var indiceVideo=1;
  $.ajax({
    url: 'http://localhost:8444/procesa',
    data: oMyForm,
    dataType: 'json',
    processData: false,
    contentType: false,
    type: 'POST',
    beforeSend: function(data) {
    	$("#mensaje").val("loading");
		    $.ajax({
		    url: 'http://localhost:8444/getMultimedias',
		    data: oMyForm,
		    dataType: 'json',
		    processData: false,
		    contentType: false,
		    type: 'POST',
       		success: function(data){
       				var form2=$("#form2");
       				$(form2).append('<div class="alert alert-warning">Se han encontrado videos sin url, por favor introdusca las urls para poder continuar');
       				//$(form2).append( '<div class="row"><div class="col-sm-2" style="background-color:lavender;">Página</div><div class="col-sm-2" style="background-color:lavenderblush;">Nombre</div><div class="col-sm-2" style="background-color:lavender;">Url</div></div>');
       				$.each(data, function(i, item) {
    					console.log(item);
    					if(item.urlVideo==null){
    					$(form2).append('<input type="hidden" name="id" value="'+indiceVideo+'">');
    					 $(form2).append(
    					 '<fieldset><div class="form-group"><label>Pagina:</label><input type="text" id="pagina'+indiceVideo+'" name="pagina'+indiceVideo+'" value='+item.page+' size="2"></div></fieldset><fieldset><div class="form-group"><label>Nombre del video:</label><input type="text" id="namevideo'+indiceVideo+'"  name="nameVideo'+indiceVideo+'" value='+item.nameVideo+' ></div></fieldset><div class="form-group"><label>url del video:</label><input type="text" id="url'+indiceVideo+'" name="url'+indiceVideo+'" required autofocus></div> ');
    					
    					}
    					indiceVideo+=1;
    				});
    				$(form2).append('<div><input type="button" id="Enviar" class="btn btn-info" onclick="guardarUrl();"value="Enviar"></div></div>');
    				
				}
				,
                error: function (data, status, er) {
                    alert("error: " + data + " status: " + status + " er:" + er);
                }
				});
       				
     
    },
    success: function(data){
    alert(("#form2").serialize());
     alert(data);
      
    }
  });
  });
</script>
</div>
<!-- Default bootstrap modal example -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
         <div class="loading-area">
    <img class="loading-image" src="/image/gif1.gif">
    <p class="loading-text">Loading ...</p>
  </div>  
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>