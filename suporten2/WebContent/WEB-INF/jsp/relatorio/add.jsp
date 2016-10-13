<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	response.setContentType("application/vnd.ms-excel");
	response.setHeader("Content-Disposition", "inline; filename=" + "excel.xls");
%>
<table>
	<thead>
		<tr>
			<th>Rede</th>
			<th>Motivo de Suporte</th>
			<th>Defeito Encontrado</th>
			<th>Solução</th>
			<th>Login Operador</th>
			<th>Login Registro</th>
			<th>Terminal</th>
			<th>Data</th>
			<th>Observação</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${atendimentos}" var="at">
			<tr>
				<td>${at.solucao.motivo.macroMotivo.rede.nome}</td>
				<td>${at.solucao.motivo.macroMotivo.nome}</td>
				<td>${at.solucao.motivo.nome}</td>
				<td>${at.solucao.nome}</td>
				<td>${at.loginOperador}</td>
				<td>${at.loginRegistro}</td>
				<td>${at.terminal}</td>
				<td><fmt:formatDate type="both" dateStyle="short"
						timeStyle="short" value="${at.dataRegistro}" /></td>
				<td>${at.observacao}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>