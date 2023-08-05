<%@page import="java.sql.*,java.io.*"%>
<%!Connection con=null;
Statement st=null;
ResultSet rs=null;
String list=null;
%>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	st=con.createStatement();
	 rs=st.executeQuery("select name from mdetails");
	 %><form action="edit.jsp"><table>
		 <tr>
		 <td>
		<select name=n>
	<%
	while(rs.next())
	{
	%><option><%out.println(rs.getString(1));%></option>	<%	}
	%>	</select>
<INPUT TYPE="submit"value="submit" >

		</td>
			</tr>
		 </table>
		 
		 </form>
		 <%
	}catch(Exception e)
	{
		
			out.println("failed");
			System.out.println(e);
	}
		%>
