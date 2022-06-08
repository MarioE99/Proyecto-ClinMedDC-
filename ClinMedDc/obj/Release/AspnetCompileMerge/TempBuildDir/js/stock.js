var tabla, data;

//Funcion para cargar la tabla
function addRowDT(data) {
    tabla = $("#tbl_stock").DataTable({
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

        const formatToCurrency = amount => {
        return "$" + amount.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, "$&,");
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
            data[i].Precio = formatToCurrency(data[i].Precio),
        ]);
    }
}


//Funcion para Listar Stock mediante AJAX
function sendDataAjax() {
    $.ajax({
        type: "POST",
        url: "GestionarStock.aspx/ListarMedicamentosStock",
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

sendDataAjax();