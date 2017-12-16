package Controller;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Modules.Pair;
import database_related.*;


public class LoginController extends Dao {
	
	
	public int checkUser(String userName, String password) throws ClassNotFoundException, SQLException {
		
		ArrayList<Pair> values = new ArrayList<Pair>();
		values.add(new Pair("userName", userName));
		values.add(new Pair("password", password));
		ResultSet rs = Crud.select("UserTable", values);
		int id = -1;
		while(rs.next()) {
			id = rs.getInt("id");
			System.out.println("id = "+id);
		}
		return id;
	}
}
