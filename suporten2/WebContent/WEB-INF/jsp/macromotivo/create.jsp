<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>

<div class="page-header">
	<h2>Cadastro de Motivo de Suporte</h2>
</div>
<form action="${linkTo[MacroMotivoController].add}" method="post" style="width: 75%;">

	<div class="form-group">
		<div class="form-inline">
			<label for="nome">Nome: </label> 
			<input type="text"
				class="form-control" 
				id="nome" 
				placeholder="Nome"
				name="m.nome">
			<c:if test="${not empty errors.from('m.nome')}">
				<small>
					<span class="alert alert-warning validator">
						<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> 
						${errors.from('m.nome')}
					</span>
				</small>			
			</c:if>
		</div>
	</div>

	<div class="form-group">
		<div class="form-inline">
			<label for="rede">Rede:</label> 
			<select class="form-control" name="m.rede.id">
				<option selected="selected" disabled="disabled">Selecione</option>
				<c:forEach items="${redeList}" var="rede">
					<option value="${rede.id}">${rede.nome}</option>
				</c:forEach>
			</select>
			<c:if test="${not empty errors.from('m.rede.id')}">
				<span class="alert alert-warning validator">
					<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> 
					${errors.from('m.rede.id')}
				</span>
			</c:if>
		</div>
	</div>
	
	<div class="form-group">
		<div class="checkbox">
			<label> 
				<input type="checkbox" name="m.ativo"> Ativa
			</label>
		</div>
	</div>	

	<button type="submit" class="btn btn-default">Registrar</button>
</form>
