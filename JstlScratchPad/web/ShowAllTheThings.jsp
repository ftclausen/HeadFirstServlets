<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<html>
<body>
<h1> Welcome to JSTL Scratch pad dude! </h1>
<h3> These random things really tie the room together </h3>
Today's Tip : <c:out value='${tip}' escapeXml='true' default='No tip received!'/> <br>
Movie List! 
<table>
    <c:forEach var="movie" items="${movies}" varStatus="iteratorCount" >
        <tr>
            <td><b>${iteratorCount["count"]})</b> ${movie}</td>
        </tr>
    </c:forEach>
</table>

<p>you chose food ${food}</p>

<c:choose>
    <c:when test="${food == 'carrot'}">
        <h3>Carrots are healthy!</h3>
    </c:when>
    <c:otherwise>
        <h3>Don't eat too much of ${food}!!</h3>
    </c:otherwise>
</c:choose>

</body>
</html>

