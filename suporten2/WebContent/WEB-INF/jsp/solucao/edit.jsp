<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
           prefix="decorator"%>

<div class="page-header">
    <h2>Editar Solução</h2>
    <a class="btn btn-default btn-xs" href="${linkTo[SolucaoController].list}">Voltar p/ lista</a>
</div>
<form action="${linkTo[SolucaoController].update}" method="post"  style="width: 50%;">
    <input type="hidden" name="s.id" value="${solucao.id}" /> 
    <div class="form-group">
        <label for="nome">Nome: </label> 
        <input 
            type="text"
            class="form-control" 
            id="nome" 
            placeholder="Nome"
            name="s.nome"
            value="${solucao.nome}">

        <c:if test="${not empty errors.from('s.nome')}">
            <span class="alert alert-warning validator" role="alert"> 
                <span
                    class="glyphicon glyphicon-exclamation-sign" 
                    aria-hidden="true"></span> 
                ${errors.from('s.nome')}
            </span>
        </c:if>
    </div>

    <div class="form-group">
        <div class="form-inline">
            <label for="rede">Rede:</label> 
            <select class="form-control" name="" id="rede">
                <option value="" disabled="disabled">Selecione</option>
                <c:forEach items="${redeList}" var="rede">
                    <option <c:if test="${rede.id == motivo.macroMotivo.rede.id}">selected </c:if> value="${rede.id}">${rede.nome}</option>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="form-group">
        <div class="form-inline">
            <label for="macro">Motivo de Suporte:</label> 
            <select class="form-control" name="m.macroMotivo.id" id="macro">
                <c:forEach items="${macroMotivoList}" var="macro">
                    <option <c:if test="${motivo.macroMotivo.id == macro.id}"> selected </c:if> value="${macro.id}">${macro.nome}</option>
                </c:forEach>
            </select>
            <c:if test="${not empty errors.from('m.macroMotivo.id')}">
                <span class="alert alert-warning validator">
                    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> 
                    ${errors.from('m.macroMotivo.id')}
                </span>
            </c:if>
        </div>
    </div>

    <div class="form-group">
        <div class="form-inline">
            <label for="macro">Defeito Encontrado:</label> 
            <select class="form-control" name="s.motivo.id" id="motivo">
                <option selected="selected" disabled="disabled">Selecione</option>
                <c:forEach items="${motivoList}" var="motivo">
                    <option value="${motivo.id}" <c:if test="${solucao.motivo.id == motivo.id}">selected="selected"</c:if>>${motivo.nome}</option>
                </c:forEach>
            </select>
            <c:if test="${not empty errors.from('s.motivo.id')}">
                <span class="alert alert-warning validator">
                    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> 
                    ${errors.from('s.motivo.id')}
                </span>
            </c:if>
        </div>
    </div>

    <div class="form-group">
        <div class="checkbox">
            <label> 
                <input type="checkbox" name="s.indevido"<c:if test="${solucao.indevido}">checked="checked"</c:if>>Indevido</label>
            </div>
        </div>

        <div class="form-group">
            <div class="checkbox">
                <label> 
                    <input type="checkbox" name="s.ativo"<c:if test="${solucao.ativo}">checked="checked"</c:if>>Ativo</label>
            </div>
        </div>

        <button type="submit" class="btn btn-default">Alterar</button>
    </form>

    <script>

        function limpa(e) {
            e.html("<option value='' selected disabled>Selecione</option>");
            e.val('');
        }

        $(document).ready(function () {

            $("#rede").change(function () {

                limpa($("#macro"));
                limpa($("#motivo"));

                var rede = $(this).val();
                $.ajax({
                    type: 'GET',
                    url: "${pageContext.request.contextPath}/json/macromotivos/" + rede,
                    success: function (macroopt) {
                        lemacroopt = macroopt;
                        macros = "<option value='' selected disabled>Selecione</option>";
                        for (i = 0; i < lemacroopt.list.length; i++) {
                            macros += "<option value='" + lemacroopt.list[i].id + "'> " + lemacroopt.list[i].nome + "</option>";
                        }
                        $("#macro").html(macros);
                    }
                });
            });

            $("#macro").change(function () {

                limpa($("#motivo"));

                $.ajax({
                    type: 'GET',
                    url: "${pageContext.request.contextPath}/json/motivos/" + $(this).val(),
                    success: function (motivoopt) {
                        lemotivoopt = motivoopt;
                        motivos = "<option value='' selected disabled>Selecione</option>";
                        for (i = 0; i < lemotivoopt.list.length; i++) {
                            motivos += "<option value='" + lemotivoopt.list[i].id + "'> " + lemotivoopt.list[i].nome + "</option>";
                        }
                        $("#motivo").html(motivos);
                    }
                });
            });


        });
</script>
