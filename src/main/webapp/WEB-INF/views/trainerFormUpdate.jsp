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
    </head>
    <body>
        <h1>Update trainer</h1>
        <form method="POST" action="${pageContext.request.contextPath}/trainer/update">
            <input type="number" hidden="true" name="id" value="${trainer.id}"/>
            <table>                
                <tr>
                    <th><label for=fname">First Name:</label></th>
                    <th><input type="text" name="fname" id="fname" value="${trainer.fname}"/></th>
                </tr> 
                <tr>
                    <th><label for="lname">Last Name:</label></th>
                    <th><input type="text" name="lname" id="lname" value="${trainer.lname}"/></th>                
                </tr> 
                <tr>
                    <th></th>
                    <th><select name="subject.id">
                            <option value="${trainer.subject.id}" selected="true">${trainer.subject.subject}</option>F
                            <c:forEach items="${subjects}"  var = "subject">
                                <c:if test="${subject.id!=trainer.subject.id}">
                                    <option value="${subject.id}">${subject.subject}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </th>
                </tr> 
                <tr>
                    <th colspan="2"><input type="submit" value="Submit trainer"></th>
                </tr> 
            </table>
        </form>        
    </body>
</html>