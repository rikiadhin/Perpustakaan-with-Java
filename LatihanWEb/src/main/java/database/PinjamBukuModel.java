package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import com.mysql.cj.jdbc.result.ResultSetMetaData;

public class PinjamBukuModel {
	Connection con;
    Statement st;
    ResultSet rs; 
    ArrayList<PinjamBuku> ListPinjamBuku;

    public PinjamBukuModel() {
    	ListPinjamBuku = new ArrayList<>();
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

	public ArrayList<PinjamBuku> getAllData() {
		try {
			st= con.createStatement(); 
			String query="SELECT * FROM tb_peminjaman INNER JOIN tb_users ON tb_peminjaman.id_anggota = tb_users.id_anggota INNER JOIN tb_buku ON tb_peminjaman.id_buku = tb_buku.id_buku INNER JOIN tb_kategori ON tb_buku.id_kategori = tb_kategori.id_kategori";
			rs = st.executeQuery(query);
			ListPinjamBuku.removeAll(ListPinjamBuku);
			ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
	        int columnCount = rsmd.getColumnCount();

	        // Menampilkan nama kolom
	        for (int i = 1; i <= columnCount; i++) {
	            System.out.println("Column " + i + ": " + rsmd.getColumnName(i));
	        }
			while(rs.next()) {
				PinjamBuku pinjambuku = new PinjamBuku(); 
				pinjambuku.setIdPinjam(rs.getString(1));
				pinjambuku.setIdAnggota(rs.getString(2));
				pinjambuku.setIdBuku(rs.getString(3));
				pinjambuku.setTanggalPinjam(rs.getString(4));
				pinjambuku.setTanggalKembali(rs.getString(5)); 
				pinjambuku.setNamaDepan(rs.getString(7));
				pinjambuku.setNamaBelakang(rs.getString(8));
				pinjambuku.setKategori(rs.getString(21));
				pinjambuku.setJudul(rs.getString(15));
				ListPinjamBuku.add(pinjambuku);  
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ListPinjamBuku;
	}
	
	public void addDataPinjamBuku(String idAnggota, String idBuku, String tanggalPinjam, String tanggalKembali) {
	    try {
	        st = con.createStatement();

	        // Insert data into tb_peminjaman
	        String query = "INSERT INTO tb_peminjaman (id_anggota, id_buku, tanggal_pinjam, tanggal_kembali) VALUES ('" + idAnggota + "','" + idBuku + "','" + tanggalPinjam + "','" + tanggalKembali + "')";
	        int i = st.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);

	        if (i > 0) {
	            System.out.println("Data berhasil ditambahkan");
 
	            ResultSet rs = st.getGeneratedKeys();
	            int idPeminjaman = -1;
	            if (rs.next()) {
	                idPeminjaman = rs.getInt(1);
	            }
 
	            String query1 = "INSERT INTO tb_pengembalian (id_peminjaman, status) VALUES ('" + idPeminjaman + "', 'DI PINJAM')";
	            int j = st.executeUpdate(query1);

	            if (j > 0) {
	                System.out.println("Data pengembalian berhasil ditambahkan");
	                con.commit(); // Lakukan komit transaksi
	            } else {
	                System.out.println("Data pengembalian gagal ditambahkan");
	            }
	        } else {
	            System.out.println("Data gagal ditambahkan");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}


	
	public PinjamBuku getDataByIdPinjam(String idpinjam) {
		PinjamBuku pinjambuku = new PinjamBuku(); 
		try {
			st= con.createStatement();
			String query="SELECT * FROM tb_peminjaman INNER JOIN tb_users ON tb_peminjaman.id_anggota = tb_users.id_anggota INNER JOIN tb_buku ON tb_peminjaman.id_buku = tb_buku.id_buku INNER JOIN tb_kategori ON tb_buku.id_kategori = tb_kategori.id_kategori WHERE tb_peminjaman.id_peminjaman ='"+idpinjam+"'";
			rs = st.executeQuery(query);
			ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
	        int columnCount = rsmd.getColumnCount();

	        // Menampilkan nama kolom
	        for (int i = 1; i <= columnCount; i++) {
	            System.out.println("Column " + i + ": " + rsmd.getColumnName(i));
	        }
			while(rs.next()) { 
				pinjambuku.setIdPinjam(rs.getString(1));
				pinjambuku.setIdAnggota(rs.getString(2));
				pinjambuku.setIdBuku(rs.getString(3));
				pinjambuku.setTanggalPinjam(rs.getString(4));
				pinjambuku.setTanggalKembali(rs.getString(5)); 
				pinjambuku.setNamaDepan(rs.getString(7));
				pinjambuku.setNamaBelakang(rs.getString(8));
				pinjambuku.setKategori(rs.getString(21));
				pinjambuku.setJudul(rs.getString(15));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pinjambuku;
	}
	
	public void setReturnDatekByIdPinjam(String returndate, String idpinjam) {
		try {
			st= con.createStatement();
			String query="UPDATE tb_peminjaman SET tanggal_kembali='"+returndate+"' WHERE id_peminjaman='"+idpinjam+"'";
		    int i = st.executeUpdate(query);
		    if (i > 0) {
		    	System.out.println("Data dengan Id Peminjaman "+idpinjam+" berhasil di update");
		    } else {
		        System.out.println("Data tidak terupdate");
		    }
		} catch (SQLException e) {
			//TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
