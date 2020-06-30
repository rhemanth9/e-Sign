package calpers.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import calpers.spring.model.Image;
import calpers.spring.model.Login;
import calpers.spring.model.PasswordResetToken;
import calpers.spring.model.User;

public interface UserService {
	 int register(User user);
	 User validateUser1(Login loginCredentials);
	  User validateUser(Login login);
	  int updateUser(User user);
	  int insertImage(String email,MultipartFile photo);
	  int insertDrawImage(String email,byte[] photoBytes);
	  Image validateEsign(String email);
	  User findUserByEmail(String email);
	//void createPasswordResetTokenForUser(String email, String token);
	  PasswordResetToken validatePasswordResetToken(String token);
	int insertToken(String email, String randomtoken);
	int updatePassword(String email, String password);
	int deactivateToken(String email, String token);
	  
	  
}
