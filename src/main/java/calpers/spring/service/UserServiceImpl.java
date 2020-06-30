package calpers.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import calpers.spring.DAO.UserDAO;
import calpers.spring.model.Image;
import calpers.spring.model.Login;
import calpers.spring.model.PasswordResetToken;
import calpers.spring.model.User;

public class UserServiceImpl implements UserService {
	@Autowired
	  public UserDAO userDao;
	public int register(User user) {
		// TODO Auto-generated method stub
		return userDao.registerUser(user);
	}

	public User validateUser(Login login) {
		// TODO Auto-generated method stub
		return userDao.validateUser(login);
	}
	
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return userDao.updateUserDetails(user);
	}

	public int insertImage(String email,MultipartFile photo) {
		// TODO Auto-generated method stub
		return userDao.insertImage(email,photo);
	}

	public Image validateEsign(String email) {
		// TODO Auto-generated method stub
		return userDao.validateEsign(email);
	}

	public int insertDrawImage(String email, byte[] photoBytes) {
		// TODO Auto-generated method stub
		return userDao.insertDrawImage(email,photoBytes);
	}

	public User validateUser1(Login loginCredentials) {
		// TODO Auto-generated method stub
		return userDao.validateUser1(loginCredentials);
	}

	public User findUserByEmail(String email) {
		// TODO Auto-generated method stub
		return userDao.findUserByEmail(email);
	}

	/*public void createPasswordResetTokenForUser(String email, String token) {
		// TODO Auto-generated method stub
		userDao.createPasswordResetTokenForUser(email,token);
		
	}*/

	public PasswordResetToken validatePasswordResetToken(String token) {
		// TODO Auto-generated method stub
		return userDao.validatePasswordResetToken(token);
	}

	public int insertToken(String email, String randomtoken) {
		// TODO Auto-generated method stub
		return userDao.insertToken(email,randomtoken);
	}

	public int updatePassword(String email, String password) {
		// TODO Auto-generated method stub
		return userDao.updatePassword(email,password);
	}

	public int deactivateToken(String email, String token) {
		// TODO Auto-generated method stub
		return userDao.deactivateToken(email,token);
	}
	
}
