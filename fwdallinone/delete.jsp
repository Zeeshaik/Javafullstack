<%@ page import="java.io.*,java.sql.*"%>
<%
String a=request.getParameter("a");
String b=request.getParameter("b");
String c=request.getParameter("c");
String d=request.getParameter("d");
%>
<body bgcolor="#FFFF00">
<%
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
Statement st1=con.createStatement();
int v=st1.executeUpdate("delete from mdetails where id='"+a+"");
if(v>0)
{
	out.println("Deleted Successfully");
}
Statement st2=con.createStatement();
ResultSet rs2=st2.executeQuery("select * from mdetails where id="+a+"");
%><table>
<%
if(rs2.next())
	{
	%>
	<tr><td>ID</td><td><%out.println(rs2.getInt(1));%></td></tr>
	<tr><td>Name</td><td><%out.println(rs2.getString(2));%></td></tr>
	<tr><td>Year</td><td><%out.println(rs2.getInt(3));%></td></tr>
	<tr><td>Actor</td><td><%out.println(rs2.getString(4));%></td></tr>
	<%
	}
	else
	{
		out.println("No Data Found");
	}
	%>
	</table><br><br><br>
	<a href="start.html">Go To Home Page</a>
	<%
}
catch(Exception e)
{
	e.printStackTrace();
}
%>