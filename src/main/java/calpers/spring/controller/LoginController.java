package calpers.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import calpers.spring.model.Image;
import calpers.spring.model.Login;
import calpers.spring.model.User;
import calpers.spring.service.UserService;
@Controller
@SessionAttributes("loginDetails")
public class LoginController {
	@Autowired
	UserService userService;
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
			mav.addObject("username", user.getUsername());
			mav.addObject("email", user.getEmail());
			mav.addObject("phone", user.getPhone());
			mav.addObject("address", user.getAddress());
			mav.addObject("organization", user.getOrganization());
			mav.addObject("loginDetails", user);
		}
		else {
			mav = new ModelAndView("home");
			mav.addObject("message", "Username or Password is wrong!!");
		}
		
		Image image = userService.validateEsign(user.getEmail());
		if(null!=image && null!=image.getEmail()) {
			mav.addObject("exists","Your signature is already uploaded. Would you like to update it?");
		}
		else
			mav.addObject("notexists","Looks like your signature is not uploaded. Please upload or draw it!");
		return mav;
	}


	@RequestMapping(value = "/fetchDetails", method = RequestMethod.GET)
	public String fetchDetails(HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		
		return "welcome";
	}
	
	@RequestMapping(value = "/insertImage", method = RequestMethod.POST)
	public ModelAndView insertImage(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("email") String email,@RequestParam("image") MultipartFile image) {
		//System.out.println(image.getImage());
		int res=0;
		res=userService.insertImage(email,image);
		if(res!=0) {
			  String success="Image successfully inserted.!";
		  return new ModelAndView("login", "success", success);
		  }
		  else {
			  String error="Please try again :(";
			  return new ModelAndView("login", "error", error);
		  }
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
			User user1 = userService.validateUser(login);
			if (null != user && null !=user.getFirstname()) {
				mav = new ModelAndView("welcome");
				mav.addObject("firstname", user1.getFirstname());
				mav.addObject("lastname", user1.getLastname());
				mav.addObject("username", user1.getUsername());
				mav.addObject("email", user1.getEmail());
				mav.addObject("phone", user1.getPhone());
				mav.addObject("address", user1.getAddress());
				mav.addObject("organization", user1.getOrganization());
				mav.addObject("loginDetails", user1);
			}
			//return new ModelAndView("login", "firstname", user.getFirstname());
			return mav;
		}
		else {
			String error="Please enter correct details";
			return new ModelAndView("welcome","error",error);
		}
	}
	
	

	@RequestMapping(value = {"/logout"}, method = RequestMethod.GET)
    public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response){
		request.getSession().invalidate();
        return "home";
    }
	/* @WebServlet("/logout")
  public class LogoutServlet extends HttpServlet {

      @Override
      protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          request.getSession().invalidate();
          response.sendRedirect(request.getContextPath() + "/LoginPage.html");
      }

  }*/

	@ModelAttribute("login")
	public Login login()
	{
		return new Login();
	}
}
