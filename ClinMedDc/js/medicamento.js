var tabla, data;

//Funcion para cargar la tabla
function addRowDT(data) {
    tbl_medicamentos
    tabla = $("#tbl_medicamentos").DataTable({
        "oLanguage": {
            "oPaginate": {
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
        },
        "aaSorting": [[0, 'desc']],
        "bSort": true,
        "bDestroy": true,
        "aoColumns": [
            null,
            null,
            null,
            null,
            null,
            null,
            null,
           
            { "bSortable": false }
        ]
    });

    //Funcion para convertir la fecha
    function convertToJavaScriptDate(value) {
        var pattern = /Date\(([^)]+)\)/;
        var results = pattern.exec(value);
        var dt = new Date(parseFloat(results[1]));
        //return (dt.getMonth() + 1) + "/" + dt.getDate() + "/" + dt.getFullYear();
        return (dt.getDate()) + "/" + (dt.getMonth() + 1) + "/" + dt.getFullYear();
        //return (dt.getFullYear()) + "/" + (dt.getMonth() + 1) + "/" + dt.getDate();
    }


        tabla.fnClearTable();

    for (var i = 0; i < data.length; i++) {

        tabla.fnAddData([
            data[i].IdMedicamento,
            data[i].Laboratorio.NombreLaboratorio,
            data[i].NombreMedicamento,
            data[i].FechaVencimiento = convertToJavaScriptDate(data[i].FechaVencimiento),
            data[i].FechaEntrada = convertToJavaScriptDate(data[i].FechaEntrada),
            data[i].Cantidad,
            data[i].Precio,
            '<button type="button" value="Actualizar" title="Actualizar" class="btn btn-primary btn-edit" data-target="#imodal" data-toggle="modal"><i class="fa fa-check-square-o" aria-hidden="true"></i></button>&nbsp;' +
            '<button type="button" value="Eliminar" title="Eliminar" class="btn btn-danger btn-delete"><i class="fa fa-minus-square-o" aria-hidden="true"></i></button>'
        ]);
    }



}

//Funcion para Listar mediante AJAX
function sendDataAjax() {
    $.ajax({
        type: "POST",
        url: "GestionarMedicamentos.aspx/ListarMedicamentos",
        data: {},
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            addRowDT(data.d);
        }
    });
}


//Funcion para actualizar mediante AJAX
function updateDataAjax() {

    var obj = JSON.stringify({
        id: JSON.stringify(data[0]),
        nombreMedicamento: $("#txtName").val(),
        //FechaVencimiento: $("#txtVencimientoModal").val(),
        //FechaEntrada: $("#txtEntradaModal").val(),
        Cantidad: $("#txtCantidadModal").val(),
        Precio: $("#txtPrecioModal").val()

    });

    $.ajax({
        type: "POST",
        url: "GestionarMedicamentos.aspx/ActualizarDatosMedicamento",
        data: obj,
        dataType: "json",
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (response) {
            if (response.d) {
                $("#imodal").modal('toggle');
                alert("Registro actualizado de manera correcta.");
            } else {
                alert("No se pudo actualizar el registro.");
            }
        }
    });
}


//Funcion para Eliminar mediante AJAX
function deleteDataAjax(data) {
    var obj = JSON.stringify({
        id: JSON.stringify(data)
    });
    $.ajax({
        type: "POST",
        url: "GestionarMedicamentos.aspx/EliminarDatosMedicamento",
        data: obj,
        dataType: "json",
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (response) {
            if (response.d) {
                alert("Registro eliminado de manera correcta.");
            } else {
                alert("No se pudo eliminar el registro.");
            }

        }
    });
}


// evento click para boton actualizar
$(document).on('click', '.btn-edit', function (e) {
    e.preventDefault();
    var row = $(this).parent().parent()[0];
    data = tabla.fnGetData(row);
    fillModalData();
});


// evento click para boton eliminar
$(document).on('click', '.btn-delete', function (e) {
    e.preventDefault();
    var rpta = confirm("¿Seguro que quieres eliminar el registro?");
    if (rpta == true) {
        e.preventDefault();
        var row = $(this).parent().parent()[0];
        var dataRow = tabla.fnGetData(row);
        deleteDataAjax(dataRow[0]);
        // paso 2: renderizar el datatable
        sendDataAjax();
    }
});


//evento click para el boton Cancelar
$("#btnCancelar").click(function (e) {
    e.preventDefault();
    Limpiar();
});


//Funcion Limpiar Campos
function Limpiar() {
    $("#txtNombreMedicamento").val("");
    $("#txtVencimiento").val("");
    $("#txtEntrada").val("");
    $("#txtCantidad").val("");
    $("#txtPrecio").val("");
    $("#ddlLaboratorio")[0].selectedIndex = 0;
}


// cargar datos en el modal
function fillModalData() {
    $("#txtName").val(data[2]);
    //$("#txtVencimientoModal").val(data[3]);
    //$("#txtEntradaModal").val(data[4]);
    $("#txtCantidadModal").val(data[5]);
    $("#txtPrecioModal").val(data[6]);
}


// enviar la informacion al servidor
$("#btnactualizar").click(function (e) {
    e.preventDefault();
    updateDataAjax();
    sendDataAjax();
});
sendDataAjax();