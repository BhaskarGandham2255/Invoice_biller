<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Categories</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />

<style>
body {
	background-color: #f4f6f9;
}

.card {
	border-radius: 12px;
}

.card-header {
	background: linear-gradient(90deg, #4e73df, #1cc88a);
	color: white;
	border-radius: 12px 12px 0 0 !important;
}

.table thead {
	background-color: #eef2ff;
	font-weight: 600;
}

.table tbody tr:hover {
	background-color: #f9fbff;
}

.action-btn {
	font-size: 18px;
	margin: 0 6px;
}

.empty-state {
	padding: 40px;
	color: #888;
	text-align: center;
	font-size: 18px;
}
</style>
</head>
<body>

	<!-- ✅ Success Alert -->
	<c:if test="${not empty message}">
		<div
			class="alert alert-success alert-dismissible fade show text-center 
       		position-fixed bottom-0 end-0 m-4"
			style="z-index: 9999; min-width: 300px;" role="alert">
			<i class="fa-solid fa-circle-check me-2"></i> ${message}
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
		</div>
	</c:if>

	<div class="container mt-5 z-index-0">
		<div class="card shadow-lg">

			<div class="card-header text-center">
				<h4 class="mb-0">Categories Management</h4>
			</div>

			<div class="card-body">


				<c:choose>
					<c:when test="${not empty categories}">
						<table class="table table-hover align-middle text-center">
							<thead>
								<tr>
									<th style="width: 10%">#</th>
									<th style="width: 55%">Category Name</th>
									<th style="width: 15%">Edit</th>
									<th style="width: 15%">Delete</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="category" items="${categories}" varStatus="loop">
									<tr>
										<td>${loop.count}</td>
										<td class="fw-semibold">${category.categoryName}</td>
										<td><a
											href="${pageContext.request.contextPath}/category/categoryUpdate?categoryId=${category.categoryId}"
											class="text-primary action-btn"> <i
												class="fa-solid fa-pen-to-square"></i>
										</a></td>
										<td><a
											href="${pageContext.request.contextPath}/category/categoryDelete?categoryId=${category.categoryId}"
											class="text-danger action-btn"
											onclick="return confirm('Are you sure you want to delete this category?');">
												<i class="fa-solid fa-trash"></i>
										</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:when>

					<c:otherwise>
						<div class="empty-state">📭 No categories available</div>
					</c:otherwise>
				</c:choose>

				<div class="text-center mt-4">
					<a href="${pageContext.request.contextPath}/item/items"
						class="btn btn-outline-secondary"> ← Back to Items </a>

					<a href="${pageContext.request.contextPath}/category/categoryAdd"
						class="btn btn-outline-primary ms-2"> + Add New Category </a>
				</div>

			</div>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
