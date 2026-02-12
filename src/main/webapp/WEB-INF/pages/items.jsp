<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Menu Items</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />

<style>
body {
	background-color: #f8f9fa;
}

.card {
	border-radius: 12px;
}

.table thead {
	background-color: #343a40;
	color: white;
}

.badge-available {
	background-color: #28a745;
}

.badge-unavailable {
	background-color: #dc3545;
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

	<div class="container mt-5">

		<div class="card shadow p-4">
			<h2 class="text-center mb-4">🍽️ Menu Items</h2>

			<table class="table table-hover align-middle text-center">
				<thead>
					<tr>
						<th>#</th>
						<th>Item Name</th>
						<th>Category</th>
						<th>Price (₹)</th>
						<th>Status</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${items}" varStatus="loop">
						<tr>
							<td>${loop.count}</td>
							<td class="fw-semibold">${item.itemName}</td>
							<td><span class="badge bg-info text-dark">
									${item.categoryName} </span></td>
							<td>₹ ${item.price}</td>
							<td><c:choose>
									<c:when test="${item.available}">
										<span class="badge badge-available">Available</span>
									</c:when>
									<c:otherwise>
										<span class="badge badge-unavailable">Out of Stock</span>
									</c:otherwise>
								</c:choose></td>
							<td><a
								href="${pageContext.request.contextPath}/item/updateItem?itemId=${item.itemId}"
								class="text-primary action-btn"> <i
									class="fa-solid fa-pen-to-square"></i>
							</a></td>
							<td><a
								href="${pageContext.request.contextPath}/item/deleteItem?itemId=${item.itemId}"
								class="text-danger action-btn"
								onclick="return confirm('Are you sure you want to delete this item?');">
									<i class="fa-solid fa-trash"></i>
							</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


			<div class="text-center">
				<a href="${pageContext.request.contextPath}/item/addItem"
					class="btn btn-outline-secondary text-center me-4">Add New Item
				</a> <a href="${pageContext.request.contextPath}/category/categories"
					class="btn btn-outline-secondary text-center">Categories -> </a>
			</div>
		</div>

	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
