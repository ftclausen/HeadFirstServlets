<%@ taglib prefix="mine" uri="DiceFunctions"%>

<html><body>

As dollar person.name : ${person.name} <br>
As person.name with square brackets : ${person["name"]} <br>
Some ambient music would be ${musicMap["Ambient"]}<br>
The genre is currently set to ${genres["0"]} which means we get music by ${musicMap[genres["0"]]}<br>

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
</body></html>
