package database;

public class PinjamBuku {

	private String id_peminjaman;
	private String id_anggota;
	private String id_buku; 
	private String tanggalPinjam; 
	private String tanggalKembali; 
	private String nama_depan;
	private String nama_belakang;
	private String judul;
	private String kategori;
	
	public String getIdPinjam() {
		return id_peminjaman;
	}
	public void setIdPinjam(String id_peminjaman) {
		this.id_peminjaman = id_peminjaman;
	}
	
	public String getIdAnggota() {
		return id_anggota;
	}
	public void setIdAnggota(String id_anggota) {
		this.id_anggota = id_anggota;
	}
	
	public String getIdBuku() {
		return id_buku;
	}
	public void setIdBuku(String id_buku) {
		this.id_buku = id_buku;
	}
	
	public String getTanggalPinjam() {
		return tanggalPinjam;
	}
	public void setTanggalPinjam(String tanggalPinjam) {
		this.tanggalPinjam = tanggalPinjam;
	}
	
	public String getTanggalKembali() {
		return tanggalKembali;
	}
	public void setTanggalKembali(String tanggalKembali) {
		this.tanggalKembali = tanggalKembali;
	}
	
	public String getNamaDepan() {
		return nama_depan;
	}
	public void setNamaDepan(String nama_depan) {
		this.nama_depan = nama_depan;
	}
	
	public String getNamaBelakang() {
		return nama_belakang;
	}
	public void setNamaBelakang(String nama_belakang) {
		this.nama_belakang = nama_belakang;
	}
	
	public String getJudul() {
		return judul;
	}
	public void setJudul(String judul) {
		this.judul = judul;
	}
	
	public String getKategori() {
		return kategori;
	}
	public void setKategori(String kategori) {
		this.kategori = kategori;
	}
}
