<%@ page import="java.util.*" %>
<html><body>

<p>The friends who share your hobby of <%= request.getParameter("hobby") %> are : </p>

<% ArrayList<String> al = (ArrayList) request.getAttribute("cohorts"); %>
<% 
if (al.size() == 0) {
    out.println("It appears nobody shares your hobby of " + 
        request.getParameter("hobby") + ".");
}

Iterator it = al.iterator();
while (it.hasNext()) {
%>
&bull;
<%= it.next() %>
<br>
<% } %>
<br><br>
</body</html>
