<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	response.setContentType("application/vnd.ms-excel");
	response.setHeader("Content-Disposition", "inline; filename=" + "excel.xls");
%>
<table>
	<thead>
		<tr>
			<th>Solução</th>
			<th>Login Operador</th>
			<th>Login Registro</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${atendimentos}" var="at">
			<tr>
				<td>${at.solucao.nome}</td>
				<td>${at.loginOperador}</td>
				<td>${at.loginRegistro}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>