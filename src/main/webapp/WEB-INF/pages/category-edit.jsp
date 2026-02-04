<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Category</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color:#f4f6f9;">

<div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="card shadow-lg" style="width: 100%; max-width: 500px; border-radius: 12px;">
        
        <div class="card-header text-center text-white" style="background: linear-gradient(90deg,#4e73df,#1cc88a); border-radius: 12px 12px 0 0;">
            <h4 class="mb-0">Update Category</h4>
        </div>

        <div class="card-body p-4">
            <form action="/category/categoryUpdate" method="post">

                <!-- Hidden ID (must be hidden, not disabled) -->
                <input type="hidden" name="categoryId" value="${category.categoryId}" />

                <!-- Category ID Display (read-only for user) -->
                <div class="mb-3">
                    <label class="form-label fw-semibold">Category ID</label>
                    <input type="text" class="form-control" value="${category.categoryId}" readonly >
                </div>

                <!-- Category Name -->
                <div class="mb-4">
                    <label class="form-label fw-semibold">Category Name</label>
                    <input type="text" 
                           name="categoryName" 
                           class="form-control form-control-lg" 
                           value="${category.categoryName}" 
                           placeholder="Enter category name"
                           required>
                </div>

                <!-- Buttons -->
                <div class="d-flex justify-content-between">
                    <a href="/category/categories" class="btn btn-outline-secondary px-4">
                        Cancel
                    </a>
                    <button type="submit" class="btn btn-success px-4">
                        Update
                    </button>
                </div>

            </form>
        </div>
    </div>
</div>

</body>
</html>
