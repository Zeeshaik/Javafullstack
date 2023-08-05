import java.sql.*;
class Predemo
	{
public static void main(String[] args)
	{
	String name=args[1];
	String password=args[2];
			try{
	Class.forName("com.mysql.jdbc.Driver");
   System.out.println("Driver loaded");
  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
  System.out.println("connection established");
  PreparedStatement pst=con.prepareStatement("insert into profile values(?,?)");
  
  pst.setString(1,"name");
  pst.setString(2,"password");
  int i=pst.executeUpdate();
  PreparedStatement pst1=con.prepareStatement("update profile set name=? where password=?");
  pst1.setString(1,name);
  pst1.setString(2,password);
  int j=pst1.executeUpdate();
/*  PreparedStatement pst2=con.prepareStatement("delete from jobsmill where id=?");
  pst2.setInt(1,id);
  int k=pst2.executeUpdate();*/
  if(i>0 && j>0)
	  System.out.println("successfully registered");
	}catch(Exception e)
{
  e.printStackTrace();
}
}
}