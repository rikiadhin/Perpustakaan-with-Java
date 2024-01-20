package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import com.mysql.cj.jdbc.result.ResultSetMetaData;
 
public class BukuModel {
	Connection con;
    Statement st;
    ResultSet rs; 
    ArrayList<Buku> ListBuku;
    ArrayList<Kategori> ListKategori;

    public BukuModel() {
    	ListBuku = new ArrayList<>();
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

	public ArrayList<Buku> getAllData() {
		try {
			st= con.createStatement();  
			String query="SELECT * FROM tb_buku INNER JOIN tb_kategori ON tb_buku.id_kategori = tb_kategori.id_kategori"; 
			rs = st.executeQuery(query); 
			ListBuku.removeAll(ListBuku);
//			ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
//	        int columnCount = rsmd.getColumnCount();
//
//	        // Menampilkan nama kolom
//	        for (int i = 1; i <= columnCount; i++) {
//	            System.out.println("Column " + i + ": " + rsmd.getColumnName(i));
//	        }
			while(rs.next()) {
				Buku buku = new Buku();
				buku.setIdBuku(rs.getString(1));
				buku.setIdKategori(rs.getString(2));
				buku.setJudul(rs.getString(3));
				buku.setPengarang(rs.getString(4));
				buku.setPenerbit(rs.getString(5));
				buku.setTahunTerbit(rs.getString(6));
				buku.setHalaman(rs.getString(7));
				buku.setIdKatTbKat(rs.getString(8));
				buku.setNamaKategori(rs.getString(9));
				buku.setDeskripsi(rs.getString(10));
				ListBuku.add(buku); 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ListBuku;
	}
	
	public Buku getDataByIdBuku(String idbuku) {
		Buku buku = new Buku();
		try {
			st= con.createStatement();
			String query="SELECT * FROM tb_buku INNER JOIN tb_kategori ON tb_buku.id_kategori = tb_kategori.id_kategori WHERE tb_buku.id_buku='"+idbuku+"'";
			rs = st.executeQuery(query);
			ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
	        int columnCount = rsmd.getColumnCount();

	        // Menampilkan nama kolom
	        for (int i = 1; i <= columnCount; i++) {
	            System.out.println("Column " + i + ": " + rsmd.getColumnName(i));
	        }
			while(rs.next()) { 
				buku.setIdBuku(rs.getString(1));
				buku.setIdKategori(rs.getString(2));
				buku.setJudul(rs.getString(3));
				buku.setPengarang(rs.getString(4));
				buku.setPenerbit(rs.getString(5));
				buku.setTahunTerbit(rs.getString(6));
				buku.setHalaman(rs.getString(7));
				buku.setIdKatTbKat(rs.getString(8));
				buku.setNamaKategori(rs.getString(9));
				buku.setDeskripsi(rs.getString(10));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return buku;
	}
	
	
	public void deleteDataByIdBuku(String idBuku) {
	    try {
	        st = con.createStatement();
	        String query = "DELETE FROM tb_buku WHERE id_buku='" + idBuku + "'";
	        int i = st.executeUpdate(query);
	        if (i > 0) {
	            System.out.println("ROW DELETED");
	        } else {
	            System.out.println("ROW NOT FOUND");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	public void addDataBuku(String idkategori,String judul, String pengarang, String penerbit, String tahunterbit, String jumlahhalaman) {
		try {
			st= con.createStatement();
			String query="INSERT INTO tb_buku (id_kategori, judul, pengarang, penerbit, tahun_terbit, jumlah_halaman) VALUES ('"+idkategori+"','"+judul+"','"+pengarang+"', '"+penerbit+"','"+tahunterbit+"','"+jumlahhalaman+"')";
		    int i = st.executeUpdate(query);
		    if (i > 0) {
		        System.out.println("Data berhasil ditambahkan");
		    } else {
		        System.out.println("Data gagal ditambahkan");
		    }
		} catch (SQLException e) {
			//TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
    
    
}
