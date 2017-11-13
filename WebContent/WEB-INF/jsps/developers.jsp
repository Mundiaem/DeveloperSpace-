<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Developers</title>
<link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

</head>
<body>
	<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
            <h1>Developers</h1>

			<table class="table table-striped table-hover">
			




				<thead>
					<tr>
						<th>Name</th>
						<th>Email</th>
						<th>Skills</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="developer" items="${developers}">
				   
				    	<td><c:out value="${developer.firstName} "></c:out><c:out value="${developer.lastName}"></c:out></td>
				    	<td>
				    		<span >
				    		<c:forEach var="skill" items="${skills}">
				    			<span><c:out value="${skill} "></c:out></span> 
				    			</c:forEach>
				    		</span>
				    	</td>
				    	<td>
					    	<%-- <a href="${pageContext.request.contextPath/developer/{id}(id=${developer.id})}">view</a> --%>
				    	</td>
				 
				    </c:forEach>
				</tbody>
			</table>
			
			
          </div>
        </div>
  
        
        <div class="row">
          <div class="col-lg-6 col-md-7 col-sm-6">
            <h1>Add a developer</h1>

       <form th:action="@{/developers}" method="post" enctype="multipart/form-data" class="form-horizontal">
            	<fieldset>
            		<div class="form-group">
	                    <label class="col-lg-3 control-label">First name</label>
	                    <div class="col-lg-9">
	                    	<input type="text" class="form-control" name="firstName"/>
	                    </div>
                	</div>
            		<div class="form-group">
	                    <label class="col-lg-3 control-label">Last name</label>
	                    <div class="col-lg-9">
	                    	<input type="text" class="form-control" name="lastName"/>
	                    </div>
                	</div>
            		<div class="form-group">
	                    <label class="col-lg-3 control-label">Email</label>
	                    <div class="col-lg-9">
	                    	<input type="text" class="form-control" name="email"/>
	                    </div>
                	</div>
            		<div class="form-group">
                		<div class="col-lg-12 col-lg-offset-3">
                			<button type="submit" class="btn btn-primary" name="button">Create</button>
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