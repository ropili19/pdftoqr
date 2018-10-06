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
					<!-- Pills -->
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="no-margin">PdfToQr</h5>
								<div class="heading-elements panel-pills">
									<ul class="nav nav-pills">
										<li class="active"><a href="#panel-pill1" data-toggle="tab"><i class="icon-screen-full position-left"></i> Principal</a></li>
										<li><a href="#panel-pill2" data-toggle="tab"><i class="icon-help position-left"></i> Ayuda</a></li>
										<li><a href="#panel-pill3" tabindex="-1" data-toggle="tab"><i class="icon-info3"></i> Acerca de </a></li>
										
									</ul>
			                	</div>
							</div>
							
							<div class="panel-tab-content tab-content">
								<div class="tab-pane active has-padding" id="panel-pill1">
									<div class="panel-body">
						<p class="text-muted">Por favor suba un fichero <code>PDF</code> para que sea procesado incorporando un c&oacute;digo QR por cada video Multimedia. </p><br>

						<form class="form-horizontal" id="form1" name="form1" action="/getMultimedias" method="POST" enctype="multipart/form-data">
							<div class="form-group">
								<label class="col-lg-2 control-label text-semibold">Subir fichero:</label>
								<div class="col-lg-10">
									<input type="file" class="file-input" id="file" name="file" accept="aplication/pdf">
									<span class="help-block">Al finalizar el proceso el documento <code>No ser&aacute; almacenado en el servidor </code>.</span>
								</div>
							</div>

						

							
						</form>

					</div>
								</div>

								<div class="tab-pane has-padding" id="panel-pill2">
									<div class="panel-body">
									<p class="text-muted">
										A continuaci&oacute;n le mostramos un video en el cu&aacute;l puede observar como realizar la conversi&oacute;n de su <code>fichero PDF multimedia a PDF con codigo QR.</code>
										<div class="col-xs-12">
    									<div class="center-block">
    										

											<iframe width="560" height="315" src="https://www.youtube.com/embed/sCcm5iFHrJc" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
										</div></div>
										</div>
								</div>

								<div class="tab-pane has-padding" id="panel-pill3">
								<div class="panel-body">
									
									<div class="col-xs-12">
    									<div class="center-block">
    									<p class="text-muted"><h2><code>PDFtoQR</code> como herramienta de conversi&oacute;n de videos de PDF a PDF con codigos QR  </h2>
    									Es una aplicaci&oacute;n web cuya funci&oacute;n es la de transformar un pdf con contenido multimedia en un PDF con codigos QR que reemplazan los elementos multimedia para que asi al
    									 ser impresos no se pierda accesibilidad a ellos.<br>
    									 Esta aplicaci&oacute;n se desarrollo como objetivo en el Trabajo de Fin de Grado del <code> Grado en Ingenier&iacute;a Inform&aacute;tica de la Universidad Rey Juan Carlos</code> siendo el tutor y creador de la idea el profesor <b>Jaime Urquiza</b> </p>
    									 <br>
    									 
    									</div>
    								</div>
								</div>
								</div>

								
							</div>
						</div>
				<!-- Bootstrap file input -->
<!-- 				<div class="panel panel-flat">
					<div class="panel-heading">
						<h3 class="panel-title">Bienvenid@ </h3>
						<div class="heading-elements">
							<ul class="icons-list">
								<li><a data-action="collapse"></a></li>
								<li><a data-action="reload"></a></li>
								<li><a data-action="sendMessage" ><span class="icon-info3">Acerca de</span></a></li>
								<li><a data-action="help"><span class="icon-help"></span></a></li>
							</ul>
						</div>
					</div>

					
				</div> -->
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
	var bandera=true;
	var urls=$("[id*=url]");
	$(urls).each(function(){
	     var url=$(this);
	     if(url.val()==""){
	    	
	    	 bandera=false;
	     }
	});
	return bandera;
}


function guardarUrl(){

	if(compruebaUrl()==true){//lanzo ajax 
	 	//var info=JSON.stringify($("#form2").serializeArray())
		var fichero=file.files[0];
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
                	var namefile=data.fileName;
                	
 					$('#modal_iconified').modal('hide');
 					 swal({
 			             title: "Fichero Procesado correctamente!",
 			             text: "Pulsa en el boton para descargar el fichero PDF transformado a PDF con codigos QR.",
 			             confirmButtonColor: "#66BB6A",
 			             confirmButtonText: 'Descargar',
 			             html: true,
 			             type: "success"
 					 },function(isConfirm){
	 			            if (isConfirm) {
	 			            	
	 			            	 var req = new XMLHttpRequest();
	 			            	  req.open("GET", "/downloadFile/"+namefile, true);
	 			            	  req.responseType = "blob";

	 			            	  req.onload = function (event) {
	 			            	    var blob = req.response;
	 			            	    console.log(blob.size);
	 			            	    var link=document.createElement('a');
	 			            	    link.href=window.URL.createObjectURL(blob);
	 			            	    link.download="/downloadFile/"+namefile;
	 			            	    link.click();
	 			            	    $(".fileinput-remove").click();
	 			            	  };

	 			            	  req.send();

	 			            	}
		                });
 			 
                },
                 error: function (data, status, er) {
                	  swal({
                          title: "PdfToQr",
                          text: "Se ha producido un error durante el proceso, por favor vuelva a intentarlo o contacte con el administrador para mas información",
                          confirmButtonColor: "#EF5350",
                          type: "error"
                      });
                }
	});
		 
	}else{
		swal({
            title: "Oops...",
            text: "Por favor introduzca las url's para poder continuar o cancele el proceso sino quiere continuar con la conversion del documento!",
            confirmButtonColor: "#EF5350",
            type: "error"
        });
	}
	return false;
	
}
$(document).ready(function() {
	$(".sa-confirm-button-container").click(function(){
		
	});
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
	  oMyForm.append("info","");
	  fich=oMyForm;
	 var indiceVideo=1;
	 
		    $.ajax({
			    url: 'http://localhost:8444/getMultimedias',
			    data: oMyForm,
			    dataType: 'json',
			    processData: false,
			    contentType: false,
			    type: 'POST',
	       		success: function(data){
					if(data.length==0){

					        swal({
					            title: "<small><b><span style='color:#C70039'>PDFToQR</span></b></small></div>",
					            text: "El documento PDF recibido <span style='color:#F8BB86'>No contiene videos</span> y por ello no se puede realizar la conversi&oacute;n a QR",
					            html: true,
					            confirmButtonColor: "#2196F3"
					        	})
	       				
	       			}
					else{
	       				
	       			
	       			
	       				
			       				$('#form2').empty();
			       				var form2=$("#form2");
			       				$.each(data, function(i, item) {
			    					
			    					if(item.urlVideo==null){
				    					$(form2).append('<hr><input type="hidden" name="id_'+indiceVideo+'" value="'+item.id+'">');
				    					$(form2).append('<input type="hidden" name="name_'+indiceVideo+'" value="'+item.nameVideo+'">');
				    					$(form2).append('<input type="hidden" name="page_'+indiceVideo+'" value="'+item.page+'">');
				    					 $(form2).append(
				    					'<div class="row">'+ 
				    					'<div class="text-left col-xs-2 col-md-2 "> Pagina:</div><div class="col-xs-2 col-md-2 text-left">'+item.page+'<br></div> '+
				    					'<div class="col-xs-4 col-md-3 text-left "> Nombre del video:</div><div class="col-xs-4 col-md-5 text-lefth">'+item.nameVideo+'</div></div>'+
				    					'<div class="row">'+
				    					'<div class="col-xs-4 col-md-4 text-left "><span class="icon-play position-left"></span> url del video</div><div class="col-xs-8 col-md-8" > <input type="url" style="width:90%" class="form-control input-sm" id="url'+indiceVideo+'" name="url'+indiceVideo+'" required autofocus></div></div>');
			    					}
			    					indiceVideo+=1;
			    				});
					    		if($('#form2').children('input').length>0){
					    			$('#modal_iconified').modal('show');
					    		}else{
					    			var oMyForm = new FormData();
					    			  oMyForm.append("file", file.files[0]);
					    			  oMyForm.append("info","");
					    			 			$.ajax({
					    			                type: "POST",
					    			                url:   "http://localhost:8444/procesa",
					    			                data: oMyForm,
					    			                contentType: false,
					    			                processData: false,
					    			                cache: false,
					    			                success: function (data)
					    			                {
					    			                	var namefile=data.fileName;
					    			                	
					    			 					$('#modal_iconified').modal('hide');
					    			 					 swal({
					    			 			             title: "Fichero Procesado correctamente!",
					    			 			             text: "Pulsa en el boton para descargar",
					    			 			             confirmButtonColor: "#66BB6A",
					    			 			             confirmButtonText: 'Descargar',
					    			 			             html: true,
					    			 			             type: "success"
					    			 					 	},function(isConfirm){
					    				 			            if (isConfirm) {
					    				 			            	
					    				 			            	 var req = new XMLHttpRequest();
					    				 			            	  req.open("GET", "/downloadFile/"+namefile, true);
					    				 			            	  req.responseType = "blob";
		
					    				 			            	  req.onload = function (event) {
					    				 			            	    var blob = req.response;
					    				 			            	    console.log(blob.size);
					    				 			            	    var link=document.createElement('a');
					    				 			            	    link.href=window.URL.createObjectURL(blob);
					    				 			            	    link.download="/downloadFile/"+namefile;
					    				 			            	    link.click();
					    				 			            	    $(".fileinput-remove").click();
					    				 			            	  };
		
					    				 			            	  req.send();
		
					    				 			            	}
					    					                });
					    			 			 
						    			                },
						    			                 error: function (data, status, er) {
						    			                	  swal({
						    			                          title: "PdfToQr",
						    			                          text: "Se ha producido un error durante el proceso, por favor vuelva a intentarlo o contacte con el administrador para mas información",
						    			                          confirmButtonColor: "#EF5350",
						    			                          type: "error"
						    			                  		});
			    			            				}//fin error
					    			 			});
					    		 	}//fin else
					    		}//otro else
	    			
					
			    },
	            error: function (data, status, er) {
	                	   swal({
	                           title: "PdfToQr",
	                           text: "Se ha producido un error durante el proceso, por favor vuelva a intentarlo o contacte con el administrador para mas información",
	                           confirmButtonColor: "#EF5350",
	                           type: "error"
	                       });
	 
				
	       				
	            }//error
	}); //ajax 
});//submit
</script>
</html>