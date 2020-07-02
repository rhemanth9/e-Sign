package calpers.spring.DAO;

import org.springframework.web.multipart.MultipartFile;

import calpers.spring.model.Image;
import calpers.spring.model.Login;
import calpers.spring.model.PasswordResetToken;
import calpers.spring.model.User;

public interface UserDAO {

	public int registerUser(User user);
	public User findUserByEmail(String email);
	public User validateUser(Login loginCredentials);
	public User validateUser1(Login loginCredentials);
	public int updateUserDetails(User user);
	public int insertImage(String email,MultipartFile photo,String prefername);
	public Image validateEsign(String email);
	int insertDrawImage(String email,byte[] photoBytes,String prefername);
	//public void createPasswordResetTokenForUser(String email, String token);
	public int insertToken(String email, String randomtoken);
	public PasswordResetToken validatePasswordResetToken(String token);
	public int updatePassword(String email, String password);
	public int deactivateToken(String email, String token);
	
}
