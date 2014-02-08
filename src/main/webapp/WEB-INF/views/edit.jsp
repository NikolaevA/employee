<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf8">
	<title>Сотрудники</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" media="all" />
	<script type="text/JavaScript" src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js">
</script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>

<script type="text/javascript">


function save() {
	var inputId = "${employee.id }"; 
	var inputFirstName = $("#firstname_str").val(); 
	var inputLastName=$("#lastname_str").val();
	var inputSecondName=$("#secondname_str").val();
	var inputAge=$("#age_str").val();
	var inputExperience=$("#experience_str").val();
	var inputDescription=$("#description_str").val();
	if (inputFirstName==""||inputLastName==""||inputSecondName==""||inputAge==""){
		var res='<div class="alert alert-error">'+
		  '<button type="button" class="close" data-dismiss="alert">&times;</button>'+
		  '<h4>Внимание!</h4>Поля Фамилия, Имя, Отчество и Возраст должны быть заполнены</div>';
		$('#result').html(res);
		  
		  return;
	}
	if (!$.isNumeric(inputAge)){
		var res='<div class="alert alert-error">'+
		  '<button type="button" class="close" data-dismiss="alert">&times;</button>'+
		  '<h4>Внимание!</h4>В поле Возраст должно быть число</div>';
		$('#result').html(res);
		  return;
	}
	$.ajax({
		url : 'edit/save',
  		type: 'get',
  		dataType: 'json',
  		contentType: 'application/json; charset=utf-8',
     	mimeType: 'application/json; charset=utf-8',
  		data : "id="+inputId+"&firstname="+ inputFirstName+"&lastname="+ inputLastName+"&secondname="+ inputSecondName+"&age="+ inputAge+"&experience="+ inputExperience+"&description="+ inputDescription,
  		success: function (data) { 
	  			if (data==0){
	  				var res='<div class="alert alert-success">'+
	  				  '<button type="button" class="close" data-dismiss="alert">&times;</button>'+
	  				  'Данные сохранены</div>';
	  				$('#result').html(res);
	  				  return;
	  			}else{
	  				alert("Error");
	  			}
  		}
	});
} 

</script>
<body>
<div class="row">
<div class="span8 offset2">
<c:choose>
	<c:when test="${empty employee.id}">
		<h3>Добавить нового сотрудника</h3>
	</c:when>
	<c:otherwise>
		<h3>Изменить данные сотрудника</h3>
	</c:otherwise>
</c:choose>

<table>
	<tr>
		<td>Фамилия<span style="color:red">*</span></td>
		<td><input maxlength="30" id="lastname_str" type="text" value=${employee.lastname }></td>
	</tr>
	<tr>
		<td>Имя<span style="color:red">*</span></td>
		<td><input maxlength="30" id="firstname_str" type="text" value=${employee.firstname }></td>
	</tr>
	<tr>
		<td>Отчество<span style="color:red">*</span></td>
		<td><input maxlength="30" id="secondname_str" type="text"  value=${employee.secondname }></td>
	</tr>
	<tr>
		<td>Возраст<span style="color:red">*</span></td>
		<td>
				<input maxlength="3" id="age_str" type="text" value=${employee.age } >
				
		</td>
	</tr>
	<tr>
		<td>Опыт</td>
		<td><textarea id="experience_str" rows="4">${employee.experience }</textarea></td>
	</tr>
	<tr>
		<td>Описание</td>
		<td><textarea id="description_str" rows="4">${employee.description }</textarea></td>
	</tr>
	<tr>
		<td>
			<input type="button" class="btn btn-info" value="Save" onclick="save()">
		</td>
		<td>
			<input type="button" class="btn btn-info" value="Back" onclick="location.href='/employee';" />
			
		</td>
	</tr>
</table>
<br>
<div id="result"></div>
</div>
</div>
</body>
</html>