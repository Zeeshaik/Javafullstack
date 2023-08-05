<%@page import="java.sql.*,java.io.*"%>
<%!Connection con=null;%>
<body bgcolor="#FFFF00">
<%!String list=new String();%>
<%String[] movies=request.getParameterValues("movie");
out.println("selected movie list are :");
Int len=movies.Length;
for(int i=0;i<movies.length;i++)
{
	if(i==len-1)
		list=list.Concat(movies[i]);
	else
		list=list.Concat(movies[i]+",");
}
try
{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
PreparedStatement pst=con.prepareStatement("insert into movies values(?)");
pst.setString(1,list);
int j=pst.executeUpdate();
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