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
  
   out.println("<br>"); 
   out.println("DEBUG: Remote port is : " + request.getRemotePort());
   out.println("<br>"); 
   out.println("DEBUG: User agent is : " + request.getHeader("User-Agent"));
   out.println("<br>"); 
   out.println("DEBUG: Local port is : " + request.getLocalPort());
   response.setHeader("Fred", "is-awesome");
%>

</body>
</html>

