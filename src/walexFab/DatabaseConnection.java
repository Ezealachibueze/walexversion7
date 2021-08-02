package walexFab;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {

	public Connection getConnection() {
    
		
	Connection con = null;
    String  url= "jdbc:postgresql://localhost:5432/walexfab_walex01";
    String username="postgres";
	String password="xavier3456";
		
	try {
	Class.forName("org.postgresql.Driver");
	con=DriverManager.getConnection(url,username,password);
	
	}catch(Exception e) {
	System.out.println(e); 
	}
	return con;
	}
	


}
