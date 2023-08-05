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
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	st=con.createStatement();
	rs1=st.executeQuery("select name from mdetails");
	%>
	<form action="edit.jsp">
	<table>
	<tr>
	<td>Select:</td><td><select name=n><%
	while(rs1.next())
	{%>
<option><%out.println(rs1.getString(1));%></option>
<%	}
	%>
	</select></td><td><input type="submit" value="get the details"></td></tr>
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