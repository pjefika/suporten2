<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>

<div class="page-header">
	<h2>Editar Motivo</h2>
</div>

<form action="${linkTo[MotivoController].update}" method="post"  style="width: 50%;">
	<input type="hidden" name="m.id" value="${motivo.id}" /> 
	
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
		<label for="macroMotivo">Macro Motivo:</label> 
		<select class="form-control" name="m.macroMotivo.id">
			<option value="" selected="selected" disabled="disabled">Selecione</option>
			<c:forEach items="${macroMotivoList}" var="macroMotivo">
				<option value="${macroMotivo.id}" <c:if test="${motivo.macroMotivo.id == macroMotivo.id}">selected="selected"</c:if>>${macroMotivo.nome}</option>
			</c:forEach>
		</select>
		<c:if test="${not empty errors.from('m.macroMotivo.id')}">
			<span class="alert alert-warning validator" role="alert"> <span
				class="glyphicon glyphicon-exclamation-sign" aria-hidden="true">
			</span> ${errors.from('m.macroMotivo.id')}
			</span>
		</c:if>
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
