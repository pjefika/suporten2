<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<link
	href="${pageContext.request.contextPath}/resources/datepicker/css/datepicker.css"
	rel="stylesheet" />

<script
	src="${pageContext.request.contextPath}/resources/datepicker/js/bootstrap-datepicker.js"></script>



<div class="page-header">
	<h2>Exportar Base</h2>
</div>
<div class="row">
	<div class="col-xs-8">
		<form action="${linkTo[RelatorioController].add}" method="post">

			<div class="form-group">
				<div class="row">
					<div class="col-md-8">
						<label for="dataInicial">Data Inicial: </label> <input type="text"
							class="form-control datepicker" id="dataInicial"
							placeholder="Data Inicial" name="r.dataInicio" />
					</div>
					<div class="col-md-4" style="margin-top: 30px;">
						<c:if test="${not empty errors.from('r.dataInicio')}">
							<small> <span class="alert alert-warning validator">
									<span class="glyphicon glyphicon-exclamation-sign"
									aria-hidden="true"></span> ${errors.from('r.dataInicio')}
							</span>
							</small>
						</c:if>
					</div>
				</div>

				<div class="row">
					<div class="col-md-8">
						<label for="dataIinicial">Data Final: </label> <input type="text"
							class="form-control datepicker" id="dataFinal"
							placeholder="Data Final" name="r.dataFinal" />
					</div>
					<div class="col-md-4" style="margin-top: 30px;">
						<c:if test="${not empty errors.from('r.dataFinal')}">
							<small> <span class="alert alert-warning validator">
									<span class="glyphicon glyphicon-exclamation-sign"
									aria-hidden="true"></span> ${errors.from('r.dataFinal')}
							</span>
							</small>
						</c:if>
					</div>
				</div>
			</div>

			<button type="submit" class="btn btn-default">Exportar</button>
		</form>
	</div>
</div>
<script>

	$(document).ready(function(){
		
		$('.datepicker').datepicker({
		    format: 'dd/mm/yyyy',
		    autoclose: true,
		    language: 'pt-BR'
		});
	});
</script>
