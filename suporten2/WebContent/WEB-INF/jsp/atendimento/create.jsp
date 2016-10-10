<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>

<div class="page-header">
	<h2>Atendimento</h2>
</div>
<div class="row">
	<div class="col-xs-8">
		<form action="${linkTo[AtendimentoController].add}" method="post">
			
			<div class="form-group">
				<div class="row">
					<div class="col-md-8">
						<label for="operadorLogin">Login Operador: </label>
						<input type="text"
							class="form-control" id="operadorLogin"
							placeholder="Matrícula do Operador" name="a.loginOperador" value="${atendimento.loginOperador}"/>
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
						<label for="macro">Macro Motivo:</label>
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
						<label for="motivo">Motivo:</label> 
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
						<label for="observacao">Observação:</label>
						<textarea class="form-control" name="a.observacao" id="observacao" placeholder="Observação">${atendimento.observacao}</textarea>
					</div>
				</div>
				<div class="col-md-4">
				
				</div>
			</div>	
		
			<button type="submit" class="btn btn-default">Registrar</button>
		</form>
	</div>
	<div class="col-xs-4">
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
	</div>



</div>
<script>

	function limpa(e){
		e.html("<option value='' selected disabled>Selecione</option>");
		e.val('');
	}


	$(document).ready(function(){
	
		$("#rede").change(function(){

			limpa($("#macro"));
			limpa($("#motivo"));
			limpa($("#solucao"));
			
			var rede = $(this).val();
			$.ajax({
				type:'GET',
				url: "${pageContext.request.contextPath}/json/macromotivos/"+rede,
				success: function(macroopt){
					lemacroopt = macroopt;
					macros = "<option value='' selected disabled>Selecione</option>";
					for(i=0; i < lemacroopt.list.length; i++){
						macros += "<option value='"+lemacroopt.list[i].id+"'> " + lemacroopt.list[i].nome + "</option>";
					}
					$("#macro").html(macros);
				}
			});
		});
		
		$("#macro").change(function(){
			
			limpa($("#motivo"));
			limpa($("#solucao"));

			$.ajax({
				type:'GET',
				url: "${pageContext.request.contextPath}/json/motivos/"+ $(this).val(),
				success: function(motivoopt){
					lemotivoopt = motivoopt;
					motivos = "<option value='' selected disabled>Selecione</option>";
					for(i=0; i < lemotivoopt.list.length; i++){
						motivos += "<option value='"+lemotivoopt.list[i].id+"'> " + lemotivoopt.list[i].nome + "</option>";
					}
					$("#motivo").html(motivos);
				}
			});
		});
		
		$("#motivo").change(function(){
			
			limpa($("#solucao"));

			$.ajax({
				type:'GET',
				url: "${pageContext.request.contextPath}/json/solucaos/"+ $(this).val(),
				success: function(solucaoopt){
					lesolucaoopt = solucaoopt;
					solucaos = "<option value='' selected disabled>Selecione</option>";
					for(i=0; i < lesolucaoopt.list.length; i++){
						solucaos += "<option value='"+lesolucaoopt.list[i].id+"'> " + lesolucaoopt.list[i].nome + "</option>";
					}
					$("#solucao").html(solucaos);
				}
			});
		});

		$("#operadorLogin").change(function(){
			var login = $(this).val();
			 $.ajax({ 
	             type: 'GET',
	             data: 
	             'login=' +  login,
	             url:  'http://efika/web/services/comandos/?max=5',
	             dataType: 'xml',
	             success: function(xml){
	
	             	var comandos = [];
	             	
	             	$(xml).find('comando').each(function(){ 
	                     	
	             		var nome = $(this).attr('nome');
	             		var data = $(this).attr('data');
	
							comandos.push(nome + ' - ' + data + '<br/>');
	             	});
	 
			           $("#comandos").html(comandos);
	             	
	             }
	         });
	
	         $.ajax({ 
	             type: 'GET',
	             data: 
	             "login=" +  login,
	             url:  'http://efika/web/services/materiais/?max=5',
	             dataType: 'xml',
	             success: function(xml){
	
	             	var materiais = [];
	             	
	             	$(xml).find('material').each(function(){ 
	                     	
	             		var titulo = $(this).attr('titulo');
	             		var data = $(this).attr('data');
	
	             		materiais.push(titulo + ' - ' + data + '<br/>');
	             	});
	
						$("#materiais").html(materiais);
						
	             }
	         });

	         $(".infos").removeClass("hide");

		});
	});
</script>
