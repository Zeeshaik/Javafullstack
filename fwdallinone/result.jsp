<%@ page import="java.io.*,java.sql.*"%>
<%!
String error;
String a;
%>
<body bgcolor="#FFFF00">
<%
a=request.getParameter("a");
if(a==null)
{
	%>
	<jsp:forward page="select.jsp">
	<jsp:param name="error" value="empty"/>
	</jsp:forward>
	<%
}
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
Statement st1=con.createStatement();
ResultSet rs1=st1.executeQuery("select * from mdetails where id="+a+"");
%>
<form action="update.jsp">
<table>
<%
while(rs1.next())
	{
	%><tr><td><h3>ID</h3></td><td><h3><input type="text"  name="a" value="<%out.println(rs1.getInt(1));%>" readonly></h3></td></tr>
	<tr><td><h3>Name</h3></td><td><h3><input type="text"  name="b" value="<%out.println(rs1.getString(2));%>"></h3></td></tr>
	<tr><td><h3>Year</h3></td><td><h3><input type="text"  name="c" value="<%	out.println(rs1.getInt(3));%>"></h3></td></tr>

<tr><td><h3>Actor</h3></td><td><h3><input type="text"  name="d" value="<%	out.println(rs1.getString(4));%>"></h3></td></tr>
<tr><td><input type="submit" value="Update"></td></tr><%
	}
%></table></form><%
}
%><%
catch(Exception e)
{
	e.printStackTrace();
}
%>