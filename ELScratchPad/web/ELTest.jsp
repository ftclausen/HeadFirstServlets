<%@ taglib prefix="mine" uri="DiceFunctions"%>
<html><body>
<%@ include file="header.jsp"%><br>

<jsp:include page="header-standard-action.jsp" >
    <jsp:param name="subTitle" value="Passed in from main JSP"/>
</jsp:include>

<br>


As dollar person.name : ${person.name} <br>
As dollar person["name"] : ${person["name"]} <br>
As dollar person[name] : ${person[name]} <br>
Some ambient music would be ${musicMap["Ambient"]}<br>
The genre is currently set to ${genres["0"]} which means we get music by ${musicMap[genres["0"]]}<br>
genres["0"] = ${genres["0"]}<br>
genres[0] = ${genres[0]}<br>
101 % 10 = ${101 % 10}<br>
param.firstname = ${param.firstname}<br>
param.lastname = ${param.lastname}<br>
paramValues.lastname[0] = ${paramValues.lastname[0]}<br>


<br>
${person["name"]}'s dog ${person.dog.name} toys are: ${person.dog.toys["0"].name}, ${person.dog.toys["1"].name} and ${person["dog"]["toys"]["2"]["name"]}
<br>


First food is ${paramValues.food[0]}<br>
Second food is ${paramValues.food[1]}<br>

Requested host is ${header.host}<br>

Request method is ${pageContext.request.method}<br>

Init (context) param magic is ${initParam.magic}<br>
<br>
<b>Roll the dice!! You got ${mine:rollIt()}</b>
<br>

<hr>

mybean = ${mybean}<br>
mybean.name = ${mybean.name}<br>
mybean["name"] = ${mybean["name"]}<br>
<%-- ERROR mybean.objects.one = ${mybean.objects.one}<br>
BECAUSE - "one" is not a list property; need to use number
--%>
mybean["params"].key1 = ${mybean["params"].key1}<br>
mybean.params["key1"] = ${mybean.params["key1"]}<br>
<%-- ERROR mybean["objects"].one = ${mybean["objects"].one}<br> 
BECAUSE - "one" is not a list property; need to use number
--%>
</body></html>
