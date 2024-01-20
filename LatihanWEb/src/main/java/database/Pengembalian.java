package database;

public class Pengembalian {
	private String id_pengembalian;
	private String id_peminjaman;
	private String tanggal_dikembalikan; 
	private String kondisi;
	private String denda;
	private String status;
	private String id_anggota;
	private String nama_depan;
	private String nama_belakang;
	private String id_buku;
	private String judul;
	private String kategori;
	private String tanggal_kembali;
	
	public String getIdPengembalian() {
		return id_pengembalian;
	}
	public void setIdPengembalian(String id_pengembalian) {
		this.id_pengembalian = id_pengembalian;
	}
	
	public String getIdPeminjaman() {
		return id_peminjaman;
	}
	public void setIdPeminjaman(String id_peminjaman) {
		this.id_peminjaman = id_peminjaman;
	}
	
	public String getTglDikembalikan() {
		return tanggal_dikembalikan;
	}
	public void setTglDikembalikan(String tanggal_dikembalikan) {
		this.tanggal_dikembalikan = tanggal_dikembalikan;
	}
	
	public String getKondisi() {
		return kondisi;
	}
	public void setKondisi(String kondisi) {
		this.kondisi = kondisi;
	}
	
	public String getDenda() {
		return denda;
	}
	public void setDenda(String denda) {
		this.denda = denda;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getIdAnggota() {
		return id_anggota;
	}
	public void setIdAnggota(String id_anggota) {
		this.id_anggota = id_anggota;
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
	
	public String getIdBuku() {
		return id_buku;
	}
	public void setIdBuku(String id_buku) {
		this.id_buku = id_buku;
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
	
	public String getTanggalKembali() {
		return tanggal_kembali;
	}
	public void setTanggalKembali(String tanggal_kembali) {
		this.tanggal_kembali = tanggal_kembali;
	}
}
