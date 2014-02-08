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
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" media="all" />
	<script type="text/JavaScript" src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js" ></script>


<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>

<script type="text/javascript">



$(document).ready(function () {
	  search();
	  $( document ).on( "click","#more", function() {
		  var id = $(this).closest("tr").attr("id");
		  $("#hide" + id).toggle();
		});
	  $( document ).on( "click","#change", function() {
		  var id = $(this).closest("tr").attr("id");
		  document.location.assign("edit?id="+id);
		});
	  
	  $( document ).on( "click","#del", function() {
		  var id = $(this).closest("tr").attr("id");
		  $.ajax({
				url : 'delete',
		  		type: 'GET',
		  		dataType: 'json',
		  		contentType: 'application/json',
		     	mimeType: 'application/json',
		  		data : "id="+id,
		  		success: function (data) {
		  			
		  			$("tr#hide" + id).remove();
		  			$("tr#"+id).remove();
		  		}
		  })
		  
		});
	//$( '.searchfield' ).keyup(function(){ search(); });
});
	
function add(){
	document.location.assign("edit");
}

function makeSearchForm(){
	$("#searchForm").slideToggle("slow");
}

function search() {
 	var inputFirstName = $("#firstname_str").val(); 
	var inputLastName=$("#lastname_str").val();
	var inputSecondName=$("#secondname_str").val();
	var inputAge=$("#age_str").val();
	var inputExperience=$("#experience_str").val();
	var inputDescription=$("#description_str").val();
	$.ajax({
		url : 'search',
  		type: 'GET',
  		dataType: 'json',
  		contentType: 'application/json; charset=utf-8',
     	mimeType: 'application/json; charset=utf-8',
  		data : "firstname="+ inputFirstName+"&lastname="+ inputLastName+"&secondname="+ inputSecondName+"&age="+ inputAge+"&experience="+ inputExperience+"&description="+ inputDescription,
  		success: function (data) { 
	  			$("#table>tbody").html("")
	  			for (var i=0;i<data.length;i++){
	  				if (data[i].experience=="") data[i].experience="-";
	  				if (data[i].description=="") data[i].description="-";
		  			var row='<tr class="open" id='+data[i].id+ "><td>"+data[i].lastname+
		  				"</td><td>"+data[i].firstname+
		  				"</td><td>"+data[i].secondname+
		  				"</td><td>"+data[i].age+
		  				"</td><td><div class='text-center'><div class='btn-group'><button id='more' class='btn btn-small'><i class='icon-info-sign'></i></button>"+
		  				"<button id='change' class='btn btn-small'><i class='icon-pencil'></i></button>"+
		  				"<button id='del' class='btn btn-small'><i class='icon-remove'></i></button></div></div>"+
		  				"</td></tr>"+
		  				"<tr style='display:none' id=hide"+data[i].id+" ><td colspan=2><b>Опыт</b><br>"+
		  				data[i].experience+"</td><td colspan=3><b>Описание</b><br>"+
		  				data[i].description+"</td></tr>";
		  			$("#table>tbody").append(row);
	  			}
	  			
  		}
	});
} 
</script>
</head>
<body>
<div class="row">
<div class="span9 offset2">

  
<h2>Список сотрудников</h2>
     <button class="btn btn-info" onclick="makeSearchForm()"><i class="icon-search"></i> Поиск</button>
  
  <button class="btn btn-info " onclick="add()"><i class="icon-plus"></i>Добавить</button>
  
<div id="searchForm" style='display:none'>
<table >
	
	<tr>
		
		<td>Фамилия<br>
			<input class="searchfield input-small" id="lastname_str" type="text" maxlength="30">
		</td>
		<td>Имя<br>
			<input class="searchfield input-small" id="firstname_str" type="text" maxlength="30">
		</td>
		<td>Отчество<br>
			<input class="searchfield input-small" id="secondname_str" type="text" maxlength="30">
		</td>
	</tr>
	<tr>
		<td>Возраст<br>
			<input class="searchfield input-small" id="age_str" type="text" maxlength="3">
		</td>
		<td>Опыт<br>
			<input class="searchfield input-small" id="experience_str" type="text">
		</td>
		<td>Описание<br>
			<input class="searchfield input-small" id="description_str" type="text">
		</td>
		
	</tr>
	
</table>
	<input class="btn btn-info" type="button" value="Найти" onclick="search()">
	
</div>
 <p id="result_text"></p>
<table class="table table-bordered" id="table" >
	<thead>
		<tr>
			
			<th >Фамилия</th>
			<th >Имя</th>
			<th >Отчество</th>
			<th >Возраст</th>
			<th ><div class="text-center"> Действия</div></th>
		</tr>
	</thead>
	<tbody>
		
	</tbody>
</table>
</div>
</div>
</body>
</html>