package net.test.employee.dao;

import java.util.List;

import net.test.employee.domain.Employee;

public interface EmployeeDAO {
	public void saveEmployee(Employee employee);
	public List<Employee> listEmployee();

	public void removeEmployee(Integer id);
	public Employee editEmployee(Integer id);
}
