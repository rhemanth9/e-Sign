package calpers.spring.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;
import org.springframework.mock.web.MockMultipartFile;

//import javax.imageio.ImageIO;
//import javax.security.auth.callback.ConfirmationCallback;
import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
//import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import calpers.spring.model.Image;
import calpers.spring.model.Login;
import calpers.spring.model.PasswordResetToken;
import calpers.spring.model.User;
import calpers.spring.service.UserService;

@Controller
@SessionAttributes({"loginDetails","imageDetails","msg","dsuccess","usuccess","prefername"})
//@SessionAttributes("imageDetails")
public class LoginController {
	@Autowired
	UserService userService;
	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("login");
		mav.addObject("login", new Login());
		return mav;
	}


	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public ModelAndView loginProcess(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("login") Login login) {
		ModelAndView mav = null;
		User user = userService.validateUser(login);
		if (null != user && null !=user.getFirstname()) {
			mav = new ModelAndView("login");
			mav.addObject("firstname", user.getFirstname());
			mav.addObject("lastname", user.getLastname());
			//mav.addObject("username", user.getUsername());
			mav.addObject("email", user.getEmail());
			mav.addObject("phone", user.getPhone());
			mav.addObject("address", user.getAddress());
			mav.addObject("organization", user.getOrganization());

			Image image = userService.validateEsign(user.getEmail());
			if(null!=image && null!=image.getEmail()) {
				System.out.println(image.getEmail());
				mav.addObject("image",image.getBase64Image());
				mav.addObject("imageDetails", image.getBase64Image());
				mav.addObject("msg", image.getMessage());
				if(null!=image.getPreferName())
					mav.addObject("prefername", image.getPreferName() );
				else
					mav.addObject("prefername", user.getFirstname() );		
			}
			else {
				mav.addObject("notexists","Looks like your signature is not uploaded. Please upload or draw it!");
			}
			mav.addObject("loginDetails", user);
		}
		else {
			mav = new ModelAndView("home");
			mav.addObject("message", "Email or Password is wrong!!");
		}
		return mav;
	}


	@RequestMapping(value = "/fetchDetails", method = RequestMethod.GET)
	public String fetchDetails(HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {

		return "welcome";
	}

		
	@RequestMapping(value = "/insertImage", method = RequestMethod.POST)
	public ModelAndView insertUploadImage(HttpServletRequest request, HttpServletResponse response) throws IOException, InterruptedException {
		//System.out.println(image.getImage());
		int res=0;
		ModelAndView mav = null;
		String imageString=request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
		String[] data=imageString.split("-");
		System.out.println("base64 string:"+imageString);
		System.out.println(data[2]);
		String email=data[1];
		String prefername=data[2];
		byte[] contentData = data[0].getBytes();
		byte[] decodedData = Base64.getDecoder().decode(contentData);		
		MultipartFile image = new MockMultipartFile("image/jpeg", decodedData);		
		//String path = "C:\\CSC 230\\e-sign_web\\e-sign\\temp_images\\"+email+"\\";
		File dest = new File("C:\\CSC 230\\e-sign_web\\e-sign\\temp_images\\temp.jpeg");
	    //check destination exists, if not create it
	   /* if(!dest.exists())
	    {
	       dest.mkdir();
	    }*/
	    try { 
	       image.transferTo(dest); 
	    }
	    catch (IllegalStateException e) 
	    { 
	        e.printStackTrace();
	    }
	    // process which executes python script which removes background of the image. this method takes python.exe location of  
	    //installation directory and location of the python script.
	    Process p = Runtime.getRuntime().exec("C:\\Users\\somis\\AppData\\Local\\Microsoft\\WindowsApps\\PythonSoftwareFoundation.Python.3.8_qbz5n2kfra8p0\\python.exe \"C:\\CSC 230\\e-sign_web\\e-sign\\process_sign.py\"");
	    //res = 1;
	      Thread.sleep(3000);
	    //String despath = "C:\\CSC 230\\e-sign_web\\e-sign\\temp_images\\"+email+"\\temp_result.jpeg";
	    File res_file = new File("C:\\CSC 230\\e-sign_web\\e-sign\\temp_images\\temp_result.jpeg");
	    FileInputStream res_input = new FileInputStream(res_file);
	    MultipartFile multipartFile = new MockMultipartFile("res_file",
	    		res_file.getName(), "image/jpg", IOUtils.toByteArray(res_input));
	    res=userService.insertImage(email, multipartFile,prefername);
	    
		if(res!=0) {
			mav = new ModelAndView("uploadsignature");
			Image image1 = userService.validateEsign(email);
			mav.addObject("imageDetails", image1.getBase64Image());
			mav.addObject("msg", image1.getMessage());
			if(null!=image1.getPreferName())
				mav.addObject("prefername", image1.getPreferName() );
			mav.addObject("usuccess", "Image successfully inserted.!");
			return mav;
		}
		else {
			String error="Please try again :(";
			return new ModelAndView("login", "error", error);
		}


	}
	

	@RequestMapping(value = "/insertDrawImage", method = RequestMethod.POST)
	public ModelAndView saveCanvasImage(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("here");
		String img;
		ModelAndView mav = new ModelAndView("drawsign");
		int res=0;
		try {
			img = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
			System.out.println(img);
			String[] data=img.split("-");
			//System.out.println(email);
			System.out.println(data[0]);
			System.out.println(data[1]);
			System.out.println(data[2]);
			byte[] contentData = data[0].getBytes();
			byte[] decodedData = Base64.getDecoder().decode(contentData);
			res = userService.insertDrawImage(data[1], decodedData,data[2]);
			if(res>0) {

				Image image1 = userService.validateEsign(data[1]);
				mav.addObject("imageDetails", image1.getBase64Image());
				mav.addObject("msg", image1.getMessage());
				mav.addObject("dsuccess", "Image successfully inserted.!");
				if(null!=image1.getPreferName())
					mav.addObject("prefername", image1.getPreferName() );
				
				System.out.println("inside here");
			}
			else {
				//String errorDraw="Please try again :(";
				mav.addObject("error", "Please try again :(");

			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mav;
	}

	@Autowired
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView showWelcome(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("welcome");
		mav.addObject("userDetails", new Login());
		return mav;
	}

	@RequestMapping(value = "/updateProcess", method = RequestMethod.POST)
	public ModelAndView updateProcess(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("userDetails") User user) {
		int res=0;

		res=userService.updateUser(user);
		Login login= new Login();
		System.out.println(user.getPassword());
		login.setEmail(user.getEmail());
		login.setPassword(user.getPassword());
		System.out.println(res);
		if(!(res==0)) {
			ModelAndView mav = null;
			User user1 = userService.findUserByEmail(user.getEmail());
			if (null != user && null !=user.getFirstname()) {
				mav = new ModelAndView("welcome");
				mav.addObject("firstname", user1.getFirstname());
				mav.addObject("lastname", user1.getLastname());
				//mav.addObject("username", user1.getUsername());
				mav.addObject("email", user1.getEmail());
				mav.addObject("phone", user1.getPhone());
				mav.addObject("address", user1.getAddress());
				mav.addObject("organization", user1.getOrganization());
				mav.addObject("loginDetails", user1);
				mav.addObject("upsuccess", "Updated successfully.!");
			}
			//return new ModelAndView("login", "firstname", user.getFirstname());
			return mav;
		}
		else {
			String error="Mobile number already exists.!";
			return new ModelAndView("welcome","error",error);
		}
	}

	@RequestMapping(value = "/forgotPassword", method = RequestMethod.POST)
	public ModelAndView forgotPassword(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("email") String email) {
		ModelAndView mav = new ModelAndView("forgotpassword");
		User user1 = userService.findUserByEmail(email);
		String subject="Greetings from CalPERS";
		String message=null;
		if (null != user1 && null !=user1.getFirstname()) {

			//PasswordResetToken confirmationToken = new PasswordResetToken();

			mav.addObject("success", "If user is registered,\n an e-mail will be sent with reset password instructions. ");
			SimpleMailMessage msg = new SimpleMailMessage();
			String randomtoken = UUID.randomUUID().toString();

			int res=userService.insertToken(email,randomtoken);
			String message1= "Please use below link to reset your password.\n Below url wll be valid only for one hour.\n  ";
			message=message1+"http://localhost:8080/e-sign/confirmPassword?token="+randomtoken;
			// userService.createPasswordResetTokenForUser(email, token);
			msg.setTo(email);
			msg.setSubject(subject);
			msg.setText(message);
			//msg.setText(message1);

			// sends the e-mail
			mailSender.send(msg);

		}
		else {
			mav.addObject("error", "If user is registered,\n an e-mail will be sent with reset password instructions.");
		}

		return mav;
	}

	@RequestMapping(value = {"/confirmPassword"}, method = RequestMethod.GET)
	public ModelAndView validateResetToken(HttpServletRequest request, HttpServletResponse response, 
			@RequestParam("token") String token) {
		ModelAndView mav = null;
		PasswordResetToken result = userService.validatePasswordResetToken(token);
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
		LocalDateTime now = LocalDateTime.now();
		String date=result.getExpDate();
		if(result != null && date.compareTo(dtf.format(now))>0 && result.getEnable()==0) {
			mav = new ModelAndView("resetpassword");
			User user = userService.findUserByEmail(result.getEmail());
			mav.addObject("email", user.getEmail());
			mav.addObject("token", token);
			mav.addObject("logindetails",user);
			return mav;
		} else {

			return new ModelAndView("forgotpassword","errorexp","Token Expired");
		}
	}

	@RequestMapping(value = {"/resetPassword"}, method = RequestMethod.POST)
	public ModelAndView resetPassword(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("userDetails") User user,@RequestParam("email") String email,
			@RequestParam("token") String token) {
		System.out.println("inside resetpassword"+email);
		System.out.println("inside resetpassword"+user.getEmail());
		System.out.println("inside resetpassword"+user.getPassword());
		ModelAndView mav = null;
		if(user.getPassword().equals(user.getConfirmpassword())) {
		User user1 = userService.findUserByEmail(user.getEmail());
		
		
		if(user1 == null) {
			mav = new ModelAndView("home");
			mav.addObject("resfail","User doesnot exists. Please try again");
		}
		else {
			
				int res = userService.updatePassword(user.getEmail(),user.getPassword());
				if(res>0) {
					mav = new ModelAndView("home");
					mav.addObject("ressuccess","Your password has been reset. Please login");
					userService.deactivateToken(email,token);
				}
				
			}
		}
		else {
			mav = new ModelAndView("resetpassword");
			mav.addObject("email", email);
			mav.addObject("token", token);
			//.addObject("logindetails",user1);
				
				mav.addObject("error","Passwords should match");
			}
		
		return mav;
	}


	@RequestMapping(value = {"/logout"}, method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response){
		request.getSession().invalidate();
		return "home";
	}
	
	@RequestMapping(value = {"/valesign"}, method = RequestMethod.GET)
	public ModelAndView valEsign(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			@RequestParam("email") String email){
		ModelAndView mav = new ModelAndView("home") ;
		Image image1 = userService.validateEsign(email);
		mav.addObject("imageDetails", image1.getBase64Image());
		mav.addObject("msg", image1.getMessage());
		mav.addObject("success", "Image successfully inserted.!");
		System.out.println("inside here");
		
		request.getSession().invalidate();
		return mav;
	}

	@ModelAttribute("login")
	public Login login()
	{
		return new Login();
	}
}
