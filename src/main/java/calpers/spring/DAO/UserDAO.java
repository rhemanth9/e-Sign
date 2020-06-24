package calpers.spring.DAO;

import org.springframework.web.multipart.MultipartFile;

import calpers.spring.model.Image;
import calpers.spring.model.Login;
import calpers.spring.model.User;

public interface UserDAO {

	public int registerUser(User user);
	public void findUserByEmail(Login loginCredentials);
	public User validateUser(Login loginCredentials);
	public int updateUserDetails(User user);
	public int insertImage(String email,MultipartFile photo);
	public Image validateEsign(String email);
}
