package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SiswaModel {
    Connection con;
    Statement st;
    ResultSet rs;
    Siswa siswa;

    public SiswaModel() {
    	siswa = new Siswa();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/perpus?user=root&password=";
            con = DriverManager.getConnection(url);
        } catch (ClassNotFoundException e) {
            // Penanganan eksepsi untuk kelas tidak ditemukan
            e.printStackTrace();
        } catch (SQLException e) {
            // Penanganan eksepsi untuk SQL
            e.printStackTrace();
        }
    }

    public Siswa getDataByEmail(String email) {
        try {
            if (con != null) {
                st = con.createStatement();
                String query = "SELECT * FROM tb_users WHERE email='" + email + "'";
                rs = st.executeQuery(query);
                while (rs.next()) {
                	siswa.setId(rs.getString(1));
                	siswa.setNamaDepan(rs.getString(2));
                	siswa.setNamaBelakang(rs.getString(3));
                	siswa.setEmail(rs.getString(4));
                	siswa.setTelepon(rs.getString(5));
                	siswa.setPassword(rs.getString(6));
                	siswa.setAlamat(rs.getString(7));
                	siswa.setRole(rs.getString(8));
                }
            } else {
                System.out.println("Connection is null. Unable to create statement.");
            }
        } catch (SQLException e) {
            // Penanganan eksepsi untuk SQL
            e.printStackTrace();
        }  
        return siswa;
    }
    
}
