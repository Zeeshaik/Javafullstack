<%@page import="java.sql.*,java.io.*"%>
<%!Connection con=null;
Statement st=null;
ResultSet rs=null,rs1=null;
String list=null;
%>
<body bgcolor="#FFFF00">
<%
try
{
	String n=request.getParameter("n");
	out.println("Value is:"+n);
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	st=con.createStatement();
	rs1=st.executeQuery("select name from mdetails");
	%>
	<form action="edit.jsp">
	<table>
	<%
	while(rs1.next())
	{%>
	<tr>
	<td><a href="newlist.jsp? user="<%out.println(rs1.getString(1));%>><%out.println(rs1.getString(1));%></a><input type="radio" value="<%out.println(rs1.getString(1));%>" name="n"><%out.println(rs1.getString(1));%></td>
	</tr>
<%	}
	%>
	<tr><td><input type="submit" value="get the details"></td></tr>
	</table>
	</form>
	<%
	 rs=st.executeQuery("select * from mdetails where name='"+n+"'");%>
	 
	 
<table>

	<%
		 while(rs.next())
	{
		 %>
<tr>			 <td>ID</td><TD><input type="text" value="<%out.println(rs.getInt(1));%>"></TD></tr>

			<td>Year</td><TD><input type="text" value="<%out.println(rs.getInt(3));%>"></TD></tr>
			<td>Actor</td><TD><input type="text" value="<%out.println(rs.getString(4));%>"></TD></tr>
<%	}
%>
		 </table>
		 
		 <%
	}catch(Exception e)
	{
		
			out.println("failed");
			System.out.println(e);
	}
		%>