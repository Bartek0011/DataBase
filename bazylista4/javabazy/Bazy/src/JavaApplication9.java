import java.sql.*;



class DB {
	static Window www = new Window();
	
	public DB() {
	}

	public String[] dbConnect(String db_connect_string, String db_userid, String db_password, int x, String a, String bb, String cc, String dd, String ee, String ff) {
		String[] stri = new String[10];
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection(db_connect_string, db_userid, db_password);
			
			Statement statement = conn.createStatement();
			String queryString = "select * from Firma";
			int i=0;
			if(x==1){
				queryString = "select * from Firma";
				ResultSet rs = statement.executeQuery(queryString);
				
				while (rs.next()) {
					System.out.println(rs.getString(1));
					stri[i]=rs.getString(1);
					i++;
				}
				return stri;
			}
			if(x==2){
				queryString = "select * from Pracownik where NazwaFirmy='";
				queryString +=a;
				queryString +="'";
				ResultSet rs = statement.executeQuery(queryString);
				while (rs.next()) {
					System.out.print(rs.getString(1));
					System.out.print(" ");
					System.out.print(rs.getString(2));
					System.out.print(" ");
					System.out.print(rs.getString(3));
					System.out.print(" ");
					System.out.print(rs.getString(4));
					System.out.print(" ");
					System.out.print(rs.getString(5));
					System.out.print(" ");
					System.out.println(rs.getString(6));
				}
			}
			if(x==3){
				queryString = "select * from Dyrektor where NazwaFirmy='";
				queryString +=a;
				queryString +="'";
				ResultSet rs = statement.executeQuery(queryString);
				while (rs.next()) {
					System.out.print(rs.getString(1));
					System.out.print(" ");
					System.out.print(rs.getString(2));
					System.out.print(" ");
					System.out.print(rs.getString(3));
					System.out.print(" ");
					System.out.println(rs.getString(4));
				}
			}
			if(x==4){
				queryString = "select * from W�a�ciciel where NazwaFirmy='";
				queryString +=a;
				queryString +="'";
				ResultSet rs = statement.executeQuery(queryString);
				while (rs.next()) {
					System.out.print(rs.getString(1));
					System.out.print(" ");
					System.out.print(rs.getString(2));
					System.out.print(" ");
					System.out.println(rs.getString(3));
				}
				
			}
			if(x==5){
				queryString = "select * from Wydzia� where NazwaFirmy='";
				queryString +=a;
				queryString +="'";
				ResultSet rs = statement.executeQuery(queryString);
				while (rs.next()) {
					System.out.print(rs.getString(1));
					System.out.print(" ");
					System.out.println(rs.getString(2));
				}
				
			}
			if(x==6){
				
				queryString = "insert into Pracownik (Imi�, Nazwisko, Miasto, Ulica, telefon, NazwaFirmy) values ('";
				queryString +=a;
				queryString +="', '";
				queryString +=bb;
				queryString +="', '";
				queryString +=cc;
				queryString +="', '";
				queryString +=dd;
				queryString +="', ";
				queryString +=ee;
				queryString +=" , '";
				queryString +=ff;
				queryString +="')";
				
				statement.executeUpdate(queryString);
				
				
				
			}
			
			
			System.out.println("");
			conn.close();
			
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		return stri;
	}
};

public class JavaApplication9 {
	public static void main(String[] args) {
		DB db = new DB();
		db.dbConnect("jdbc:sqlserver://localhost:1433;databaseName=Test;selectMethod=cursor", "TestUser", "swssws", 1, "", "", "", "", "", "");
	}
}