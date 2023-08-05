<%@page import="java.sql.*,java.io.*"%>
<%!Connection con=null;
Statement st=null;
ResultSet rs=null;
String list=null;
%>
<%
try
{
	int id=Integer.parseInt(request.getParameter("id"));
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	st=con.createStatement();
	 rs=st.executeQuery("select list from movies where id="+id+"");
	if(rs.next())
		 list=rs.getString(1);
	String split1[]=list.split(",");
%><form action="nmview.jsp"><table>
		 <tr>
		 <td>
		<select name=n>
		<%
		for(int i=0;i<split1.length;i++)
			{
		%>
		 
		<option><%=split1[i]%></option>
		
			
				 
		<%

	}%>

</select>
<INPUT TYPE="submit"value="submit">
		</td>
			</tr>
		 </table></form><%
	}catch(Exception e)
	{
		
			out.println("failed");
			System.out.println(e);
	}
		%>
