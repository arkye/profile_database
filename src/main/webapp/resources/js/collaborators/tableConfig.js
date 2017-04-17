$(document).ready(function() {$('#collaborators-table').DataTable(
{
language : {
"sEmptyTable" : "Nenhum colaborador encontrado",
"sInfo" : "Mostrando de _START_ até _END_ de _TOTAL_ colaboradores",
"sInfoEmpty" : "",
"sInfoFiltered" : "(Filtrados de _MAX_ colaboradores)",
"sInfoPostFix" : "",
"sInfoThousands" : ".",
"sLengthMenu" : "_MENU_ colaboradores por página",
"sLoadingRecords" : "Carregando...",
"sProcessing" : "Processando...",
"sZeroRecords" : "Nenhum colaborador encontrado",
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
"targets" : [ 3, 4, 5 ]
} ]
});
});