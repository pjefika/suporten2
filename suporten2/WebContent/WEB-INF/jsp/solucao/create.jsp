<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
           prefix="decorator"%>

<div class="page-header">
    <h2>Cadastro de Solução</h2>
</div>
<form action="${linkTo[SolucaoController].add}" method="post" style="width: 75%;">

    <div class="form-group">
        <div class="form-inline">
            <label for="nome">Nome: </label> 
            <input type="text"
                   class="form-control" 
                   id="nome" 
                   placeholder="Nome"
                   name="s.nome">
            <c:if test="${not empty errors.from('s.nome')}">
                <small>
                    <span class="alert alert-warning validator">
                        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> 
                        ${errors.from('s.nome')}
                    </span>
                </small>			
            </c:if>
        </div>
    </div>

    <div class="form-group">
        <div class="form-inline">
            <label for="rede">Rede:</label> 
            <select class="form-control" name="" id="rede">
                <option value="" selected="selected" disabled="disabled">Selecione</option>
                <c:forEach items="${redeList}" var="rede">
                    <option value="${rede.id}">${rede.nome}</option>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="form-group">
        <div class="form-inline">
            <label for="macro">Motivo de Suporte:</label> 
            <select class="form-control" name="" id="macro">
                <option selected="selected" disabled="disabled">Selecione</option>
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
                <input type="checkbox" name="s.indevido"> Indevido
            </label>
        </div>
    </div>

    <div class="form-group">
        <div class="checkbox">
            <label> 
                <input type="checkbox" name="s.ativo"> Ativa
            </label>
        </div>
    </div>

    <button type="submit" class="btn btn-default">Registrar</button>
</form>

<script>

    function limpa(e) {
        e.html("<option value='' selected disabled>Selecione</option>");
        e.val('');
    }

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


</script>
