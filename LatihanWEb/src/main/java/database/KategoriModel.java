package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class KategoriModel {
	Connection con;
    Statement st;
    ResultSet rs; 
    ArrayList<Kategori> ListKategori;

    public KategoriModel() {
    	ListKategori = new ArrayList<>();
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

	public ArrayList<Kategori> getAllData() {
		try {
			st= con.createStatement();
			String query="SELECT * FROM tb_kategori";
			rs = st.executeQuery(query);
			ListKategori.removeAll(ListKategori);
			while(rs.next()) {
				Kategori kategori = new Kategori();
				kategori.setId(rs.getString(1));
				kategori.setKategori(rs.getString(2));
				kategori.setDeskripsi(rs.getString(3));
				ListKategori.add(kategori);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ListKategori;
	}
    
    
}
