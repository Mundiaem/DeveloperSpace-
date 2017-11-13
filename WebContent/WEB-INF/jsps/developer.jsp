
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<title>Developer</title>
</head>
<body>
<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
            <h1>Developer</h1>
            <table class="developer">


            <form class="form-horizontal" th:action="@{/developer/{id}/skills(id=${developer.id})}" method="post" enctype="multipart/form-data" >
            	<fieldset>
            		<div class="form-group">
	                    <label class="col-lg-2 control-label">Name</label>
	                    <div class="col-lg-6">
	                    	<c:out value="${developer.firstName}"></c:out> 
	                    </div>
                	</div>
            		<div class="form-group">
	                    <label class="col-lg-2 control-label">Email</label>
	                    <div class="col-lg-6">
	                    	<c:out value="${developer.email}"></c:out>
	                    </div>
                	</div>
            		<div class="form-group">
	                    <label class="col-lg-2 control-label">Skills</label>
	                    <div class="col-lg-10">
							<div th:each="skill : ${developer.skills}">
								<span th:text="${skill.label}" /> - <span th:text="${skill.description}" />
							</div>
	                    </div>
	                </div>
            		<div class="form-group">
	                    <div class="col-lg-6 col-lg-offset-2">
							<div class="input-group">
								<select name="skillId" class="form-control">
									<option th:each="skill : ${skills}" 
										th:value="${skill.id}" 
										th:text="${skill.description}">Skill</option>
								</select>
								<span class="input-group-btn">
									<button type="submit" class="btn btn-default">Add skill</button>
								</span>
							</div>
	                    </div>
                	</div>
            	</fieldset>
            </form>
          
          </div>
        </div>
      </div>
	</div>


</body>
</html>