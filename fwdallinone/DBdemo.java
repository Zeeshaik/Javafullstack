import java.sql.*;
import java.io.*;
class DBdemo
	{
public static void main(String[] args)
	{
try{
Class.forName("com.mysql.jdbc.Driver");
System.out.println("Driver loaded");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
System.out.println("connection established");
Statement st=con.createStatement();
boolean b=st.execute("create table profile(name varchar(20),password varchar(20))");
if(!b)
	System.out.println("Table created");
st.close();
con.close();
}
catch(Exception e)
{
  e.printStackTrace();
}
}
	}