<%@page import="java.sql.*,java.io.*"%>
<%!Connection con=null;
Statement st=null;
ResultSet rs=null;
%>
<body bgcolor="#FFFF00">
<%
try
{
	int id=Integer.parseInt(request.getParameter("id"));
	int year=Integer.parseInt(request.getParameter("year"));
	String name=request.getParameter("name");
	String actor=request.getParameter("actor");
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	st=con.createStatement();
	 int b=st.executeUpdate("insert into mdetails values("+id+",'"+name+"',"+year+",'"+actor+"')");
if(b>0)
	{
	out.println("Successfully Inserted");
	%><br><a href="nmview.jsp">View</a><%
	}
	else
	{
		out.println("Successfully Failed");
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>