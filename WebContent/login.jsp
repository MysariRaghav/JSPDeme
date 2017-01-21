<head>
<%!
	String str="good morning to you. Now Working";	

%>
</head>
<body>
<h3>This is my JSP, <%= str.toUpperCase() %></h3>

<%
	String str="hi";
	out.println("Hello! " + str);
	
%>
</body>