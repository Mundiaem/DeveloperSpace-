<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

</head>
<body>
Request (Using EL): ${name}</p>
<c:out value="${name}"></c:out> <p/>

<sql:query var="rs" dataSource="jdbc/developers">
select id, firstname, lastname, email, skill from developer
</sql:query>
 
<h1>Developers</h1>
	<table>
		<tr>
			<th>Name</th>
			<th>Skills</th>
			<th></th>
		</tr>
		<tr th:each="developer : ${developers}">
			<td th:text="${row.firstname}"></td>
			<td>
				<span th:each="skill,iterStat : ${developer.skills}">
					<span th:text="${skill.label}"/><th:block th:if="${!iterStat.last}">,</th:block>
				</span>
			</td>
			<td>
				<a th:href="@{/developer/{id}(id=${developer.id})}">view</a>
			</td>
		</tr>
	</table>
	<hr/>
	<form th:action="@{/developers}" method="post" enctype="multipart/form-data">
		<div>
			First name: <input name="firstName" />
		</div>
		<div>
			Last name: <input name="lastName" />
		</div>
		<div>
			Email: <input name="email" />
		</div>
		<div>
			<input type="submit" value="Create developer" name="button"/>
		</div>
	</form>
  <h2>Results</h2>

<c:forEach var="row" items="${rs.rows}">
    First Name ${row.firstname}<br/>
    Last Name ${row.lastname}<br/>
</c:forEach>

</body>
</html>