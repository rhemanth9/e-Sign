package calpers.spring.model;

import com.mysql.jdbc.Blob;

public class Image {
	private String email;
	private byte[] image;
	private String base64Image;
	private String message;
	private String preferName;


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
	public String getBase64Image() {
		return base64Image;
	}
	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getPreferName() {
		return preferName;
	}
	public void setPreferName(String preferName) {
		this.preferName = preferName;
	}


}
