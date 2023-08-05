<%@page import="java.sql.*,java.io.*"%>
<body bgcolor="#FFFF00">
<%!Connection con=null;
Statement st=null;
ResultSet rs=null;
String n=null;
%>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	st=con.createStatement();
	rs=st.executeQuery("select name from mdetails");

	%>
	<form action="anil.jsp">
	<table>
	<%
	while(rs.next())
	{%>
	<tr>
	<td><input type="radio" value="<%out.println(rs.getString(1));%>" name="n"><%out.println(rs.getString(1));%></td>
	</tr>
<%	}
	%>
	<tr><td><input type="submit" value="get the details"></td></tr>
	</table>
	</form><%
	}catch(Exception e)
	{
		
			out.println("failed");
			System.out.println(e);
	}
		%>