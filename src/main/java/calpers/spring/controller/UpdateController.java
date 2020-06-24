/*package calpers.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import calpers.spring.model.Login;
import calpers.spring.model.User;
import calpers.spring.service.UserService;
@Controller
@SessionAttributes("loginDetails")
public class UpdateController {
	@Autowired
	UserService userService;
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView showWelcome(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("welcome");
		mav.addObject("userDetails", new Login());
		return mav;
	}
	//@RequestMapping(value = "/updateProcess", method = RequestMethod.POST)
	public ModelAndView updateProcess(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("userDetails") User user) {
		int res=0;
		
		res=userService.updateUser(user);
		Login login= new Login();
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
			String error="Please enter the password correctly";
			return new ModelAndView("welcome","error",error);
		}
	}
}
*/