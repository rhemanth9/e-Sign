package calpers.spring.DAO;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;
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
	
	public int insertDrawImage(String email,byte[] photoBytes) {
		// TODO Auto-generated method stub
		//File file=new File(image.getImage());
		
		String sql = "INSERT INTO ESIGN1 (email, IMAGE) VALUES (?, ?)";		
		int result=0;
		
		result = jdbcTemplate.update(sql, new Object[] {email,photoBytes});
		

		return result;
	}

	public Image validateEsign(String email) {
		// TODO Auto-generated method stub
		String err="error";
		List<Image> userInEsign = null;
		String sql = "select * from sample.esign1 where email='"+err+"'";
		String sql1= "select * from sample.esign1 where imageid="
				+ " (SELECT max(imageid) FROM sample.esign1 where email='"+email+"')";

		userInEsign = jdbcTemplate.query(sql1, new ImageMapper());
		System.out.println("im outside");
		if(userInEsign == null || userInEsign.isEmpty()) {
			System.out.println("im inside");
			userInEsign = jdbcTemplate.query(sql, new ImageMapper());    
		}
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
		System.out.println("im here");
		userInEsign.setEmail(rs.getString("email"));
		Blob blob=rs.getBlob("image");
		InputStream inputStream = blob.getBinaryStream();
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		byte[] buffer = new byte[4096];
		int bytesRead = -1;
		try {
			while ((bytesRead = inputStream.read(buffer)) != -1) {
				outputStream.write(buffer, 0, bytesRead);                  
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		byte[] imageBytes = outputStream.toByteArray();
		String base64Image = Base64.getEncoder().encodeToString(imageBytes);
		userInEsign.setBase64Image(base64Image);
		System.out.println(rs.getInt("imageid"));
		System.out.println(rs.getString("email"));
		if("error".equalsIgnoreCase(rs.getString("email"))){
			userInEsign.setMessage("Looks like your signature is not uploaded. Please upload or draw it!");
		}
		else {
			userInEsign.setMessage("Your signature is already uploaded. Would you like to update it?");
		}
		return userInEsign;
	}
}