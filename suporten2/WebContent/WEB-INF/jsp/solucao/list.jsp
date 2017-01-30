<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dataTable/js/ledataTable.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dataTable/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dataTable/css/jquery.dataTables.min.css">
<div class="page-header">
    <h2>Listar Soluções</h2>
</div>

<a class="row" href="${linkTo[SolucaoController].create}">Adicionar</a>

<table class="table table-bordered" id="listaMotivo" style="font-size: 12px;">
    <thead>
        <tr>
            <th>Nome</th>
            <th>Defeito Encontrado</th>
            <th>Indevido</th>
            <th>Ativo</th>
            <th>Ações</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${solucaoList}" var="solucao">
            <tr>
                <td>${solucao.nome}</td>
                <td>${solucao.motivo.nome}</td>
                <td>
                    <c:choose>
                        <c:when test="${solucao.indevido}">
                            Sim
                        </c:when>    
                        <c:otherwise>
                            Não
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${solucao.ativo}">
                            Sim
                        </c:when>    
                        <c:otherwise>
                            Não
                        </c:otherwise>
                    </c:choose>
                </td>

                <td>
                    <a href="${linkTo[SolucaoController].edit()}${solucao.id}"
                       class="btn btn-warning btn-sm"> 
                        <span
                            class="glyphicon glyphicon-pencil" aria-hidden="true">
                        </span>
                    </a>
                    <button class="btn btn-danger btn-sm deletar" data-id="${solucao.id}"
                            data-nome="${solucao.nome}" data-toggle="modal"
                            data-target=".bs-example-modal-sm">
                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                    </button>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<script>
    setTimeout(function () {
        $('#listaMotivo').DataTable({
            "pagingType": "simple"
        });
    });


    $('.deletar').click(function () {

        botao = $(this);

        var id = botao.data("id");
        var nome = botao.data("nome");

        $("#idRef").val(id);
        $("#nomeRef").text(nome);

    });

</script>

<div class="modal fade bs-example-modal-sm" id="modalDeletaRede"
     tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <form action="${linkTo[SolucaoController].delete}" method="post">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">Confirmação</h4>
                </div>

                <input type="hidden" name="id" id="idRef" />
                <div class="modal-body">
                    Remover Solução <b id="nomeRef"></b>?
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                    <button type="submit" class="btn btn-danger">Confirmar</button>
                </div>
            </div>
        </form>
    </div>
</div>