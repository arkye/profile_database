$(document).ready(function() {$('#competencies-table').DataTable(
{
language : {
"sEmptyTable" : "Nenhuma compet�ncia encontrada",
"sInfo" : "Mostrando de _START_ at� _END_ de _TOTAL_ compet�ncias",
"sInfoEmpty" : "",
"sInfoFiltered" : "(Filtrados de _MAX_ compet�ncias)",
"sInfoPostFix" : "",
"sInfoThousands" : ".",
"sLengthMenu" : "_MENU_ compet�ncias por p�gina",
"sLoadingRecords" : "Carregando...",
"sProcessing" : "Processando...",
"sZeroRecords" : "Nenhuma compet�ncia encontrada",
"sSearch" : "Pesquisar ",
"oPaginate" : {
"sNext" : "Pr�ximo",
"sPrevious" : "Anterior",
"sFirst" : "Primeiro",
"sLast" : "�ltimo"
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