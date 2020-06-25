package calpers.spring.model;

import java.sql.Date;

public class User {

		private String confirmEmail;
		private String email;
		private String password;
		private String confirmpassword;
		private String firstname;
		private String lastname;
		//private Date dob;
		private String phone;
		private String address;
		private String organization;
		
		
		public String getConfirmEmail() {
			    return confirmEmail;
		}
		public void setConfirmEmail(String confirmEmail) {
			
			    this.confirmEmail = confirmEmail;
			  }
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getConfirmpassword() {
			return confirmpassword;
		}
		public void setConfirmpassword(String confirmpassword) {
			this.confirmpassword = confirmpassword;
		}
		public String getFirstname() {
			return firstname;
		}
		public void setFirstname(String firstname) {
			this.firstname = firstname;
		}
		public String getLastname() {
			return lastname;
		}
		public void setLastname(String lastname) {
			this.lastname = lastname;
		}

		/*public Date getDob() {
			return dob;
		}

		public void setDob(Date dob) {
			this.dob = dob;
		}*/

		public String getPhone() {
			return phone;
		}

		public void setPhone(String phone) {
			this.phone = phone;
		}
		
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getOrganization() {
			return organization;
		}
		public void setOrganization(String organization) {
			this.organization = organization;
		}


}
