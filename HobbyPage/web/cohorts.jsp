<%@ page import="java.util.*"  %>
<%@ include file="header.html" %>

<html><body>

<%!
    public void jspInit() {
        ServletConfig sConfig = getServletConfig();
        String emailAddr = sConfig.getInitParameter("email");
        if (emailAddr != null) {
            System.out.println("DEBUG: Setting email to " + emailAddr);
        } else {
            System.out.println("DEBUG: Email not set");
            emailAddr = "none set";
        }
        ServletContext ctx = sConfig.getServletContext();
        ctx.setAttribute("mail", emailAddr);
    }
%>
        
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
