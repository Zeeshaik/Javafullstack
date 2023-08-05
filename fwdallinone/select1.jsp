<%@ page import="java.io.*,java.sql.*"%>
<%!
String error=null;
%>
<body bgcolor="#FFFF00">
<%
error=request.getParameter("error");
if(error==null)
{
	error="";
}
if(error.equals("empty"))
{
	%>
	<h2>Please select any option</h2>
	<%
}
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from mdetails");
%>

<table border=1 cellpadding=10>
<tr><td><b>Select</b></td><td><b>Name</b></td><td><b>Year</b></td><td><b>Actor</b></td></tr>
<%
while(rs.next())
{%><form action="delete.jsp">
<tr>
<td><input type="radio" value="<%out.println(rs.getInt(1));%>" name="a"></td>
<td><%out.println(rs.getString(2));%></td>
<td><%out.println(rs.getInt(3));%></td>
<td><%out.println(rs.getString(4));%></td></tr>
<%
}
%>
<tr><td><input type="submit" value="Delete"></td></tr></form></table>
<%
	con.close();
rs.close	();
st.close();
}
catch(Exception e)
{
e.printStackTrace();
}
%>