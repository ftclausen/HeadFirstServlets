<html><body>

<jsp:useBean id="person" class="com.example.Person" scope="request" >
    <jsp:setProperty name="person" property="name" value="fred" />
</jsp:useBean>

Person's name is actually : <jsp:getProperty name="person" property="name"/>

</body></html>
