package database;

public class Buku {
	private String id_buku;
	private String id_kategori;
	private String judul; 
	private String pengarang; 
	private String penerbit; 
	private String tahun_terbit; 
	private String jumlah_halaman; 
	private String nama_kategori; 
	private String deskripsi; 
	
	public String getIdBuku() {
		return id_buku;
	}
	public void setIdBuku(String id_buku) {
		this.id_buku = id_buku;
	}
	
	public String getIdKategori() {
		return id_kategori;
	}
	public void setIdKategori(String id_kategori) {
		this.id_kategori = id_kategori;
	}
	
	public String getJudul() {
		return judul;
	}
	public void setJudul(String judul) {
		this.judul = judul;
	}
	
	public String getPengarang() {
		return pengarang;
	}
	public void setPengarang(String pengarang) {
		this.pengarang = pengarang;
	}
	
	public String getPenerbit() {
		return penerbit;
	}
	public void setPenerbit(String penerbit) {
		this.penerbit = penerbit;
	}
	
	public String getTahunTerbit() {
		return tahun_terbit;
	}
	public void setTahunTerbit(String tahun_terbit) {
		this.tahun_terbit = tahun_terbit;
	}
	
	public String getHalaman() {
		return jumlah_halaman;
	}
	public void setHalaman(String jumlah_halaman) {
		this.jumlah_halaman = jumlah_halaman;
	}
	
	public String getIdKatTbKat() {
		return id_kategori;
	}
	public void setIdKatTbKat(String id_kategori) {
		this.id_kategori = id_kategori;
	}
	
	public String getNamaKategori() {
		return nama_kategori;
	}
	public void setNamaKategori(String nama_kategori) {
		this.nama_kategori = nama_kategori;
	}
	
	public String getDeskripsi() {
		return deskripsi;
	}
	public void setDeskripsi(String deskripsi) {
		this.deskripsi = deskripsi;
	}
}
