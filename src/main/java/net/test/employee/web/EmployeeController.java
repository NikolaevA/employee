package net.test.employee.web;


import java.util.List;
import java.util.Map;

import net.test.employee.service.EmployeeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import net.test.employee.domain.Employee;

/**
 * Handles requests for the application home page.
 */
@Controller
public class EmployeeController {
	
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping("/")
	public String home(Map<String, Object> map) {
		return "employee";
	}
	
	
	@RequestMapping("/edit")
	public String edit(Map<String, Object> map,@RequestParam(value="id", required=false) Integer employeeId) {
		if (employeeId!=null) map.put("employee", employeeService.editEmployee(employeeId));
		return "/edit";
	}
	

	@RequestMapping(value ="/delete", method = RequestMethod.GET)
	public @ResponseBody Integer delete(@RequestParam(value="id") Integer employeeId) {
		employeeService.removeEmployee(employeeId);
		return 0;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public @ResponseBody List<Employee> search(@RequestParam String firstname, @RequestParam String lastname,
			@RequestParam String secondname, @RequestParam String age, @RequestParam String experience, @RequestParam String description) {
		return employeeService.search(firstname,lastname,secondname,age,experience,description);
	}
	
	@RequestMapping(value = "edit/save", method = RequestMethod.GET)
	public @ResponseBody Integer save(@RequestParam String id, @RequestParam String firstname, @RequestParam String lastname,
			@RequestParam String secondname, @RequestParam String age, @RequestParam String experience, @RequestParam String description) { 
		if (firstname==""||lastname==""||secondname==""||age=="") return 1;
		Employee employee=new Employee();
		if (id=="") employee.setId(null); 
			else employee.setId(Integer.parseInt(id));
		employee.setFirstname(firstname);
		employee.setLastname(lastname);
		employee.setSecondname(secondname);
		employee.setAge(Integer.parseInt(age));
		employee.setExperience(experience);
		employee.setDescription(description);
		employeeService.saveEmployee(employee);
		return 0;
	}
	
	
}
