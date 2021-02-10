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
        <style>
            table, td, th {
                border: 1px solid black;
                padding: 3px;
            }

            table {              
                border-collapse: collapse;
            }
            
            table a{
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        
        <div><a href="${pageContext.request.contextPath}/">Home</a></div>
        <div><a href="${pageContext.request.contextPath}/trainer/create">Add Trainer</a></div>

        <div><h3>${message}</h3></div>

        <h1>Trainer List:</h1>
        <div>
            <table>
                <thead>
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
    </body>
</html>
