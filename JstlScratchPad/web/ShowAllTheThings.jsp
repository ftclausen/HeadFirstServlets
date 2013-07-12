<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<html>
<body>
<h1> Welcome to JSTL Scratch pad dude! </h1>
<h3> These random things really tie the room together </h3>
Today's Tip : <c:out value='${tip}' escapeXml='true'/> <br>
</body>
</html>

