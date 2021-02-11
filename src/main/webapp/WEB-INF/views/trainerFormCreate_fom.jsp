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
        <form:form modelAttribute="trainer" method="POST" action="${pageContext.request.contextPath}/trainer/create">
            <form:hidden path="id"/>
            <table>                
                <tr>
                    <th><form:label path="fname">First Name:</form:label></th>
                    <th><form:input path="fname"/></th>
                </tr> 
                <tr>
                    <th><form:label path="lname">Last Name:</form:label></th>
                    <th><form:input path="lname"/></th>
                </tr> 
                <tr>
                    <th></th>
                    <th><form:select path="subject.id">
                            <c:forEach items="${subjects}"  var = "subject">
                                <form:option value="${subject.id}">${subject.subject}</form:option>
                            </c:forEach>
                        </form:select>
                    </th>
                </tr> 
                <tr>
                    <th colspan="2"><input type="submit" value="Submit trainer"></th>
                </tr> 
            </table>
        </form:form>
    </body>
</html>
