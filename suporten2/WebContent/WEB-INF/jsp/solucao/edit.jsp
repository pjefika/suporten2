<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>

<div class="page-header">
	<h2>Editar Solução</h2>
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
			<label for="macro">Defeito Encontrado:</label> 
			<select class="form-control" name="s.motivo.id">
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
				<input type="checkbox" name="s.ativo" <c:if test="${solucao.ativo}">checked="checked"</c:if>> Ativo
			</label>
		</div>
	</div>
	
	<button type="submit" class="btn btn-default">Alterar</button>
</form>
