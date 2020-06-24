package calpers.spring.DAO;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.web.multipart.MultipartFile;

import calpers.spring.model.Image;
import calpers.spring.model.Login;
import calpers.spring.model.User;

public class UserDaoIMPL implements UserDAO {

	@Autowired
	DataSource datasource;

	  @Autowired
	  JdbcTemplate jdbcTemplate;
	public int registerUser(User user) {
		// TODO Auto-generated method stub
		if(user.getPassword().equals(user.getConfirmpassword())) {
			System.out.println("invalid password");
		String sql = "insert into user1 values(?,?,?,?,?,?,?,?)";

	    return jdbcTemplate.update(sql, new Object[] { user.getUsername(), user.getEmail(),user.getPassword(),
	    		user.getFirstname(),user.getLastname(),user.getPhone(),user.getAddress(),user.getOrganization()});
		}
		else
		 return 0;
	}

	public void findUserByEmail(Login loginCredentials) {
		// TODO Auto-generated method stub
		String sql="select image from esign where username='"+loginCredentials.getEmail()+"'";
		List<Image> rs= jdbcTemplate.query(sql, new ImageMapper());
		

	}
	
	public int updateUserDetails(User user) {
		// TODO Auto-generated method stub
		String mobile=user.getPhone();
		System.out.println(mobile);
		String sql = "update user1 set firstName=?,lastName=?,address=?,mobile=?,organization=?,username=? where email=?";
		int res=0;
		try {
			res = jdbcTemplate.update(sql, new Object[] { user.getFirstname(),user.getLastname(),user.getAddress(),user.getPhone(),user.getOrganization(),user.getUsername(), user.getEmail() });
			return 1;
		}catch(Exception e) {
			return 0;
		}
	   
	}

	public User validateUser(Login loginCredentials) {
		// TODO Auto-generated method stub
		String sql = "select * from user1 where email='" + loginCredentials.getEmail() + "' and password='" + loginCredentials.getPassword()
        + "'";
		
    List<User> users = jdbcTemplate.query(sql, new UserMapper());

    return users.size() > 0 ? users.get(0) : null;
		//return null;
	}

	public int insertImage(String email,MultipartFile photo) {
		// TODO Auto-generated method stub
		//File file=new File(image.getImage());
		byte[] photoBytes;
		String sql = "INSERT INTO ESIGN1 (email, IMAGE) VALUES (?, ?)";		
		int result=0;
		try {
			photoBytes = photo.getBytes();
			result = jdbcTemplate.update(sql, new Object[] {email,photoBytes});
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	public Image validateEsign(String email) {
		// TODO Auto-generated method stub
		String sql = "select * from esign1 where email='"+email+"'";
		
    List<Image> userInEsign = jdbcTemplate.query(sql, new ImageMapper());

    return userInEsign.size() > 0 ? userInEsign.get(0) : null;
	}

}
class UserMapper implements RowMapper<User> {

	  public User mapRow(ResultSet rs, int arg1) throws SQLException {
	    User user = new User();

	    user.setUsername(rs.getString("username"));
	    user.setPassword(rs.getString("password"));
	    user.setFirstname(rs.getString("firstName"));
	    user.setLastname(rs.getString("lastName"));
	    user.setEmail(rs.getString("email"));
	    user.setAddress(rs.getString("address"));
	    user.setPhone(rs.getString("mobile"));
	    user.setOrganization(rs.getString("organization"));

	    return user;
	  }
	}

class ImageMapper implements RowMapper<Image> {

	  public Image mapRow(ResultSet rs, int arg1) throws SQLException {
	    Image userInEsign = new Image();
	    
	    userInEsign.setEmail(rs.getString("email"));
	    return userInEsign;
	  }
	}