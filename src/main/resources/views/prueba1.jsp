<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>PDF to QR</title>
   
	<!-- font Lato -->
	<link href='http://fonts.googleapis.com/css?family=Lato:400,300,100,500,700,900' rel='stylesheet' type='text/css'>
	<!-- Header stylesheets -->
	<link href="../assets/css/icons/icomoon/styles.css" rel="stylesheet" type="text/css">
	<link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="../assets/css/core.min.css" rel="stylesheet" type="text/css">
	<link href="../assets/css/icons/fontawesome/styles.min.css" rel="stylesheet" type="text/css">
	<link href="../assets/css/cr.css" rel="stylesheet" type="text/css">
	<link href="../assets/css/cr_core.css" rel="stylesheet" type="text/css">
	<link href="../assets/css/components.css" rel="stylesheet" type="text/css">
	<link href="../assets/css/colors.css" rel="stylesheet" type="text/css">
	<link href="../assets/css/cr_colors.css" rel="stylesheet" type="text/css">
	<link href="../assets/css/cr_button.css" rel="stylesheet" type="text/css">
	<link href="../assets/css/cr_alert.css" rel="stylesheet" type="text/css">
	<link href="../assets/css/micss.css" rel="stylesheet" type="text/css">

	<!-- /Header stylesheets -->
	<!-- Header JS files -->
    	<script type="text/javascript" src="../assets/js/core/libraries/jquery.min.js"></script>
    	<script type="text/javascript" src="../assets/js/core/libraries/bootstrap.min.js"></script>
    	<script type="text/javascript" src="../assets/js/core/cr.js"></script>
    	<script type="text/javascript" src="../assets/js/plugins/loaders/pace.min.js"></script>
    	<script type="text/javascript" src="../assets/js/plugins/loaders/blockui.min.js"></script>
    	<script type="text/javascript" src="../assets/js/plugins/ui/nicescroll.min.js"></script>
    	<script type="text/javascript" src="../assets/js/plugins/ui/drilldown.js"></script>
    	<script type="text/javascript" src="../assets/js/core/cr_fileinput.min.js"></script>
    	<script type="text/javascript" src="../assets/js/core/app.js"></script>
    	<script type="text/javascript" src="../assets/js/pages/uploader_bootstrap.js"></script>
    		<!-- Header JS files -->
    		
    	<script type="text/javascript" src="../assets/js/core/cr.js"></script><script type="text/javascript" src="../assets/js/plugins/loaders/pace.min.js"></script><script type="text/javascript" src="../assets/js/plugins/loaders/blockui.min.js"></script><script type="text/javascript" src="../assets/js/plugins/ui/nicescroll.min.js"></script><script type="text/javascript" src="../assets/js/plugins/ui/drilldown.js"></script><script type="text/javascript" src="../assets/js/plugins/visualization/d3/d3.min.js"></script><script type="text/javascript" src="../assets/js/plugins/visualization/d3/d3_tooltip.js"></script><script type="text/javascript" src="../assets/js/plugins/forms/styling/switchery.min.js"></script><script type="text/javascript" src="../assets/js/plugins/forms/styling/uniform.min.js"></script><script type="text/javascript" src="../assets/js/plugins/forms/selects/bootstrap_multiselect.js"></script><script type="text/javascript" src="../assets/js/plugins/ui/moment/moment.min.js"></script><script type="text/javascript" src="../assets/js/plugins/pickers/daterangepicker.js"></script><script type="text/javascript" src="../assets/js/plugins/notifications/bootbox.min.js"></script><script type="text/javascript" src="../assets/js/plugins/notifications/sweet_alert.min.js"></script><script type="text/javascript" src="../assets/js/core/app.js"></script><script type="text/javascript" src="../assets/js/pages/components_modals.js"></script>
	<!-- Header JS files -->
	<!-- Header JS files -->
</head>

<body onload="active_menu_item('extensiones', 'subir_archivos')">
	<!-- Content Style files -->
   
	<!-- /second navbar -->
<script type="text/javascript">
	var exampleImages = '../assets/images/';
	var uploadUrl = '/getMultimedias';
</script>

<div class="container">
<div class="navbar navbar-inverse">
		<!-- container Main Navbar-->
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand logo_desktop" href="../prueba"><img src="../assets/img/gif1.gif" alt=""></a>
				<!-- logo para version movil -->
				<a class="navbar-brand logo_mobile" href="../prueba"><img src="../assets/img/gif1.gif" alt=""></a>
				<span class="title_mobile">PDF to QR </span>
				
			</div>
	
			<div class="navbar-collapse collapse" id="navbar-mobile">
				<div class="row">
				    <div class="navbar-text">PDF to QR</div>

				</div>
			</div>
		</div>
		<!-- / container Main Navbar-->
	</div>

	<!-- Page container -->
	<div class="page-container">

		<!-- Page content -->
		<div class="page-content">

			<!-- Main content -->
			<div class="content-wrapper">

				<!-- Bootstrap file input -->
				<div class="panel panel-flat">
					<div class="panel-heading">
						<h3 class="panel-title">Bienvenid@ </h3>
						<div class="heading-elements">
							<ul class="icons-list">
								<li><a data-action="collapse"></a></li>
								<li><a data-action="reload"></a></li>
								<!-- <li><a data-action="close"></a></li> -->
							</ul>
						</div>
					</div>

					<div class="panel-body">
						<p class="text-muted">Por favor suba un fichero <code>PDF</code> para que sea procesado incorporando un c&oacute;digo QR por cada video Multimedia. </p><br>

						<form class="form-horizontal" id="form1" name="form1" action="/getMultimedias" method="POST" enctype="multipart/form-data">
							<div class="form-group">
								<label class="col-lg-2 control-label text-semibold">Subir fichero:</label>
								<div class="col-lg-10">
									<input type="file" class="file-input" id="file" name="file" accept="aplication/pdf">
									<span class="help-block">Al finalizar el proceso el nuevo fichero PDF solo estar&aacute; accesible durante las pr&oacute;ximas <code>3 horas</code>.</span>
								</div>
							</div>

						

							
						</form>
									<div class="alert alert-danger alert-styled-left alert-bordered" id="errorsinmultimedia" style="display:none;">
			<button type="button" class="close" data-dismiss="alert"><span>x</span><span class="sr-only">close</span></button>
			<span class="text-semibold">El documento recibido no contiene elementos multimedia</span>
			</div>
					</div>
				</div>
				<!-- /bootstrap file input -->

			</div>
			<!-- /main content -->

		</div>
		<!-- /page content -->

	</div>

</div>	
	<footer>
		<div class="text-center">
			&copy;Realizado por Rosario del Pilar Orbezo Pastrana.
		</div>
	</footer>
	
	

  <!-- Modal -->
  <div class="modal fade"   id="myModal" role="dialog">
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
     
          </div>
        </div>
        <div class="modal-footer" id="footerM">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
  </div>
  
  
  <!-- Iconified modal -->
 <div id="modal_iconified" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h5 class="modal-title"><i class="icon-menu7"></i> &nbsp;PDF to QR</h5>
            </div>

            <div class="modal-body">
                <div class="alert alert-danger alert-styled-left text-blue-800 content-group">
                    <span class="text-semibold">Importante!</span> El proceso no puede continuar debido a que los siguientes videos no tienen Url.
                    <button type="button" class="close" data-dismiss="alert">×</button>
                </div>

                <h6 class="text-semibold"><i class="icon-law position-left"></i> Por favor, introduzca las Url's para poder continuar</h6>
               
                  <form id="form2" class="form-inline" action="">
          
          		</form>
                <hr>

               
            </div>

            <div class="modal-footer">
                <button class="btn btn-link" data-dismiss="modal"><i class="icon-cross"></i> Cancelar</button>
                <button class="btn btn-primary" onclick="guardarUrl();"><i class="icon-check"></i> Continuar</button>
            </div>
        </div>
    </div>
</div>
  
  

</body>
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
	 	//var info=JSON.stringify($("#form2").serializeArray())

      	 var form = new FormData();
            form.append('file',file.files[0]);
            form.append('info', JSON.stringify($("#form2").serializeArray()));
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
                     
 					$('#modal_iconified').modal('hide');
                   alert(data);
 
                },
                 error: function (data, status, er) {
                    alert("error: " + data + " status: " + status + " er:" + er);
                }
	});
	}
	return false;
	
}
$(document).ready(function() {

	$( ".fileinput-remove" ).click(function() {
		
		});
	
	 
	
$("#errorsinmultimedia").css("display", "none");
//prepare SweetAlert configuration

});
$(".fileinput-remove").click(function(){
	$("#errorsinmultimedia").css("display", "none");	
});
$("#form1").on("submit", function(e){
	   //Code: Action (like ajax...)
	   e.preventDefault();
	 
	  var oMyForm = new FormData();
	  oMyForm.append("file", file.files[0]);
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
	       			if(data.length==0){
	       				$("#errorsinmultimedia").css("display", "block");
	       				
	       			}else{
	       				
	       				$('#modal_iconified').modal('show');
	       			}
	       				var form2=$("#form2");
	       				//$(form2).append('<div class="panel panel-flat bo">Se han encontrado videos sin url, por favor introdusca las urls para poder continuar');
	       				//$(form2).append( '<div class="row"><div class="col-sm-2" style="background-color:lavender;">Página</div><div class="col-sm-2" style="background-color:lavenderblush;">Nombre</div><div class="col-sm-2" style="background-color:lavender;">Url</div></div>');
	       				$.each(data, function(i, item) {
	    					console.log(item);
	    					if(item.urlVideo==null){
	    					$(form2).append('<hr><input type="hidden" name="id_'+indiceVideo+'" value="'+item.id+'">');
	    					$(form2).append('<input type="hidden" name="name_'+indiceVideo+'" value="'+item.nameVideo+'">');
	    					$(form2).append('<input type="hidden" name="page_'+indiceVideo+'" value="'+item.page+'">');
	    					 $(form2).append(
	    					 //'<div class="form-group"><label>Pagina:</label><input type="hidden" id="pagina'+indiceVideo+'" name="pagina'+indiceVideo+'" value='+item.page+' size="2"></div></fieldset><fieldset><div class="form-group"><label>Nombre del video:</label><input type="hidden" id="namevideo'+indiceVideo+'"  name="nameVideo'+indiceVideo+'" value='+item.nameVideo+' ></div></fieldset><div class="form-group"><label>url del video:</label><input type="url" class="form-control input-xs" id="url'+indiceVideo+'" name="url'+indiceVideo+'" required autofocus></div> </div');
	    					'<label> Pagina:'+item.page+'</label><br> '+
	    					'<label> Nombre del video:'+item.nameVideo+' </label></br>'+
	    					'<div class="form-group "><label ><span class="icon-play position-left"></span> url del video: <input type="url" class="form-control" id="url'+indiceVideo+'" name="url'+indiceVideo+'" required autofocus></label></div>');
	    					}
	    					indiceVideo+=1;
	    				});
	    				//$(form2).append('<div><input type="button" id="Enviar" class="btn btn-info" onclick="guardarUrl();"value="Enviar"></div></div>');
	    				
					}
					,
	                error: function (data, status, er) {
	                	$("#errorsinmultimedia").css("display", "block");
	                    //alert("error: " + data + " status: " + status + " er:" + er);
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
</html>