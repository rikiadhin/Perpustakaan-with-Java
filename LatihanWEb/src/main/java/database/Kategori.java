package database;

public class Kategori {
	private String id_kategori;
	private String kategori;
	private String deskripsi; 
	
	public String getId() {
		return id_kategori;
	}
	public void setId(String id_kategori) {
		this.id_kategori = id_kategori;
	}
	
	public String getKategori() {
		return kategori;
	}
	public void setKategori(String kategori) {
		this.kategori = kategori;
	}
	
	public String getDeskripsi() {
		return deskripsi;
	}
	public void setDeskripsi(String deskripsi) {
		this.deskripsi = deskripsi;
	}
}
