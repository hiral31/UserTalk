<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
	System.out.println("in first");
String uname=(String)request.getAttribute("uname");
String flag=(String)request.getAttribute("flag");

if(flag.equals("True"))
{
%>
Welcome <%=uname %>
<br>
You have logged in successfully...!!!
<%}
else if(flag.equals("False"))
{
%>
Sorry, UserName or Password may wrong..!!
<%} %>


</body>
</html>