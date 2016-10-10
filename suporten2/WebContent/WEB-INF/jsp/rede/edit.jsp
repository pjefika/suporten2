<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>

<div class="page-header">
	<h2>Editar de Rede</h2>
</div>
<div class="form-inline">
	<form action="${linkTo[RedeController].update}" method="post" style="width: 50%;">
	
	    <input type="hidden" name="r.id" value="${rede.id}" /> 
		<label for="nome">Nome: </label> 
		<input type="text" class="form-control" id="nome"
			placeholder="Nome" name="r.nome" value="${rede.nome}"> 
		<c:if test="${not empty errors.from('rede.nome')}">
			<span class="alert alert-warning validator" role="alert">
			<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"> </span> 
			${errors.from('rede.nome')}</span>
		</c:if>
		
		<div class="form-group">
			<div class="checkbox">
				<label> 
					<input type="checkbox" name="r.ativo" <c:if test="${rede.ativo}">checked="checked"</c:if>> Ativa
				</label>
			</div>
		</div>

		<button type="submit" class="btn btn-default">Alterar</button>
	</form>
</div>
