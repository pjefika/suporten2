<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
           prefix="decorator"%>

<div class="page-header">
    <h2>Atendimento</h2>
</div>
<div class="row">
    <div class="col-xs-7">
        <form action="${linkTo[AtendimentoController].add}" method="post">

            <div class="form-group">
                <div class="row">
                    <div class="col-md-8">
                        <label for="operadorLogin">Login Operador: </label>
                        <input type="text"
                               class="form-control" id="operadorLogin"
                               placeholder="Matrícula do Operador" name="a.loginOperador" value="${atendimento.loginOperador}"/>
                        <span id="nomeOperador"></span>
                    </div>
                    <div class="col-md-4" style="margin-top: 30px;">
                        <c:if test="${not empty errors.from('a.loginOperador')}">
                            <small> <span class="alert alert-warning validator">
                                    <span class="glyphicon glyphicon-exclamation-sign"
                                          aria-hidden="true"></span> ${errors.from('a.loginOperador')}
                                </span>
                            </small>
                        </c:if>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="row">
                    <div class="col-md-8">
                        <label>Login Guru:*</label>
                        <input type="text" class="form-control" id="guruLogin" placeholder="Matrícula do Guru" name="a.loginGuru" value="${atendimento.loginGuru}"/>
                        <span id="nomeOperadorGuru"></span>
                    </div>
                </div>
            </div>

            <div class="form-group">

                <div class="row">
                    <div class="col-md-8">

                        <label for="operadorLogin">Terminal / ID Fibra / Instância: </label> 
                        <input
                            type="text" class="form-control" id="terminal"
                            placeholder="Terminal / ID Fibra" name="a.terminal" value="${atendimento.terminal}"/>

                    </div>
                    <div class="col-md-4" style="margin-top: 30px;">
                        <c:if test="${not empty errors.from('a.terminal')}">
                            <small> <span class="alert alert-warning validator"> <span
                                        class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                                    ${errors.from('a.terminal')}
                                </span>
                            </small>
                        </c:if>		  
                    </div>
                </div>	
            </div>

            <div class="form-group">
                <div class="row">
                    <div class="col-md-8">
                        <label>Tipo Atividade: </label> 
                        <br/>
                        <div class="radio-inline">
                            <input type="radio" value="BD/TT" name="a.tipoAtividade"/>
                            BD/TT
                        </div>
                        <div class="radio-inline">
                            <input type="radio" value="Alta/BA" name="a.tipoAtividade"/>
                            Alta/BA
                        </div>

                    </div>
                    <div class="col-md-4">
                        <c:if test="${not empty errors.from('a.tipoAtividade')}">
                            <small> <span class="alert alert-warning validator"> <span
                                        class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                                    ${errors.from('a.tipoAtividade')}
                                </span>
                            </small>
                        </c:if>	                        
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="row">
                    <div class="col-md-8">
                        <label for="rede">Rede:</label> 
                        <select class="form-control" name="" id="rede">
                            <option value="" selected="selected" disabled="disabled">Selecione</option>
                            <c:forEach items="${redeList}" var="rede">
                                <option value="${rede.id}">${rede.nome}</option>
                            </c:forEach>
                        </select>			
                    </div>
                    <div class="col-md-4">

                    </div>
                </div>
            </div>            

            <div class="form-group">
                <div class="row">
                    <div class="col-md-8">
                        <label for="macro">Motivo de Suporte:</label>
                        <select class="form-control"
                                name="" id="macro">
                            <option value="" selected="selected" disabled="disabled">Selecione</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                    </div>
                </div>	
            </div>


            <div class="form-group">
                <div class="row">
                    <div class="col-md-8">
                        <label for="motivo">Defeito Encontrado:</label> 
                        <select class="form-control"
                                name="" id="motivo">
                            <option value="" selected="selected" disabled="disabled">Selecione</option>
                        </select>
                    </div>
                    <div class="col-md-4">

                    </div>
                </div>	
            </div>


            <c:if test="${not empty errors.from('a.solucao.id')}">
                <c:set value="has-error" var="warningSelect" />
            </c:if>
            <div class="row">
                <div class="col-md-8">

                    <div class="form-group ${warningSelect}">
                        <label for="solucao">Solução:</label> 
                        <select class="form-control"
                                name="a.solucao.id" id="solucao">
                            <option value='' selected="selected" disabled="disabled">Selecione</option>
                        </select>
                    </div>

                </div>
                <div class="col-md-4">

                </div>
            </div>	

            <div class="row">
                <div class="col-md-8">
                    <div class="form-group">
                        <label for="observacao">Observação:*</label>
                        <textarea class="form-control" name="a.observacao" id="observacao" placeholder="Observação">${atendimento.observacao}</textarea>
                    </div>
                </div>
                <div class="col-md-4">

                </div>
            </div>	

            <button type="submit" class="btn btn-default">Registrar</button>
        </form>
    </div>
    <div class="col-xs-5">
        <div class="panel panel-default infos hide">
            <div class="panel-heading">Últimos 5 materiais abertos pelo Operador</div>
            <div class="panel-body" id="materiais">

            </div>
        </div>

        <div class="panel panel-default infos hide">
            <div class="panel-heading">Últimos 5 comandos executados pelo Operador</div>
            <div class="panel-body" id="comandos">

            </div>
        </div>

        <div class="panel panel-default infos hide">
            <div class="panel-heading">Atendimentos realizados para mesmo Terminal/Id Fibra/ Instância</div>
            <div class="panel-body">
                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">

                </div>
            </div>
        </div>
    </div>



</div>
<script>

    function limpa(e) {
        e.html("<option value='' selected disabled>Selecione</option>");
        e.val('');
    }


    $(document).ready(function () {

        $("#rede").change(function () {

            limpa($("#macro"));
            limpa($("#motivo"));
            limpa($("#solucao"));

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
            limpa($("#solucao"));

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

        $("#motivo").change(function () {

            limpa($("#solucao"));

            $.ajax({
                type: 'GET',
                url: "${pageContext.request.contextPath}/json/solucaos/" + $(this).val(),
                success: function (solucaoopt) {
                    lesolucaoopt = solucaoopt;
                    solucaos = "<option value='' selected disabled>Selecione</option>";
                    for (i = 0; i < lesolucaoopt.list.length; i++) {
                        solucaos += "<option value='" + lesolucaoopt.list[i].id + "'> " + lesolucaoopt.list[i].nome + "</option>";
                    }
                    $("#solucao").html(solucaos);
                }
            });
        });

        $("#guruLogin").change(function () {
            var login = $(this).val();
            $.ajax({
                type: 'GET',
                data: 'login=' + login,
                url: 'http://efika/web/services/colaborador/',
                dataType: 'xml',
                success: function (xml) {
                    $(xml).find('colaborador').each(function () {
                        var nome = $(this).find('nome').text();
                        var cargo = $(this).find('cargo').text();
                        var supervisor = $(this).find('supervisor').text();
                        var area = $(this).find('area').text();
                        var pabx = $(this).find('pabx').text();

                        if (nome === 'Colaborador não encontrado!') {
                            //$("#nomeOperadorGuru").hide();
                            $("#nomeOperadorGuru").text("Login não encontrado.");
                        } else {
                            $("#nomeOperadorGuru").text(nome + ' - Gestor: ' + supervisor);
                            $("#nomeOperadorGuru").show();
                        }
                        if (login === '') {
                            $("#nomeOperadorGuru").hide();
                        }
                    });
                }
            });
        });

        $("#operadorLogin").change(function () {
            var login = $(this).val();

            $.ajax({
                type: 'GET',
                data: 'login=' + login,
                url: 'http://efika/web/services/colaborador/',
                dataType: 'xml',
                success: function (xml) {
                    $(xml).find('colaborador').each(function () {
                        var nome = $(this).find('nome').text();
                        var cargo = $(this).find('cargo').text();
                        var supervisor = $(this).find('supervisor').text();
                        var area = $(this).find('area').text();
                        var pabx = $(this).find('pabx').text();
                        if (nome === 'Colaborador não encontrado!' || nome === '') {
                            //$("#nomeOperador").hide();
                            $("#nomeOperador").text("Login não encontrado.");
                        } else {
                            $("#nomeOperador").text(nome + ' - Gestor: ' + supervisor);
                            $("#nomeOperador").show();
                        }
                    });
                }
            });

            if (login !== '') {

                $.ajax({
                    type: 'GET',
                    data: 'login=' + login,
                    url: 'http://efika/web/services/comandos/?max=5',
                    dataType: 'xml',
                    success: function (xml) {

                        var comandos = [];

                        $(xml).find('comando').each(function () {

                            var nome = $(this).attr('nome');
                            var data = $(this).attr('data');
                            var instancia = $(this).attr('instancia');

                            comandos.push(instancia + ' - ' + nome + ' - ' + data + '<br/>');
                        });

                        $("#comandos").html(comandos);

                    }
                });

                $.ajax({
                    type: 'GET',
                    data: "login=" + login,
                    url: 'http://efika/web/services/materiais/?max=5',
                    dataType: 'xml',
                    success: function (xml) {

                        var materiais = [];

                        $(xml).find('material').each(function () {

                            var titulo = $(this).attr('titulo');
                            var data = $(this).attr('data');

                            materiais.push(titulo + ' - ' + data + '<br/>');
                        });

                        $("#materiais").html(materiais);

                    }
                });
                $(".infos").removeClass("hide");
            } else {
                $(".infos").addClass("hide");
                $("#nomeOperador").hide();
            }
        });

        $("#terminal").change(function () {
            var terminal = $(this).val();

            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/json/atendimentos/' + terminal,
                success: function (atends) {
                    var ats = '';
                    for (i = 0; i < atends.list.length; i++) {
                        var ledata = new Date(atends.list[i].dataRegistro);
                        var data = ledata.getDate() + "/" + ledata.getMonth() + "/" + ledata.getFullYear() + " " + ledata.getHours() + ":" + ledata.getMinutes();
                        ats += '<div class="panel panel-default">' +
                                '<div class="panel-heading" role="tab" id="heading' + i + '">' +
                                '<h4 class="panel-title">' +
                                '<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse' + i + '" aria-expanded="true" aria-controls="collapse' + i + '">' +
                                'Operador: ' + atends.list[i].loginOperador + ' Data: ' + data +
                                '</a>' +
                                '</h4>' +
                                '</div>' +
                                '<div id="collapse' + i + '" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading' + i + '">' +
                                '<div class="panel-body">' +
                                '<b>Suporte</b>: ' + atends.list[i].loginRegistro + ' <b>Rede</b>: ' + atends.list[i].solucao.motivo.macroMotivo.rede.nome + '<br>' +
                                '<b>Motivo de Suporte</b>: ' + atends.list[i].solucao.motivo.macroMotivo.nome + ' <b>Defeito Encontrado</b>: ' + atends.list[i].solucao.motivo.nome + '<br>' +
                                '<b>Solução</b>: ' + atends.list[i].solucao.nome + '<br>' +
                                '<b>Observações</b>: ' + atends.list[i].observacao +
                                '</div>' +
                                '</div>' +
                                '</div>';

                    }
                    $("#accordion").html(ats);
                }
            });

        });
    });
</script>
