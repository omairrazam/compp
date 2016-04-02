$( document ).ready(function() {

    var table = $('#cart').DataTable();

    var oTable = $('#cart').dataTable({

    });

    $('#cart tbody').on( 'click', 'button.delete_icon', function () {
        table
            .row( $(this).parents('tr') )
            .remove()
            .draw();
    });

    $('#cart tbody').on( 'click', 'input.item_qty', function (){

        var row = table.row( $(this).parents('tr') );
        var qtyCell = table.cell({ row: table.row( row ).index(), column: 2 }).node();
        var priceCell = table.cell({ row: table.row( row ).index(), column: 3 }).node();
        var subTotCell = table.cell({ row: table.row( row ).index(), column: 4 }).node();
        var qty = $('input', qtyCell).val();
        var price = priceCell.innerHTML;
        var subTot = qty * price;
        //alert(price);
        oTable.fnUpdate( subTot, table.row( row ).index(), 4 );
        var netPrice = table.column( 4 ).data().sum();
        $('#totAmount').html('<strong>Total:Rs'+netPrice+'</strong>');

    });



/*
$('#cart tbody').on('click', 'tr', function () {
//var cell = table.cell({ row: table.row( this ).index(), column: 2 }).node();
//var cell2 = table.cell({ row: table.row( this ).index(), column: 1 }).node();
//alert(cell2.innerHTML);
//cell2.innerHTML = $('input', cell).val();
//alert('clicked');
var qtyCell = table.cell({ row: table.row( this ).index(), column: 2 }).node();
var priceCell = table.cell({ row: table.row( this ).index(), column: 3 }).node();
var subTotCell = table.cell({ row: table.row( this ).index(), column: 4 }).node();
var qty = $('input', qtyCell).val();
var price = priceCell.innerHTML
var subTot = qty * price;
//subTotCell.innerHTML = subTot;


    oTable.fnUpdate( subTot, table.row( this ).index(), 4 );
    var netPrice = table.column( 4 ).data().sum();
    //alert (netPrice);

    $('#totAmount').html('<strong>Total:Rs'+netPrice+'</strong>');


} );

 function deleteRow(row){
     oTable.fnDeleteRow( row );
 }*/
});