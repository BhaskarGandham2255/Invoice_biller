<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Category</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color:#f4f6f9;">

<!-- Alert -->
	<c:if test="${not empty message}">
		<div
			class="alert alert-danger alert-dismissible fade show text-center 
       		position-fixed bottom-0 end-0 m-4"
			style="z-index: 9999; min-width: 300px;" role="alert">
			<i class="fa-solid fa-circle-check me-2"></i> ${message}
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
		</div>
	</c:if>

<div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="card shadow-lg" style="width: 100%; max-width: 500px; border-radius: 12px;">
        
        <div class="card-header text-center text-white" style="background: linear-gradient(90deg,#4e73df,#1cc88a); border-radius: 12px 12px 0 0;">
            <h4 class="mb-0">Add Category</h4>
        </div>

        <div class="card-body p-4">
            <form action="/category/categoryAdd" method="post">

                <!-- Category Name -->
                <div class="mb-4">
                    <label class="form-label fw-semibold">Category Name</label>
                    <input type="text" 
                           name="categoryName" 
                           class="form-control form-control-lg" 
                           placeholder="Enter category name"
                           required>
                </div>

                <!-- Buttons -->
                <div class="d-flex justify-content-between">
                    <a href="/category/categories" class="btn btn-outline-secondary px-4">
                        Cancel
                    </a>
                    <button type="submit" class="btn btn-success px-4">
                        Add Category
                    </button>
                </div>

            </form>
        </div>
    </div>
</div>

</body>
</html>
