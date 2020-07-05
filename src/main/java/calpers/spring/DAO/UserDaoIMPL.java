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
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAccessor;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.web.multipart.MultipartFile;

import calpers.spring.model.Image;
import calpers.spring.model.Login;
import calpers.spring.model.PasswordResetToken;
import calpers.spring.model.User;

public class UserDaoIMPL implements UserDAO {

	@Autowired
	DataSource datasource;

	@Autowired
	JdbcTemplate jdbcTemplate;

	//method used for user registartion
	public int registerUser(User user) {
		// TODO Auto-generated method stub
		if(user.getPassword().equals(user.getConfirmpassword()) && user.getConfirmEmail().equalsIgnoreCase(user.getEmail())) {
			System.out.println("invalid password");
			String sql = "insert into user1 values(?,MD5(?),?,?,?,?,?)";
			try {
				return jdbcTemplate.update(sql, new Object[] { user.getEmail(),user.getPassword(),
						user.getFirstname(),user.getLastname(),user.getPhone(),user.getAddress(),user.getOrganization()});
			}
			catch(Exception e) {
				return -1;
			}
		}
		else
			return 0;
	}

	//method to find user details by using email
	public User findUserByEmail(String email) {
		// TODO Auto-generated method stub
		System.out.println("dude:"+email);
		String sql = "select * from sample.user1 where email='"+email+"'";
		System.out.println(sql);
		try {
			//User user = jdbcTemplate.queryForObject(sql,new UserMapper());
			List<User> user = jdbcTemplate.query(sql, new UserMapper1());
			System.out.println("in find method");
			return user.size() > 0 ? user.get(0) : null;
		}catch(Exception e) {
			return null;
		}


	}

	//update user details when users try to update in account screen
	public int updateUserDetails(User user) {
		// TODO Auto-generated method stub
		String mobile=user.getPhone();
		System.out.println(mobile);
		String sql = "update user1 set firstName=?,lastName=?,address=?,mobile=?,organization=? where email=?";
		int res=0;
		try {
			res = jdbcTemplate.update(sql, new Object[] { user.getFirstname(),user.getLastname(),user.getAddress(),user.getPhone(),user.getOrganization(), user.getEmail() });
			return 1;
		}catch(Exception e) {
			return 0;
		}

	}

	//method used to verify the user
	public User validateUser(Login loginCredentials) {
		// TODO Auto-generated method stub
		System.out.println("dude:"+loginCredentials.getPassword());
		String sql = "select * from user1 where email='" + loginCredentials.getEmail() + "' and password=MD5('" + loginCredentials.getPassword()
		+ "')";
		try {
			List<User> users = jdbcTemplate.query(sql, new UserMapper());

			return users.size() > 0 ? users.get(0) : null;
		}catch(Exception e) {
			return null;
		}
		//return null;
	}

	//method to insert uploaded signature
	public int insertImage(String email,MultipartFile photo,String prefername) {
		// TODO Auto-generated method stub
		//File file=new File(image.getImage());
		byte[] photoBytes;
		String sql = "INSERT INTO ESIGN1 (email, IMAGE,prefername,insertdate) VALUES (?, ?,?,CURRENT_TIMESTAMP)";		
		int result=0;
		try {
			photoBytes = photo.getBytes();
			result = jdbcTemplate.update(sql, new Object[] {email,photoBytes,prefername});
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	//method to insert drawn signature
	public int insertDrawImage(String email,byte[] photoBytes,String prefername) {
		// TODO Auto-generated method stub
		//File file=new File(image.getImage());
		String sql = "INSERT INTO ESIGN1 (email, IMAGE,prefername,insertdate) VALUES (?, ?,?,CURRENT_TIMESTAMP)";	
		System.out.println(sql);
		int result=0;

		result = jdbcTemplate.update(sql, new Object[] {email,photoBytes,prefername});


		return result;
	}

	//method to display updated signature on login screen 
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

	//method to insert token details in forgot password table while resetting the password
	public int insertToken(String email, String token) {
		// TODO Auto-generated method stub
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
		LocalDateTime now = LocalDateTime.now();  
		LocalDateTime now1 = now.plusHours(1);
		System.out.println("now::::"+now1);
		System.out.println(dtf.format(now));  
		int enable=0;
		String sql = "INSERT INTO forgotpassword (email, token, expirydate,enable) VALUES (?, ?,?,?)";		
		int result=0;

		result = jdbcTemplate.update(sql, new Object[] {email,token,dtf.format(now1),enable});
		return result;
	}

	//validate the session for password token

	public PasswordResetToken validatePasswordResetToken(String token) {
		// TODO Auto-generated method stub

		String sql = "select * from forgotpassword where token='" +token + "'";
		try {
			List<PasswordResetToken> users = jdbcTemplate.query(sql, new TokenMapper());
			System.out.println("inside impl"+ users.get(0).getEmail());
			return users.size() > 0 ? users.get(0) : null;
		}catch(Exception e) {
			return null;
		}

		//return null;
	}

	//method to update password
	public int updatePassword(String email, String password) {
		// TODO Auto-generated method stub

		String sql = "update user1 set password=MD5(?) where email=?";
		int res=0;
		try {
			res = jdbcTemplate.update(sql, new Object[] {password ,email });
			return 1;
		}catch(Exception e) {
			return 0;
		}
	}

	//deactivate the password reset token once it is used.
	public int deactivateToken(String email, String token) {
		// TODO Auto-generated method stub

		String sql = "update forgotpassword set enable=? where email=? and token=?";
		int enable=1;
		int res=0;
		try {
			res = jdbcTemplate.update(sql, new Object[] { enable,email,token });
			return 1;
		}catch(Exception e) {
			return 0;
		}
	}
}
class UserMapper implements RowMapper<User> {

	public User mapRow(ResultSet rs, int arg1) throws SQLException {
		User user = new User();

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

class TokenMapper implements RowMapper<PasswordResetToken> {

	public PasswordResetToken mapRow(ResultSet rs, int arg1) throws SQLException {
		PasswordResetToken pst = new PasswordResetToken();

		pst.setEmail(rs.getString("email"));
		pst.setExpDate(rs.getString("expirydate"));
		pst.setEnable(rs.getInt("enable"));
		return pst;
	}
}

class UserMapper1 implements RowMapper<User> {

	public User mapRow(ResultSet rs, int arg1) throws SQLException {
		User user = new User();

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
		userInEsign.setPreferName(rs.getString("prefername"));
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
			userInEsign.setMessage("Please update your signature!");
		}
		else {
			userInEsign.setMessage("Your signature is up to date. Would you like to update it?");
		}
		return userInEsign;
	}
}