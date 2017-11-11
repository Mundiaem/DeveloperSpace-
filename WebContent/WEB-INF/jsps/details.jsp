<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Developer</h1>
	Name: <b th:text="${developer.firstName}" /> <b th:text="${developer.lastName}" /><br/>
	Email: <span th:text="${developer.email}" /><br/>
	Skills:
		<span th:each="skill : ${developer.skills}">
			<br/>&nbsp;&nbsp;<span th:text="${skill.label}" /> - <span th:text="${skill.description}" />
		</span>
	<form th:action="@{/developer/{id}/skills(id=${developer.id})}" method="post" enctype="multipart/form-data" >
		<select name="skillId">
			<option th:each="skill : ${skills}" 
				th:value="${skill.id}" 
				th:text="${skill.description}">Skill</option>
		</select>
		<input type="submit" value="Add skill"/>
	</form>
</body>
</html>