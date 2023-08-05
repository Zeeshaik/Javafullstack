<%@page import="java.sql.*,java.io.*"%>
<%!Connection con=null;
String list=new String();%>
<body bgcolor="#FFFF00">
<%
int id=Integer.parseInt(request.getParameter("id"));
String[] movies=request.getParameterValues("movie");
out.println("selected movie list are :");
int len=movies.length;
for(int i=0;i<movies.length;i++)
{
	if(i==len-1)
		list=list.concat(movies[i]);
	else
		list=list.concat(movies[i]+",");
}
try
{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
PreparedStatement pst=con.prepareStatement("insert into movies values(?,?)");
pst.setInt(1,id);
pst.setString(2,list);
int j=pst.executeUpdate();
System.out.println("get it");
if(j>0)
	{
	out.println("success");
	}
	}catch(Exception e)
	{
		
			out.println("failed");
			System.out.println(e);
	}
	%>