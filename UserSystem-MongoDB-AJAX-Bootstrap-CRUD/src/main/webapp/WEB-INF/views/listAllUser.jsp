<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User List</title>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>    
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
 	<script type='text/javascript' src='<c:url value="/resources/js/myScript.js"/>'></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
   
    <style type="text/css">
        .myrow-container {
            margin: 20px;
        }
    </style>


</head>
<body class=".container-fluid">
	<div id="userListForm" class="container myrow-container">
		<div class="panel panel-warning">
			<div class="panel-heading">
				<div align="right">
					<button type="button" data-toggle="modal" data-target="#myCreateModal">Create User</button>
				</div>
			</div>
			<div class="panel-body">
				<c:if test="${empty userList}">
                No Record.
            </c:if>
				<c:if test="${not empty userList}">

					<table class="table table-hover table-bordered">
						<thead style="background-color: #F2F5A9;">
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Surname</th>
								<th>Phone Number</th>
								<th>Düzenle</th>
								<th>Sil</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${userList}" var="u">
								<tr >
								    <th><span id = "content_${u.id}_id" ><c:out value="${u.id}" /></span> </th>
									<th><span id = "content_${u.id}_name" ><c:out value="${u.name}" /></span></th>
									<th><span id = "content_${u.id}_surname" ><c:out value="${u.surname}" /></span></th>
									<th><span id = "content_${u.id}_phoneNumber" ><c:out value="${u.phoneNumber}" /></span></th>
								
							<th><button data-toggle="modal" data-target="#myEditModal" type="button" name="btnEdit" userid="${u.id}"  >Edit</button>
							<th><button type="button" name="btnDelete" id="btnDelete" userid="${u.id}" >Delete</button>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>
			</div>
		</div>
	</div>
	
	<!-- Modal Edit -->
  <div class="modal fade" id="myEditModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">User Info</h4>
        </div>
        <div class="modal-body">

					<form role="form" name="userForm" method="POST">
					 <input type="hidden" class="form-control" name="id" id="id"
								placeholder="Name">
						<div class="form-group">
							<label for="name">Name</label>
							 <input type="text" class="form-control"name="name" id="name"
								placeholder="Name">
						</div>}

						<div class="form-group">
							<label for="Surname">Surname</label> 
							<input type="text" class="form-control"  name="surname" id="surname"
								placeholder="Surname">
						</div>
						<div class="form-group">
							<label for="phoneNumber">Phone Number</label>
							 <input type="password" class="form-control"  id="phoneNumber" name="phoneNumber"
								placeholder="Phone Number">
						</div>
						<button type="button" id="btnEditFormPost" data-dismiss="modal" class="btn btn-primary">Submit</button>
					</form>


				</div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  
  <!-- Modal Create -->
  <div class="modal fade" id="myCreateModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">User Info</h4>
        </div>
        <div class="modal-body">

					<form role="form" name="userForm" method="POST">
					 <input type="hidden" class="form-control"name="cId" id="cId"
								placeholder="Name">
						<div class="form-group">
							<label for="name">Name</label>
							 <input type="text" class="form-control"name="cName" id="cName"
								placeholder="Name">
						</div>
						<div class="form-group">
							<label for="Surname">Surname</label> 
							<input type="text" class="form-control" name="cSurname" id="cSurname"
								placeholder="Surname">
						</div>
						<div class="form-group">
							<label for="phoneNumber">Phone Number</label>
							 <input type="password" class="form-control" id="cPhoneNumber" name="cPhoneNumber"
								placeholder="Phone Number">
						</div>
						<button type="button" id="btnCreateFormPost"  data-dismiss="modal" class="btn btn-primary">Submit</button>
					</form>


				</div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
	
</body>

</html>