package net.test.employee.service;

import java.util.List;
import net.test.employee.domain.Employee;

public interface EmployeeService {
	public void saveEmployee(Employee employee);

	public void removeEmployee(Integer id);
	
	public List<Employee> search(String firstname, String lastname,
			String secondname, String age, String experience, String description);
	
	public Employee editEmployee(Integer id);
}
