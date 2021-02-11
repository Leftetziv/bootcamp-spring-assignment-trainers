<%-- 
    Document   : customerList
    Created on : Feb 3, 2021, 8:04:31 PM
    Author     : Leyteris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trainer</title>
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
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/trainer">Trainers</a>
                </li> 
            </ul>
        </nav>

        <div class="container">

            <div><a class="btn btn-info my-2" role="button" href="${pageContext.request.contextPath}/trainer/create">Add Trainer</a></div>

            <c:if test="${message!=null}">
                <div class="alert alert-info alert-dismissible fade show">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>${message}</strong>
                </div>
            </c:if>

            <div>
                <h1 class="text-center">Trainer List:</h1>
            </div>

            <div>
                <table class="table table-striped table-bordered" >
                    <thead class="thead-light"> 
                        <tr>
                            <th>Id</th>
                            <th>First Name</th>
                            <th>Last Name</th>              
                            <th>Subject</th>              
                            <th>Delete</th>   
                            <th>Update</th>   
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listOfTrainers}"  var = "trainer">
                            <tr>
                                <td>${trainer.id}</td>
                                <td>${trainer.fname}</td>
                                <td>${trainer.lname}</td>
                                <td>${trainer.subject.subject}</td>
                                <td><a href="${pageContext.request.contextPath}/trainer/delete/${trainer.id}">Delete</a></td>
                                <td><a href="${pageContext.request.contextPath}/trainer/update/${trainer.id}">Update</a></td>
                            </tr>                        
                        </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>

    </body>
</html>
