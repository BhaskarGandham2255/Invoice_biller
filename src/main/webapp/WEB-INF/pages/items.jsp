<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Menu Items</title>
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

/* ── Nav ── */
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

/* ── Hero ── */
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
	content: '🍽️';
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

/* ── Toast ── */
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

.toast-box.error {
	border-left-color: var(--red);
	color: var(--red);
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

/* ── Section ── */
.section {
	max-width: 1100px;
	margin: 40px auto;
	padding: 0 32px;
	flex: 1;
}

/* ── Top Bar ── */
.top-bar {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 24px;
	flex-wrap: wrap;
	gap: 12px;
	animation: fadeUp 0.5s 0.3s ease both;
}

.top-bar-title {
	font-family: 'Syne', sans-serif;
	font-size: 1.4rem;
	font-weight: 700;
	color: var(--dark);
}

.top-bar-title span {
	color: var(--orange);
}

.top-bar-actions {
	display: flex;
	gap: 10px;
}

.btn-action {
	display: inline-flex;
	align-items: center;
	gap: 7px;
	font-family: 'Outfit', sans-serif;
	font-size: 13px;
	font-weight: 600;
	padding: 9px 18px;
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
	border: 1px solid var(--border);
}

.btn-secondary-act:hover {
	background: var(--bg);
}

/* ── Table Card ── */
.table-card {
	background: var(--surface);
	border: 1px solid var(--border);
	border-radius: 20px;
	overflow: hidden;
	box-shadow: var(--shadow);
	animation: fadeUp 0.5s 0.4s ease both;
}

table {
	width: 100%;
	border-collapse: collapse;
}

thead tr {
	background: var(--dark);
}

thead th {
	padding: 14px 18px;
	text-align: left;
	font-size: 10px;
	font-weight: 600;
	letter-spacing: 2px;
	text-transform: uppercase;
	color: rgba(255, 255, 255, 0.6);
}

tbody tr {
	border-bottom: 1px solid var(--border);
	transition: background 0.2s;
	animation: rowIn 0.4s ease both;
}

tbody tr:last-child {
	border-bottom: none;
}

tbody tr:hover {
	background: #fdfaf7;
}

tbody tr:nth-child(1) {
	animation-delay: 0.45s;
}

tbody tr:nth-child(2) {
	animation-delay: 0.50s;
}

tbody tr:nth-child(3) {
	animation-delay: 0.55s;
}

tbody tr:nth-child(4) {
	animation-delay: 0.60s;
}

tbody tr:nth-child(5) {
	animation-delay: 0.65s;
}

tbody tr:nth-child(6) {
	animation-delay: 0.70s;
}

tbody tr:nth-child(7) {
	animation-delay: 0.75s;
}

tbody tr:nth-child(8) {
	animation-delay: 0.80s;
}

td {
	padding: 14px 18px;
	font-size: 14px;
	vertical-align: middle;
}

.td-num {
	font-family: 'Syne', sans-serif;
	color: var(--muted);
	font-size: 13px;
	width: 40px;
}

.item-name {
	font-weight: 600;
	color: var(--dark);
}

.cat-badge {
	display: inline-block;
	background: var(--blue-lt);
	color: var(--blue);
	border: 1px solid rgba(42, 122, 232, 0.2);
	font-size: 11px;
	font-weight: 600;
	padding: 4px 10px;
	border-radius: 20px;
}

.status-badge {
	display: inline-flex;
	align-items: center;
	gap: 5px;
	font-size: 11px;
	font-weight: 600;
	padding: 4px 10px;
	border-radius: 20px;
}

.status-badge .dot {
	width: 6px;
	height: 6px;
	border-radius: 50%;
}

.status-badge.yes {
	background: var(--green-lt);
	color: var(--green);
}

.status-badge.yes .dot {
	background: var(--green);
}

.status-badge.no {
	background: var(--red-lt);
	color: var(--red);
}

.status-badge.no  .dot {
	background: var(--red);
}

.action-btn {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	width: 32px;
	height: 32px;
	border-radius: 8px;
	font-size: 13px;
	transition: background 0.2s, transform 0.15s;
	text-decoration: none;
}

.action-btn:hover {
	transform: scale(1.12);
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
	background: #fbd5d5;
}

.price {
	font-family: 'Syne', sans-serif;
	font-size: 15px;
	font-weight: 700;
	color: var(--dark);
}

.empty {
	text-align: center;
	padding: 60px 20px;
}

.empty-emoji {
	font-size: 48px;
	margin-bottom: 12px;
}

.empty p {
	color: var(--muted);
	font-size: 14px;
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
keyframes rowIn {from { opacity:0;
	transform: translateX(-8px);
}

to {
	opacity: 1;
	transform: translateX(0);
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
	.top-bar {
		flex-direction: column;
		align-items: flex-start;
	}
	.cat-badge {
		display: none;
	}
}
</style>
</head>
<body>

	<!-- ✅ Success Toast -->
	<c:if test="${not empty message}">
		<div class="toast-wrap" id="successToast">
			<div class="toast-box">
				<i class="fa-solid fa-circle-check"></i> ${message} <a href="#"
					class="toast-close"
					onclick="document.getElementById('successToast').style.display='none'; return false;">✕</a>
			</div>
		</div>
	</c:if>

	<!-- ❌ Error Toast -->
	<c:if test="${not empty errorMsg}">
		<div class="toast-wrap" id="errorToast" style="bottom: 100px;">
			<div class="toast-box error">
				<i class="fa-solid fa-circle-xmark"></i> ${errorMsg} <a href="#"
					class="toast-close"
					onclick="document.getElementById('errorToast').style.display='none'; return false;">✕</a>
			</div>
		</div>
	</c:if>

	<!-- Table Section -->
	<div class="section">
		<div class="top-bar">
			<div class="top-bar-title">
				All <span>Items</span>
			</div>
			<div class="top-bar-actions">
				<a href="${pageContext.request.contextPath}/item/addItem"
					class="btn-action btn-primary-act"> <i class="fa-solid fa-plus"></i>
					Add New Item
				</a> <a href="${pageContext.request.contextPath}/category/categories"
					class="btn-action btn-secondary-act"> <i
					class="fa-solid fa-layer-group"></i> Categories
				</a>
			</div>
		</div>

		<div class="table-card">
			<c:choose>
				<c:when test="${not empty items}">
					<table>
						<thead>
							<tr>
								<th>#</th>
								<th>Item Name</th>
								<th>Category</th>
								<th>Price (₹)</th>
								<th>Status</th>
								<th>Edit</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${items}" varStatus="loop">
								<tr>
									<td class="td-num">${loop.count}</td>
									<td><span class="item-name">${item.itemName}</span></td>
									<td><span class="cat-badge">${item.categoryName}</span></td>
									<td><span class="price">₹ ${item.price}</span></td>
									<td><c:choose>
											<c:when test="${item.available}">
												<span class="status-badge yes"> <span class="dot"></span>
													Available
												</span>
											</c:when>
											<c:otherwise>
												<span class="status-badge no"> <span class="dot"></span>
													Out of Stock
												</span>
											</c:otherwise>
										</c:choose></td>
									<td><a
										href="${pageContext.request.contextPath}/item/updateItem?itemId=${item.itemId}"
										class="action-btn btn-edit" title="Edit"> <i
											class="fa-solid fa-pen-to-square"></i>
									</a></td>
									<td><a
										href="${pageContext.request.contextPath}/item/deleteItem?itemId=${item.itemId}"
										class="action-btn btn-delete" title="Delete"
										onclick="return confirm('Are you sure you want to delete this item?');">
											<i class="fa-solid fa-trash"></i>
									</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<div class="empty">
						<div class="empty-emoji">🍽️</div>
						<p>No menu items found. Add your first item!</p>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<div class="page-footer">Bhaskar.Gandham &nbsp;·&nbsp; Made with
		❤️ for food lovers</div>

</body>
</html>