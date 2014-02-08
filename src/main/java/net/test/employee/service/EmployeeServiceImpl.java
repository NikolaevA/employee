package net.test.employee.service;

import java.util.ArrayList;
import java.util.List;

import net.test.employee.dao.EmployeeDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.test.employee.domain.Employee;
@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
    private EmployeeDAO employeeDAO;
 
    @Transactional
	public void saveEmployee(Employee employee) {
		employeeDAO.saveEmployee(employee);
		
	}

    @Transactional
    public void removeEmployee(Integer id) {
    	employeeDAO.removeEmployee(id); 		
	}
    
    @Transactional
    public Employee editEmployee(Integer id) {
    	return employeeDAO.editEmployee(id); 		
	}
    
    @Transactional
    public List<Employee> search(String firstname, String lastname,
			String secondname, String age, String experience, String description){
    	List<Employee> result=new ArrayList<Employee>();
    	List<Employee> allEmployee=employeeDAO.listEmployee();
    	for (Employee e : allEmployee ){
    		if (!e.getFirstname().contains(firstname)&&firstname!="") continue;
    		if (!e.getLastname().contains(lastname)&&lastname!="") continue;
    		if (!e.getSecondname().contains(secondname)&&secondname!="") continue;
    		if (age!=""&&e.getAge()!=Integer.parseInt(age)) continue;
    		if (!e.getExperience().contains(experience)&&experience!="") continue;
    		if (!e.getDescription().contains(description)&&description!="") continue;
    		result.add(e);
    	}
    	return result;
    }
    
 
}
