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
    </head>
    <body>
        <h1>Create your trainer</h1>            
        <form method="POST" action="${pageContext.request.contextPath}/trainer/create">
            <table>                
                <tr>
                    <th><label for=fname">First Name:</label></th>
                    <th><input type="text" name="fname" id="fname"/></th>
                </tr> 
                <tr>
                    <th><label for="lname">Last Name:</label></th>
                        <th><input type="text" name="lname" id="lname"/></th>                </tr> 
                    <tr>
                        <th></th>
                        <th><select name="subject.id">
                            <c:forEach items="${subjects}"  var = "subject">
                                <option value="${subject.id}">${subject.subject}</option>
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
