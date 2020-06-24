package calpers.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import calpers.spring.DAO.UserDAO;
import calpers.spring.model.Image;
import calpers.spring.model.Login;
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
	
}
