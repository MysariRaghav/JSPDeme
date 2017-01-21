<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.demo.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.demo.dao.*" %>
<%@ page import="com.demo.model.User"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page isELIgnored="false" %> 

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
  
<table id ="table-begin"class="table table-bordered table-striped table-hover table-condensed">
<tr class="danger">
	<th>Username</th>
	<th>Password</th>
	<th colspan="2">Options</th>
</tr>
<jsp:useBean id="userDao" class="com.demo.dao.UserDAO"/>
<%
	try{
		ArrayList<User> users = (ArrayList<User>)(userDao.getAllusers());
		Iterator<User> userIterator= users.iterator();
		while(userIterator.hasNext()) {
			User user=userIterator.next();
			pageContext.setAttribute("user", user); 
			//User user= userIterator.next();
%>
		<%-- <%= user.getUsername()%> --%>
			

<%--   <jsp:useBean id="user" class="com.demo.model.User" />
  <jsp:setProperty name="user" property="username" value="Raghav" />
  <jsp:setProperty name="user" property="password" value="Welcome4$"/>  --%>
<input type="hidden" id="userNAME" value="${user.username }" />
			<tr id=${user.username} class="success">
				<td id="uname">${user.username}</td>
				<td id="pname">${user.password}</td>
				<td>
					<a href="#"><img src="images/edit.png" id="edit_${user.username}"/></a>
					<%-- href="edit.jsp?id=${user.username}&uname=${user.username}&password=${user.username}" --%>
				</td>
				<td>
					<a href="delete.jsp?id=${user.username}"><img src="images/delete.png"/></a>
				</td>
			</tr>
<%	
}
%>
<form method="post" action="register.jsp">
	<tr id="new" class="success">
	
	<td><input type="text" name="username" /></td>
	<td><input type="password" name="password" /></td>
	<td colspan="2"><input type="submit" style="background: url(images/add.png); background-size: contain; background-repeat: no-repeat; width:100%" value="ADD"/></td>
	</tr>
	
</form>
<%
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
</table>
<script
  src="https://code.jquery.com/jquery-3.1.1.js"
  integrity="sha256-16cdPddA6VdVInumRGo6IbivbERE8p7CQR3HzTBuELA="
  crossorigin="anonymous"></script>
  
 <script src="js/script.js"></script>

</body>
</html>