package database;

public class Siswa {
	private String id_anggota;
	private String email;
	private String password;
	private String nama_depan;
	private String nama_belakang;
	private String alamat;
	private String nomortelepon;
	private String role;
	
	public String getId() {
		return id_anggota;
	}
	public void setId(String id_anggota) {
		this.id_anggota = id_anggota;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	
	public String getAlamat() {
		return alamat;
	}
	public void setAlamat(String alamat) {
		this.alamat = alamat;
	}
	
	public String getTelepon() {
		return nomortelepon;
	}
	public void setTelepon(String nomortelepon) {
		this.nomortelepon = nomortelepon;
	}
	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
}
