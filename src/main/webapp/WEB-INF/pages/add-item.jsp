<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Add Item</title>
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
	border-left: 4px solid var(--red);
	border-radius: 12px;
	padding: 14px 20px;
	box-shadow: var(--shadow-lg);
	display: flex;
	align-items: center;
	gap: 10px;
	font-size: 14px;
	font-weight: 500;
	color: var(--red);
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

/* ── Section ── */
.section {
	max-width: 640px;
	margin: 40px auto;
	padding: 0 32px;
	flex: 1;
	width: 100%;
	animation: fadeUp 0.5s 0.3s ease both;
}

/* ── Form Card ── */
.form-card {
	background: var(--surface);
	border: 1px solid var(--border);
	border-radius: 20px;
	overflow: hidden;
	box-shadow: var(--shadow);
}

.form-card-header {
	background: var(--dark);
	padding: 20px 28px;
	display: flex;
	align-items: center;
	gap: 12px;
}

.form-card-header .header-icon {
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

.form-card-header h2 {
	font-family: 'Syne', sans-serif;
	font-size: 1.15rem;
	font-weight: 700;
	color: #fff;
}

.form-card-body {
	padding: 28px;
}

/* ── Form Elements ── */
.form-group {
	margin-bottom: 20px;
}

.form-label {
	display: block;
	font-size: 12px;
	font-weight: 600;
	letter-spacing: 1.5px;
	text-transform: uppercase;
	color: var(--muted);
	margin-bottom: 8px;
}

.form-control {
	width: 100%;
	padding: 11px 14px;
	font-family: 'Outfit', sans-serif;
	font-size: 14px;
	color: var(--text);
	background: var(--bg);
	border: 1.5px solid var(--border);
	border-radius: 10px;
	outline: none;
	transition: border-color 0.2s, box-shadow 0.2s;
}

.form-control:focus {
	border-color: var(--orange);
	box-shadow: 0 0 0 3px rgba(255, 92, 0, 0.1);
	background: #fff;
}

textarea.form-control {
	resize: vertical;
	min-height: 90px;
}

select.form-control {
	appearance: none;
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='8' viewBox='0 0 12 8'%3E%3Cpath d='M1 1l5 5 5-5' stroke='%239e9080' stroke-width='1.5' fill='none' stroke-linecap='round'/%3E%3C/svg%3E");
	background-repeat: no-repeat;
	background-position: right 14px center;
	padding-right: 38px;
	cursor: pointer;
}

/* ── Toggle Switch ── */
.toggle-group {
	display: flex;
	align-items: center;
	justify-content: space-between;
	background: var(--bg);
	border: 1.5px solid var(--border);
	border-radius: 10px;
	padding: 12px 14px;
}

.toggle-label {
	font-size: 14px;
	font-weight: 500;
	color: var(--text);
}

.toggle-switch {
	position: relative;
	display: inline-block;
	width: 44px;
	height: 24px;
}

.toggle-switch input {
	opacity: 0;
	width: 0;
	height: 0;
}

.toggle-slider {
	position: absolute;
	cursor: pointer;
	inset: 0;
	background: #ddd;
	border-radius: 24px;
	transition: background 0.2s;
}

.toggle-slider::before {
	content: '';
	position: absolute;
	width: 18px;
	height: 18px;
	left: 3px;
	top: 3px;
	background: #fff;
	border-radius: 50%;
	transition: transform 0.2s;
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.2);
}

.toggle-switch input:checked+.toggle-slider {
	background: var(--green);
}

.toggle-switch input:checked+.toggle-slider::before {
	transform: translateX(20px);
}

/* ── Form Actions ── */
.form-actions {
	display: flex;
	justify-content: space-between;
	gap: 12px;
	margin-top: 28px;
	padding-top: 20px;
	border-top: 1px solid var(--border);
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
	background: var(--bg);
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
	.form-card-body {
		padding: 20px;
	}
}
</style>
</head>
<body>

	<!-- Alert Toast -->
	<c:if test="${not empty message}">
		<div class="toast-wrap" id="alertToast">
			<div class="toast-box">
				<i class="fa-solid fa-circle-xmark"></i> ${message} <a href="#"
					class="toast-close"
					onclick="document.getElementById('alertToast').style.display='none'; return false;">✕</a>
			</div>
		</div>
	</c:if>

	<!-- Form Section -->
	<div class="section">
		<div class="form-card">
			<div class="form-card-header">
				<div class="header-icon">
					<i class="fa-solid fa-plus"></i>
				</div>
				<h2>Item Details</h2>
			</div>
			<div class="form-card-body">
				<form action="/item/addItem" method="post">

					<div class="form-group">
						<label class="form-label">Item Name</label> <input type="text"
							name="itemName" class="form-control"
							placeholder="e.g. Paneer Butter Masala" required>
					</div>

					<div class="form-group">
						<label class="form-label">Item Price (₹)</label> <input
							type="number" step="0.01" name="itemPrice" class="form-control"
							placeholder="e.g. 249.00" required>
					</div>

					<div class="form-group">
						<label class="form-label">Item Description</label>
						<textarea name="itemDescription" class="form-control"
							placeholder="Brief description of the item..." required></textarea>
					</div>

					<div class="form-group">
						<div class="toggle-group">
							<span class="toggle-label">Item Availability</span> <label
								class="toggle-switch"> <input type="checkbox"
								name="available" value="true" checked> <span
								class="toggle-slider"></span>
							</label>
						</div>
					</div>

					<div class="form-group">
						<label class="form-label">Select Category</label> <select
							class="form-control" name="categoryId" required>
							<option disabled selected>Select Category</option>
							<c:forEach var="category" items="${categories}">
								<option value="${category.categoryId}">
									${category.categoryName}</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-actions">
						<a href="/item/items" class="btn-action btn-secondary-act"> <i
							class="fa-solid fa-arrow-left"></i> Cancel
						</a>
						<button type="submit" class="btn-action btn-primary-act">
							<!-- <i class="fa-solid fa-plus"></i> --> Add Item
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>

	<div class="page-footer">Bhaskar.Gandham &nbsp;·&nbsp; Made with
		❤️ for food lovers</div>

</body>
</html>