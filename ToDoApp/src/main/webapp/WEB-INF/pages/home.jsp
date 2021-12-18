<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<title><c:out value="${page}" /></title>
</head>
<body>

	<div class="container-fluid p-0">
		<h1 class="text-center p-2"
			style="background-image: linear-gradient(to right, #2980b9, #2c3e50); color: white">Welcome
			to ToDo App</h1>
	</div>
	<div class="container">

		<c:if test="${not empty msg }">

			<div class="alert alert-success text-center">
				<b><c:out value="${msg}"></c:out></b>
			</div>

		</c:if>


		<div class="row mt-5">
			<div class="col-md-2">
				<div class="list-group ml-2">
					<button type="button"
						class="list-group-item list-group-item-action active">
						Menu</button>
					<a href="<c:url value="/add"/>" type="button"
						class="list-group-item list-group-item-action">Add Todo</a> <a
						href="<c:url value="/home"/>" type="button"
						class="list-group-item list-group-item-action">View Todo</a>
				</div>


			</div>

			<div class="col-md-10">
				<c:if test="${page=='Home'}">
					<h3 class="text-center">All Todos</h3>

					<div class="row text-center ml-5">
						<c:forEach items="${todos}" var="t">
							<div class="column m-2">
								<div class="card">
									<div class="card-body mt-5">
										<h4>
											<c:out value="${t.todoTitle}" />
										</h4>
										<p>
											<c:out value="${t.todoContent }" />
										</p>
										<small><c:out value="${t.todoDate }" /></small>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:if>

				<c:if test="${page=='Add'}">
					<h3 class="text-center">Add Todos</h3>
					<br>
					<form:form action="saveTodo" method="post" modelAttribute="todo">

						<div class="form-group">
							<form:input path="todoTitle" cssClass="form-control"
								placeholder="Enter Title" />
						</div>

						<div class="form-group">
							<form:textarea path="todoContent" cssClass="form-control"
								placeholder="Enter Todo Content" cssStyle="height:300px" />
						</div>

						<div class="container text-center">
							<button class="btn btn-outline-success">Add Todo</button>
						</div>

					</form:form>


				</c:if>
			</div>

		</div>

	</div>





	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>