<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>Edit Item</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body style="background-color: #f4f6f9;">

	<div class="container d-flex justify-content-center align-items-center"
		style="min-height: 100vh;">
		<div class="card shadow-lg"
			style="width: 100%; max-width: 500px; border-radius: 12px;">

			<div class="card-header text-center text-white"
				style="background: linear-gradient(90deg, #4e73df, #1cc88a); border-radius: 12px 12px 0 0;">
				<h4 class="mb-0">Update Item</h4>
			</div>

			<div class="card-body p-4">
				<form action="/item/updateItem" method="post">

					<!-- Hidden Item ID -->
					<input type="hidden" name="itemId" value="${item.itemId}" />

					<!-- Item Name -->
					<div class="mb-3">
						<label class="form-label fw-semibold">Item Name</label> <input
							type="text" name="itemName" class="form-control"
							value="${item.itemName}" required>
					</div>

					<!-- Price -->
					<div class="mb-3">
						<label class="form-label fw-semibold">Price</label> <input
							type="number" name="price" class="form-control"
							value="${item.price}" step="0.01" min="0" required>
					</div>

					<!-- Description -->
					<div class="mb-3">
						<label class="form-label fw-semibold">Description</label>
						<textarea name="description" class="form-control" rows="3">${item.description}</textarea>
					</div> 

					<!-- Available Switch -->
					<div class="form-check form-switch mb-3">
						<input class="form-check-input" type="checkbox" name="available"
							${item.available ? "checked" : ""}> <label
							class="form-check-label fw-semibold">Available</label>
					</div>

					<!-- Category Dropdown -->
					<div class="mb-4">
						<label class="form-label fw-semibold">Category</label> <select
							name="categoryId" class="form-select" required>
							<c:forEach var="cat" items="${categories}">
								<option value="${cat.categoryId}"
									${cat.categoryId == item.categoryId ? "selected" : ""}>
									${cat.categoryName}</option>
							</c:forEach>
						</select>
					</div>

					<!-- Buttons -->
					<div class="d-flex justify-content-between">
						<a href="/item/items" class="btn btn-outline-secondary">Cancel</a>
						<button type="submit" class="btn btn-success">Update</button>
					</div>

				</form>
			</div>
		</div>
	</div>

</body>
</html>
