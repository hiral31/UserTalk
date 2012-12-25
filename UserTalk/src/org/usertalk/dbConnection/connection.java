package org.usertalk.dbConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class connection {
	public Connection connection = null;
	public PreparedStatement preparedStatement = null;
	public ResultSet resultSet=null;
	public Statement statement=null;
	public boolean found=false;
	public int  iRowCount=0; 
	public String sqlQuery = null;
	
	
		
	public connection() {
	   setConnection();	
	}
	
	public void setConnection () {
		try {
			System.out.println("bfore driver");
			
		
			
			Class.forName("com.mysql.jdbc.Driver");
			
			System.out.println("after driver");
		} catch (ClassNotFoundException e) {
				e.printStackTrace();
			return;
		}
		
			
			try {
					connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/usertalk","root","");
				
				if (connection != null)
				{
					System.out.println("MYSQL Database Connected");
				}
				else
				{
					System.out.println("MYSQL connection Failed ");
				}
			
			
			} catch (SQLException e) {
				System.out.println("MYSQL Database connection Failed");
				e.printStackTrace();
				return;
			}

		

		
	}
		public ResultSet executeQueryStmt(String sqlQuery){
			try
			{
				statement = connection.createStatement();
				resultSet= statement.executeQuery(sqlQuery);
	             
				
			}
			catch (Exception e) {
				
			}
			return resultSet;
	
		}
		
		public void executeQueryPStmt(String sqlQuery) {
			try
			{
				preparedStatement=connection.prepareStatement(sqlQuery);
				
				resultSet=preparedStatement.executeQuery();
			}
			catch (Exception e) {
				
			}
		
		
		}
		
		public void executeUpdateInsert(String sqlQuery) {
			
			try
			{
				System.out.println("Inside the executeUpdateInsert");
				connection.setAutoCommit(true);

				statement = connection.createStatement();
				System.out.println("Inside the executeUpdateInsert1");
				iRowCount = statement.executeUpdate(sqlQuery);
				System.out.println("Inside the executeUpdateInsert2");
				System.out.println("exui"+sqlQuery);
			
				connection.commit();
				
			}
			catch (Exception e) {
				}
	

		}
       
	
	

	
	
public int generateAutonumber(String tblName , String fldName) {
	
	 int nextMaxNumber = 1;
	  sqlQuery = "select MAX("+fldName+")AS "+fldName+" FROM "+tblName+"";
	  
      executeQueryStmt(sqlQuery);
      try {
		if(resultSet.next()){
			  
			  nextMaxNumber = resultSet.getInt(fldName)+ 1;
			  
			  
		  }
		
			
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
return nextMaxNumber;
	
}



public static void main(String args[])
{
	connection cnn=new connection();
}

	
		

}
