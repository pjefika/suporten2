<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>

<div class="page-header">
	<h2>Relatório</h2>
</div>
<div class="row">
	<div class="col-xs-8">
		<form action="${linkTo[RelatorioController].add}" method="post">

			<div class="form-group">
				<div class="row">
					<div class="col-md-8">
						<label for="operadorLogin">Login Operador: </label> <input
							type="text" class="form-control" id="operadorLogin"
							placeholder="Matrícula do Operador" name="a.loginOperador"
							value="${atendimento.loginOperador}" />
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

						<label for="operadorLogin">Terminal / ID Fibra /
							Instância: </label> <input type="text" class="form-control" id="terminal"
							placeholder="Terminal / ID Fibra" name="a.terminal"
							value="${atendimento.terminal}" />

					</div>
					<div class="col-md-4" style="margin-top: 30px;">
						<c:if test="${not empty errors.from('a.terminal')}">
							<small> <span class="alert alert-warning validator">
									<span class="glyphicon glyphicon-exclamation-sign"
									aria-hidden="true"></span> ${errors.from('a.terminal')}
							</span>
							</small>
						</c:if>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
