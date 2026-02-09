<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Item</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body style="background-color: #f4f6f9;">

<div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="card shadow-lg" style="width: 100%; max-width: 500px; border-radius: 12px;">

        <div class="card-header text-center text-white"
             style="background: linear-gradient(90deg, #4e73df, #1cc88a); border-radius: 12px 12px 0 0;">
            <h4 class="mb-0">Add Item</h4>
        </div>

        <div class="card-body p-4">
            <form action="/item/addItem" method="post">

                <div class="mb-3">
                    <label class="form-label fw-semibold">Item Name</label>
                    <input type="text" name="itemName" class="form-control form-control-lg" required>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-semibold">Item Price</label>
                    <input type="number" step="0.01" name="itemPrice" class="form-control form-control-lg" required>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-semibold">Item Description</label>
                    <textarea name="itemDescription" class="form-control form-control-lg" required></textarea>
                </div>

                <div class="form-check form-switch mb-3">
                    <input class="form-check-input" type="checkbox" name="available" value="true" checked>
                    <label class="form-check-label">Item Availability</label>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-semibold">Select Category</label>
                    <select class="form-select form-select-lg" name="categoryId" required>
                        <option disabled selected>Select Category</option>
                        <c:forEach var="category" items="${categories}">
                            <option value="${category.categoryId}">
                                ${category.categoryName}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="d-flex justify-content-between">
                    <a href="/items" class="btn btn-outline-secondary px-4">Cancel</a>
                    <button type="submit" class="btn btn-success px-4">Add Item</button>
                </div>

            </form>
        </div>
    </div>
</div>

</body>
</html>
