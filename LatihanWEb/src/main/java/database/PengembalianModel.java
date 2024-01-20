package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.cj.jdbc.result.ResultSetMetaData;

public class PengembalianModel {
	Connection con;
    Statement st;
    ResultSet rs; 
    ArrayList<Pengembalian> ListPengembalian;

    public PengembalianModel() {
    	ListPengembalian = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/perpus?user=root&password=";
            con = DriverManager.getConnection(url);
        } catch (ClassNotFoundException e) { 
            e.printStackTrace();
        } catch (SQLException e) { 
            e.printStackTrace();
        }
    }
    
	public ArrayList<Pengembalian> getAllData() {
		try {
			st= con.createStatement(); 
			String query="SELECT * FROM tb_pengembalian";
			rs = st.executeQuery(query);
			ListPengembalian.removeAll(ListPengembalian);
			ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
	        int columnCount = rsmd.getColumnCount();

	        // Menampilkan nama kolom
	        for (int i = 1; i <= columnCount; i++) {
	            System.out.println("Column " + i + ": " + rsmd.getColumnName(i));
	        }
			while(rs.next()) {
				Pengembalian pengembalian = new Pengembalian(); 
				pengembalian.setIdPengembalian(rs.getString(1));
				pengembalian.setIdPeminjaman(rs.getString(2));
				pengembalian.setTglDikembalikan(rs.getString(3));
				pengembalian.setKondisi(rs.getString(4));
				pengembalian.setDenda(rs.getString(5)); 
				pengembalian.setStatus(rs.getString(6)); 
				ListPengembalian.add(pengembalian);  
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ListPengembalian;
	}
	
	public Pengembalian getDataByIdKembali(String idkembali) {
		Pengembalian pengembalian = new Pengembalian(); 
		try {
			st= con.createStatement();
			String query="SELECT * FROM tb_pengembalian INNER JOIN tb_peminjaman ON tb_peminjaman.id_peminjaman= tb_pengembalian.id_peminjaman INNER JOIN tb_users ON tb_peminjaman.id_anggota = tb_users.id_anggota INNER JOIN tb_buku ON tb_peminjaman.id_buku = tb_buku.id_buku INNER JOIN tb_kategori ON tb_buku.id_kategori = tb_kategori.id_kategori WHERE id_pengembalian='"+idkembali+"'";
			rs = st.executeQuery(query); 
			ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
	        int columnCount = rsmd.getColumnCount();

	        // Menampilkan nama kolom
	        for (int i = 1; i <= columnCount; i++) {
	            System.out.println("Column " + i + ": " + rsmd.getColumnName(i));
	        }
			while(rs.next()) { 
				pengembalian.setIdPengembalian(rs.getString(1));
				pengembalian.setIdPeminjaman(rs.getString(2));
				pengembalian.setTglDikembalikan(rs.getString(3));
				pengembalian.setKondisi(rs.getString(4)); 
				pengembalian.setDenda(rs.getString(5)); 
				pengembalian.setStatus(rs.getString(6)); 
				pengembalian.setIdAnggota(rs.getString(8)); 
				pengembalian.setTanggalKembali(rs.getString(11)); 
				pengembalian.setNamaDepan(rs.getString(13)); 
				pengembalian.setNamaBelakang(rs.getString(14)); 
				pengembalian.setIdBuku(rs.getString(19)); 
				pengembalian.setJudul(rs.getString(21)); 
				pengembalian.setKategori(rs.getString(27)); 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pengembalian;
	}
	
	public void setDataByIdPengembalian(String idkembali, String idpinjam, String timestamp, String kondisi, String denda) {
		try {
			st= con.createStatement();
			String query="UPDATE tb_pengembalian SET tanggal_dikembalikan='"+timestamp+"', kondisi='"+kondisi+"', denda='"+denda+"', status='DI KEMBALIKAN' WHERE id_pengembalian='"+idkembali+"'";
			
			int i = st.executeUpdate(query); 
		    if (i > 0 ) {
		    	System.out.println("Data dengan Id Peminjaman "+idkembali+" berhasil di update");
		    } else {
		        System.out.println("Data tidak terupdate");
		    }
		} catch (SQLException e) {
			//TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
