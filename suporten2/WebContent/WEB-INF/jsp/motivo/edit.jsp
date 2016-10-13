<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>

<div class="page-header">
	<h2>Editar Defeito Encontrado</h2>
</div>

<form action="${linkTo[MotivoController].update}" method="post"  style="width: 50%;">
	<input type="hidden" name="m.id" value="${motivo.id}" /> 
	<input type="hidden" id="lemacro" value="${motivo.macroMotivo.id}"/>
	<div class="form-group">
		<label for="nome">Nome: </label> 
		<input 
			type="text"
			class="form-control" 
			id="nome" 
			placeholder="Nome"
			name="m.nome"
		 	value="${motivo.nome}">
		 	
		<c:if test="${not empty errors.from('m.nome')}">
			<span class="alert alert-warning validator" role="alert"> 
			<span
				class="glyphicon glyphicon-exclamation-sign" 
				aria-hidden="true"></span> 
				${errors.from('m.nome')}
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
		<div class="checkbox">
			<label> 
				<input type="checkbox" name="m.ativo" <c:if test="${motivo.ativo}">checked="checked"</c:if>> Ativo
			</label>
		</div>
	</div>
	
	<button type="submit" class="btn btn-default">Alterar</button>
</form>

<script>

function limpa(e){
	e.html("<option value='' selected disabled>Selecione</option>");
	e.val('');
}

$("#rede").change(function(){

	limpa($("#macro"));
	
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

</script>
