<%-- 
    Document   : customerFormUpdate
    Created on : Feb 4, 2021, 12:47:39 AM
    Author     : Leyteris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trainer Update</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>       
        
    </head>
    <body>
        <nav class="navbar navbar-expand-sm bg-primary navbar-dark">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/trainer">Trainers</a>
                </li> 
            </ul>
        </nav>
                
        <div class="container-sm">
            <h2>Update trainer</h2>
            <form method="POST" action="${pageContext.request.contextPath}/trainer/update">
                <input type="number" hidden="true"  name="id" value="${trainer.id}">
                <div class="form-group">
                    <label for="fname">First Name:</label>
                    <input type="text" required="true" class="form-control" id="fname" placeholder="Enter first name" name="fname" value="${trainer.fname}">
                </div>
                <div class="form-group">
                    <label for="lname">First Name:</label>
                    <input type="text" required="true" class="form-control" id="lname" placeholder="Enter last name" name="lname" value="${trainer.lname}">
                </div>
                <div class="form-group">
                    <label for="lname">Subject:</label>
                    <select class="form-control" name="subject.id" id="subject">
                        <option value="${trainer.subject.id}" selected="true">${trainer.subject.subject}</option>
                            <c:forEach items="${subjects}"  var = "subject">
                                <c:if test="${subject.id!=trainer.subject.id}">
                                    <option value="${subject.id}">${subject.subject}</option>
                                </c:if>
                            </c:forEach>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </body>
</html>