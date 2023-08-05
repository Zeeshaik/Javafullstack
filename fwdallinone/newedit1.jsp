<%@page import="java.sql.*,java.io.*"%>
<body bgcolor="#FFFF00">
<%
String n=request.getParameter("n");
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	System.out.println("11111111111111");
	Statement st=con.createStatement();
	ResultSet rs4=st.executeQuery("select * from mdetails where name='"+n+"'");
	while(rs4.next())
	{
		out.println(rs4.getString(4));
	}
}
	catch(Exception e)
	{
		
			out.println("failed");
			System.out.println(e);
	}
		%>