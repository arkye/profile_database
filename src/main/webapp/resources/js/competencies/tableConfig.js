$(document).ready(function() {$('#competencies-table').DataTable(
{
language : {
"sEmptyTable" : "Nenhuma competência encontrada",
"sInfo" : "Mostrando de _START_ até _END_ de _TOTAL_ competências",
"sInfoEmpty" : "",
"sInfoFiltered" : "(Filtrados de _MAX_ competências)",
"sInfoPostFix" : "",
"sInfoThousands" : ".",
"sLengthMenu" : "_MENU_ competências por página",
"sLoadingRecords" : "Carregando...",
"sProcessing" : "Processando...",
"sZeroRecords" : "Nenhuma competência encontrada",
"sSearch" : "Pesquisar ",
"oPaginate" : {
"sNext" : "Próximo",
"sPrevious" : "Anterior",
"sFirst" : "Primeiro",
"sLast" : "Último"
},
"oAria" : {
"sSortAscending" : ": Ordenar colunas de forma crescente",
"sSortDescending" : ": Ordenar colunas de forma decrescente"
}
},
columnDefs : [ {
"orderable" : false,
"targets" : [ 4, 5 ]
} ]
});
});