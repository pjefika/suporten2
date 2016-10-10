<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>

<div class="page-header">
	<h2>Cadastro de Rede</h2>
</div>
<div class="form-inline">
	<form action="${linkTo[RedeController].add}" method="post" style="width: 50%;">
		<label for="nome">Nome: </label> <input type="text"
			class="form-control" id="nome" placeholder="Nome" name="r.nome">
		<c:if test="${not empty errors.from('r.nome')}">
			<span class="alert alert-warning validator" role="alert"> <span
				class="glyphicon glyphicon-exclamation-sign" aria-hidden="true">
			</span> ${errors.from('r.nome')}
			</span>
		</c:if>

		<div class="checkbox">
			<label> 
				<input type="checkbox" name="r.ativo"> Ativa
			</label>
		</div>

		<button type="submit" class="btn btn-default">Registrar</button>
	</form>
</div>
