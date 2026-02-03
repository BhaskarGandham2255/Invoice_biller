<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Categories</title>

    <!-- Bootstrap CSS (match items.jsp) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px 0;
        }
        .header {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 20px;
            border-radius: 12px;
            margin-bottom: 30px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .header h1 {
            margin: 0;
            color: #333;
            font-weight: 700;
            text-align: center;
        }
        .card {
            border-radius: 12px;
            border: 0;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
            background-color: white;
        }
        .table {
            margin-bottom: 0;
        }
        .table thead {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            font-weight: 600;
        }
        .table thead th {
            font-size: 16px;
            font-weight: 700;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            padding: 18px 12px !important;
        }
        .table tbody tr {
            transition: all 0.3s ease;
            border-bottom: 1px solid #e9ecef;
        }
        .table tbody tr:hover {
            background-color: #f8f9ff;
            box-shadow: inset 0 0 8px rgba(102, 126, 234, 0.1);
        }
        .table td {
            padding: 18px 12px;
            vertical-align: middle;
        }
        .btn-secondary {
            background-color: #6c757d;
            border: 0;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-secondary:hover {
            background-color: #5a6268;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }
        .empty-state {
            text-align: center;
            padding: 40px;
            color: #999;
        }
        .empty-state p {
            font-size: 18px;
            margin: 10px 0;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="header">
        <h1>📚 Categories Management</h1>
    </div>

    <div class="card shadow p-4">
        <c:choose>
            <c:when test="${not empty categories}">
                <table class="table table-hover align-middle text-center">
                    <thead>
                        <tr>
                            <th style="width: 10%;">S.No</th>
                            <th style="width: 90%;">Category Name</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="category" items="${categories}" varStatus="loop">
                            <tr>
                                <td>${loop.count}</td>
                                <td>${category.categoryName}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="empty-state">
                    <p>📭 No categories available</p>
                </div>
            </c:otherwise>
        </c:choose>

        <div class="mt-4 text-center">
            <a href="${pageContext.request.contextPath}/menu/items" class="btn btn-secondary">← Back to Items</a>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
