<%@ page import="java.util.*" %>

<html>
<body>
<h1 align="center">Beer Recommendations (result.jsp)</h1>
<p>

<%
   List<String> brands = (List)request.getAttribute("brands");

   for (String s: brands) {
      out.println("* " + s + "<br>");
   }
%>

</body>
</html>

