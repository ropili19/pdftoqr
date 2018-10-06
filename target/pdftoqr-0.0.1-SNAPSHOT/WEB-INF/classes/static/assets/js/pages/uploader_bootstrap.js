/* ------------------------------------------------------------------------------
*
*  # Bootstrap multiple file uploader
*
*  Specific JS code additions for uploader_bootstrap.html page
*
*  Version: 1.1
*  Latest update: Dec 11, 2015
*
* ---------------------------------------------------------------------------- */

$(function() {

    // Basic example
    $('.file-input').fileinput({
        browseLabel: 'Seleccionar archivos',
        browseIcon: '<i class="icon-file-plus"></i>',
        uploadIcon: '<i class="icon-file-upload2"></i>',
        removeIcon: '<i class="icon-cross3"></i>',
        layoutTemplates: {
            icon: '<i class="icon-file-check"></i>'
        },
        initialCaption: "Selecciona un archivo"
    });


    // Custom layout
    $('.file-input-custom').fileinput({
        previewFileType: 'image',
        browseLabel: 'Seleccionar',
        browseClass: 'btn bg-slate-700',
        browseIcon: '<i class="icon-image2 position-left"></i> ',
        removeLabel: 'Eliminar',
        removeClass: 'btn btn-danger',
        removeIcon: '<i class="icon-cancel-square position-left"></i> ',
        uploadClass: 'btn bg-teal-400',
        uploadIcon: '<i class="icon-file-upload position-left"></i> ',
        layoutTemplates: {
            icon: '<i class="icon-file-check"></i>'
        },
        initialCaption: "Por favor, selecciona una imagen",
        mainClass: 'input-group'
    });


    // Template modifications
    $('.file-input-advanced').fileinput({
        browseLabel: 'Seleccionar archivos',
        browseClass: 'btn btn-default',
        removeClass: 'btn btn-default',
        uploadClass: 'btn bg-success-400',
        browseIcon: '<i class="icon-file-plus"></i>',
        uploadIcon: '<i class="icon-file-upload2"></i>',
        removeIcon: '<i class="icon-cross3"></i>',
        layoutTemplates: {
            icon: '<i class="icon-file-check"></i>',
            main1: "{preview}\n" +
            "<div class='input-group {class}'>\n" +
            "   <div class='input-group-btn'>\n" +
            "       {browse}\n" +
            "   </div>\n" +
            "   {caption}\n" +
            "   <div class='input-group-btn'>\n" +
            "       {upload}\n" +
            "       {remove}\n" +
            "   </div>\n" +
            "</div>"
        },
        initialCaption: "Selecciona un archivo"
    });


    // Custom file extensions
    $(".file-input-extensions").fileinput({
        browseLabel: 'Seleccionar archivos',
        browseClass: 'btn btn-primary',
        uploadClass: 'btn btn-default',
        browseIcon: '<i class="icon-file-plus"></i>',
        uploadIcon: '<i class="icon-file-upload2"></i>',
        removeIcon: '<i class="icon-cross3"></i>',
        layoutTemplates: {
            icon: '<i class="icon-file-check"></i>'
        },
        maxFilesNum: 10,
        allowedFileExtensions: ["jpg", "gif", "png", "txt"]
    });


    // Always display preview
    $(".file-input-preview").fileinput({
        browseLabel: 'Seleccionar archivos',
        browseIcon: '<i class="icon-file-plus"></i>',
        uploadIcon: '<i class="icon-file-upload2"></i>',
        removeIcon: '<i class="icon-cross3"></i>',
        layoutTemplates: {
            icon: '<i class="icon-file-check"></i>'
        },
        initialPreview: [
            "<img src='" + exampleImages + "placeholder.jpg' class='file-preview-image' alt=''>",   // Defined before "<div class="container">" in html file
            "<img src='" + exampleImages + "placeholder.jpg' class='file-preview-image' alt=''>",   // Defined before "<div class="container">" in html file
        ],
        overwriteInitial: false,
        maxFileSize: 100
    });


    // Display preview on load
    $(".file-input-overwrite").fileinput({
        browseLabel: 'Seleccionar archivos',
        browseIcon: '<i class="icon-file-plus"></i>',
        uploadIcon: '<i class="icon-file-upload2"></i>',
        removeIcon: '<i class="icon-cross3"></i>',
        initialPreview: [
            "<img src='" + exampleImages + "placeholder.jpg' class='file-preview-image' alt=''>",   // Defined before "<div class="container">" in html file
            "<img src='" + exampleImages + "placeholder.jpg' class='file-preview-image' alt=''>",   // Defined before "<div class="container">" in html file
        ],
        overwriteInitial: true
    });


    // Disable/enable button
    $("#file-input-methods").fileinput("disable");
    $("#btn-modify").on("click", function() {
        $btn = $(this);
        if ($btn.text() == "Deshabilitar la subida") {
            $("#file-input-methods").fileinput("disable");
            $btn.html("Habilitar la subida");
            alert("¡Ey! has deshabilitado la subida y protegido el botón.");
        } else {
            $("#file-input-methods").fileinput("enable");
            $btn.html("Deshabilitar la subida");
            alert("¡Ey! has habilitado la subida y ahora puedes usar el botón.");
        }
    });


    // AJAX upload
    $(".file-input-ajax").fileinput({
        uploadUrl: uploadUrl, // server upload action + // Defined before "<div class="container">" in html file
        uploadAsync: true,
        maxFileCount: 5,
        initialPreview: [],
        fileActionSettings: {
            removeIcon: '<i class="icon-bin"></i>',
            removeClass: 'btn btn-link btn-xs btn-icon',
            uploadIcon: '<i class="icon-upload"></i>',
            uploadClass: 'btn btn-link btn-xs btn-icon',
            indicatorNew: '<i class="icon-file-plus text-slate"></i>',
            indicatorSuccess: '<i class="icon-checkmark3 file-icon-large text-success"></i>',
            indicatorError: '<i class="icon-cross2 text-danger"></i>',
            indicatorLoading: '<i class="icon-spinner2 spinner text-muted"></i>',
        }
    });

});
