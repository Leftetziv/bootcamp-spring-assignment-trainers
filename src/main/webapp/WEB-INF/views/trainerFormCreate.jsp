<%-- 
    Document   : customerForm
    Created on : Feb 3, 2021, 8:42:12 PM
    Author     : Leyteris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trainer Creation</title>
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
            <h2>Create trainer</h2>
            <form  method="POST" action="${pageContext.request.contextPath}/trainer/create">
                <div class="form-group">
                    <label for="fname">First Name:</label>
                    <input type="text" required="true" class="form-control" id="fname" placeholder="Enter first name" name="fname">
                </div>
                <div class="form-group">
                    <label for="lname">First Name:</label>
                    <input type="text" required="true" class="form-control" id="lname" placeholder="Enter last name" name="lname">
                </div>
                <div class="form-group">
                    <label for="lname">Subject:</label>
                    <select class="form-control" name="subject.id" id="subject">
                        <c:forEach items="${subjects}"  var = "subject">
                            <option value="${subject.id}">${subject.subject}</option>
                        </c:forEach>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </body>
</html>
