<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>

<div class="page-header">
	<h2>Editar de Motivo de Suporte</h2>
</div>

<form action="${linkTo[MacroMotivoController].update}" method="post"  style="width: 50%;">
	<input type="hidden" name="m.id" value="${macroMotivo.id}" /> 
	
	<div class="form-group">
		<label for="nome">Nome: </label> 
		<input 
			type="text"
			class="form-control" 
			id="nome" 
			placeholder="Nome"
			name="m.nome"
		 	value="${macroMotivo.nome}">
		 	
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
		<label for="rede">Rede:</label> 
		<select class="form-control" name="m.rede.id">
			<option value="" selected="selected" disabled="disabled">Selecione</option>
			<c:forEach items="${redeList}" var="rede">
				<option value="${rede.id}" <c:if test="${macroMotivo.rede.id == rede.id}">selected="selected"</c:if>>${rede.nome}</option>
			</c:forEach>
		</select>
		<c:if test="${not empty errors.from('m.nome')}">
			<span class="alert alert-warning validator" role="alert"> <span
				class="glyphicon glyphicon-exclamation-sign" aria-hidden="true">
			</span> ${errors.from('m.rede.id')}
			</span>
		</c:if>
	</div>
	
	<div class="form-group">
		<div class="checkbox">
			<label> 
				<input type="checkbox" name="m.ativo" <c:if test="${macroMotivo.ativo}">checked="checked"</c:if>> Ativo
			</label>
		</div>
	</div>
	
	<button type="submit" class="btn btn-default">Alterar</button>
</form>
