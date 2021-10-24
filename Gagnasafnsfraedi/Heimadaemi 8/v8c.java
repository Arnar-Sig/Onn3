// SQLite s�niforrit sta�f�rt af Snorra Agnarssyni 2012
// Upphaflega fengi� fr� SQLite vefs��unni.
//
// Forriti� m� ���a og keyra svona � Windows:
//   javac Sample.java
//   java -cp .;sqlite-jdbc-....jar Sample
// � Unix:
//   javac Sample.java
//   java -cp .:sqlite-jdbc-....jar Sample

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class v8c
{
  public static void main(String[] args) throws ClassNotFoundException
  {
    // load the sqlite-JDBC driver using the current class loader
    Class.forName("org.sqlite.JDBC");
    
    Connection connection = null;
    try
    {
      // create a database connection
      connection = DriverManager.getConnection("jdbc:sqlite:company.db");
      Statement statement = connection.createStatement();
      //statement.setQueryTimeout(30);  // set timeout to 30 sec.
      
      //statement.executeUpdate("drop table if exists person");
      //statement.executeUpdate("create table person (id integer, name string)");
      //statement.executeUpdate("insert into person values(1, 'leo')");
      //statement.executeUpdate("insert into person values(2, 'yui')");
      statement.executeUpdate("update employee set salary = salary + 100");
      ResultSet rs = statement.executeQuery("select Fname, salary from employee;");
      while(rs.next())
      {
        // read the result set
        System.out.println("name, salary = " + rs.getString("Fname")+ " " + rs.getString("salary"));
        //System.out.println("id = " + rs.getInt("id"));
      }
      rs.close();
    }
    catch(SQLException e)
    {
      // if the error message is "out of memory", 
      // it probably means no database file is found
      System.err.println(e.getMessage());
    }
    finally
    {
      try
      {
        if(connection != null)
          connection.close();
      }
      catch(SQLException e)
      {
        // connection close failed.
        System.err.println(e);
      }
    }
  }
}

