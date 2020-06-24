package calpers.spring.model;

import com.mysql.jdbc.Blob;

public class Image {
	private String email;
	private byte[] image;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email= email;
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	
	
}
