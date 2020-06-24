package calpers.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import calpers.spring.model.Image;
import calpers.spring.model.Login;
import calpers.spring.model.User;

public interface UserService {
	 int register(User user);

	  User validateUser(Login login);
	  int updateUser(User user);
	  int insertImage(String email,MultipartFile photo);
	  Image validateEsign(String email);
}
