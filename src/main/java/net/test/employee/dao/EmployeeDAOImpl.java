package net.test.employee.dao;

import java.util.List;


import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.test.employee.domain.Employee;
@Repository
public class EmployeeDAOImpl implements EmployeeDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void saveEmployee(Employee employee) {
		
		sessionFactory.getCurrentSession().saveOrUpdate(employee);
		
	}

	@SuppressWarnings("unchecked")
	public List<Employee> listEmployee() {
		return sessionFactory.getCurrentSession().createQuery("from Employee")
				.list();
	}

	
	public void removeEmployee(Integer id) {
		Employee employee = (Employee) sessionFactory.getCurrentSession().load(
				Employee.class, id);
		if (null != employee) {
			sessionFactory.getCurrentSession().delete(employee);
		}
		
	}
	
	public Employee editEmployee(Integer id){
		Employee employee=(Employee) sessionFactory.getCurrentSession().get(Employee.class, id);
		return employee;
	}
}
