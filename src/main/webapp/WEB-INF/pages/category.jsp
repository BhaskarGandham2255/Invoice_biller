<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Categories</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=Outfit:wght@300;400;500;600&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
<style>
:root {
	--bg: #f7f4ef;
	--surface: #ffffff;
	--orange: #ff5c00;
	--dark: #1a1208;
	--text: #2e2510;
	--muted: #9e9080;
	--border: #e8e0d0;
	--green: #1eaa6a;
	--green-lt: #e6f7f0;
	--red: #e03e3e;
	--red-lt: #fdeaea;
	--blue: #2a7ae8;
	--blue-lt: #eaf1fd;
	--shadow: 0 4px 24px rgba(26, 18, 8, 0.08);
	--shadow-lg: 0 12px 40px rgba(26, 18, 8, 0.14);
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	background: var(--bg);
	font-family: 'Outfit', sans-serif;
	color: var(--text);
	min-height: 100vh;
	display: flex;
	flex-direction: column;
}

.nav {
	background: var(--dark);
	padding: 0 32px;
	height: 64px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	position: sticky;
	top: 0;
	z-index: 100;
}

.nav-logo {
	font-family: 'Syne', sans-serif;
	font-weight: 800;
	font-size: 1.3rem;
	color: #fff;
	letter-spacing: -0.5px;
}

.nav-logo span {
	color: var(--orange);
}

.nav-right {
	display: flex;
	align-items: center;
	gap: 8px;
	background: rgba(255, 255, 255, 0.08);
	border-radius: 20px;
	padding: 6px 14px;
	color: #fff;
	font-size: 13px;
	font-weight: 500;
}

.nav-right .dot {
	width: 8px;
	height: 8px;
	background: var(--green);
	border-radius: 50%;
	box-shadow: 0 0 8px var(--green);
}

.hero {
	background: var(--dark);
	padding: 48px 32px 60px;
	position: relative;
	overflow: hidden;
}

.hero::before {
	content: '';
	position: absolute;
	inset: 0;
	background: radial-gradient(ellipse 60% 80% at 90% 50%, rgba(255, 92, 0, 0.25),
		transparent);
}

.hero::after {
	content: '??';
	position: absolute;
	right: 40px;
	top: 50%;
	transform: translateY(-50%);
	font-size: 110px;
	opacity: 0.1;
}

.hero-inner {
	position: relative;
	z-index: 1;
	max-width: 1100px;
	margin: 0 auto;
}

.hero-tag {
	display: inline-block;
	background: var(--orange);
	color: #fff;
	font-size: 10px;
	font-weight: 600;
	letter-spacing: 3px;
	text-transform: uppercase;
	padding: 5px 14px;
	border-radius: 20px;
	margin-bottom: 16px;
	animation: fadeUp 0.5s ease both;
}

.hero h1 {
	font-family: 'Syne', sans-serif;
	font-size: clamp(2rem, 5vw, 3.2rem);
	font-weight: 800;
	color: #fff;
	line-height: 1.15;
	margin-bottom: 10px;
	animation: fadeUp 0.5s 0.1s ease both;
}

.hero p {
	color: rgba(255, 255, 255, 0.45);
	font-size: 15px;
	animation: fadeUp 0.5s 0.2s ease both;
}

.toast-wrap {
	position: fixed;
	bottom: 24px;
	right: 24px;
	z-index: 9999;
	animation: slideUp 0.4s ease both;
}

.toast-box {
	background: var(--surface);
	border: 1px solid var(--border);
	border-left: 4px solid var(--green);
	border-radius: 12px;
	padding: 14px 20px;
	box-shadow: var(--shadow-lg);
	display: flex;
	align-items: center;
	gap: 10px;
	font-size: 14px;
	font-weight: 500;
	color: var(--green);
	min-width: 280px;
}

.toast-close {
	margin-left: auto;
	background: none;
	border: none;
	font-size: 16px;
	cursor: pointer;
	color: inherit;
	opacity: 0.6;
	line-height: 1;
	padding: 0 0 0 8px;
	text-decoration: none;
}

.toast-close:hover {
	opacity: 1;
}

.section {
	max-width: 780px;
	margin: 40px auto;
	padding: 0 32px;
	flex: 1;
	width: 100%;
	animation: fadeUp 0.5s 0.3s ease both;
}

.table-card {
	background: var(--surface);
	border: 1px solid var(--border);
	border-radius: 20px;
	overflow: hidden;
	box-shadow: var(--shadow);
}

.table-card-header {
	background: var(--dark);
	padding: 20px 28px;
	display: flex;
	align-items: center;
	gap: 12px;
}

.table-card-header .header-icon {
	width: 36px;
	height: 36px;
	background: var(--orange);
	border-radius: 10px;
	display: flex;
	align-items: center;
	justify-content: center;
	color: #fff;
	font-size: 15px;
}

.table-card-header h2 {
	font-family: 'Syne', sans-serif;
	font-size: 1.15rem;
	font-weight: 700;
	color: #fff;
}

.table-card-body {
	padding: 0;
}

.data-table {
	width: 100%;
	border-collapse: collapse;
}

.data-table thead tr {
	background: var(--bg);
	border-bottom: 1.5px solid var(--border);
}

.data-table thead th {
	padding: 13px 20px;
	font-size: 11px;
	font-weight: 600;
	letter-spacing: 1.5px;
	text-transform: uppercase;
	color: var(--muted);
	text-align: left;
}

.data-table thead th.center {
	text-align: center;
}

.data-table tbody tr {
	border-bottom: 1px solid var(--border);
	transition: background 0.15s;
}

.data-table tbody tr:last-child {
	border-bottom: none;
}

.data-table tbody tr:hover {
	background: #fdf9f5;
}

.data-table tbody td {
	padding: 14px 20px;
	font-size: 14px;
	color: var(--text);
	vertical-align: middle;
}

.data-table tbody td.center {
	text-align: center;
}

.row-num {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	width: 28px;
	height: 28px;
	background: var(--bg);
	border: 1.5px solid var(--border);
	border-radius: 8px;
	font-size: 12px;
	font-weight: 600;
	color: var(--muted);
}

.category-name {
	font-weight: 600;
	color: var(--text);
}

.action-btn {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	width: 34px;
	height: 34px;
	border-radius: 9px;
	font-size: 14px;
	text-decoration: none;
	transition: background 0.18s, transform 0.15s;
	margin: 0 3px;
}

.action-btn:hover {
	transform: scale(1.1);
}

.action-btn:active {
	transform: scale(0.95);
}

.btn-edit {
	background: var(--blue-lt);
	color: var(--blue);
}

.btn-edit:hover {
	background: #d0e4fc;
}

.btn-delete {
	background: var(--red-lt);
	color: var(--red);
}

.btn-delete:hover {
	background: #fad5d5;
}

.empty-state {
	padding: 60px 28px;
	text-align: center;
	color: var(--muted);
}

.empty-state .empty-icon {
	font-size: 48px;
	margin-bottom: 12px;
	opacity: 0.5;
}

.empty-state p {
	font-size: 15px;
	font-weight: 500;
}

.form-actions {
	display: flex;
	justify-content: space-between;
	gap: 12px;
	padding: 20px 28px;
	border-top: 1px solid var(--border);
	background: var(--bg);
}

.btn-action {
	display: inline-flex;
	align-items: center;
	gap: 7px;
	font-family: 'Outfit', sans-serif;
	font-size: 13px;
	font-weight: 600;
	padding: 11px 22px;
	border-radius: 10px;
	text-decoration: none;
	border: none;
	cursor: pointer;
	transition: background 0.2s, transform 0.15s;
}

.btn-action:hover {
	transform: scale(1.04);
}

.btn-action:active {
	transform: scale(0.97);
}

.btn-primary-act {
	background: var(--orange);
	color: #fff;
}

.btn-primary-act:hover {
	background: #e04e00;
}

.btn-secondary-act {
	background: var(--surface);
	color: var(--text);
	border: 1.5px solid var(--border);
}

.btn-secondary-act:hover {
	background: #eee9e0;
}

.page-footer {
	text-align: center;
	padding: 28px;
	color: var(--muted);
	font-size: 12px;
	border-top: 1px solid var(--border);
	margin-top: 20px;
}

@
keyframes fadeUp {from { opacity:0;
	transform: translateY(16px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
@
keyframes slideUp {from { opacity:0;
	transform: translateY(20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
@media ( max-width : 640px) {
	.nav {
		padding: 0 16px;
	}
	.hero {
		padding: 36px 16px 48px;
	}
	.section {
		padding: 0 16px;
	}
	.form-actions {
		flex-direction: column;
	}
}
</style>
</head>
<body>
	<c:if test="${not empty message}">
		<div class="toast-wrap" id="alertToast">
			<div class="toast-box">
				<i class="fa-solid fa-circle-check"></i> ${message} <a href="#"
					class="toast-close"
					onclick="document.getElementById('alertToast').style.display='none'; return false;">?</a>
			</div>
		</div>
	</c:if>

	<div class="section">
		<div class="table-card">

			<div class="table-card-header">
				<div class="header-icon">
					<i class="fa-solid fa-layer-group"></i>
				</div>
				<h2>Category List</h2>
			</div>

			<div class="table-card-body">
				<c:choose>
					<c:when test="${not empty categories}">
						<table class="data-table">
							<thead>
								<tr>
									<th style="width: 10%">#</th>
									<th style="width: 55%">Category Name</th>
									<th class="center" style="width: 17%">Edit</th>
									<th class="center" style="width: 18%">Delete</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="category" items="${categories}" varStatus="loop">
									<tr>
										<td><span class="row-num">${loop.count}</span></td>
										<td><span class="category-name">${category.categoryName}</span></td>
										<td class="center"><a
											href="${pageContext.request.contextPath}/category/categoryUpdate?categoryId=${category.categoryId}"
											class="action-btn btn-edit" title="Edit"> <i
												class="fa-solid fa-pen-to-square"></i>
										</a></td>
										<td class="center"><a
											href="${pageContext.request.contextPath}/category/categoryDelete?categoryId=${category.categoryId}"
											class="action-btn btn-delete" title="Delete"
											onclick="return confirm('Are you sure you want to delete this category?');">
												<i class="fa-solid fa-trash"></i>
										</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:when>
					<c:otherwise>
						<div class="empty-state">
							<div class="empty-icon">??</div>
							<p>No categories available yet.</p>
						</div>
					</c:otherwise>
				</c:choose>

				<div class="form-actions">
					<a href="${pageContext.request.contextPath}/item/items"
						class="btn-action btn-secondary-act"> <i
						class="fa-solid fa-arrow-left"></i> Back to Items
					</a> <a href="${pageContext.request.contextPath}/category/categoryAdd"
						class="btn-action btn-primary-act"> <i
						class="fa-solid fa-plus"></i> Add New Category
					</a>
				</div>
			</div>

		</div>
	</div>

	<div class="page-footer">Bhaskar.Gandham &nbsp;·&nbsp; Made with
		?? for food lovers</div>

</body>
</html>