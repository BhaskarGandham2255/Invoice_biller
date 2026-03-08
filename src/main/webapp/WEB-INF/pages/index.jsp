<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Food Menu</title>
<link
	href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=Outfit:wght@300;400;500;600&display=swap"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<style>
:root {
	--bg: #f7f4ef;
	--surface: #ffffff;
	--orange: #ff5c00;
	--orange-lt: #fff0e8;
	--dark: #1a1208;
	--text: #2e2510;
	--muted: #9e9080;
	--border: #e8e0d0;
	--green: #1eaa6a;
	--green-lt: #e6f7f0;
	--red: #e03e3e;
	--red-lt: #fdeaea;
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

.stats {
	max-width: 1100px;
	margin: -22px auto 0;
	padding: 0 32px;
	display: flex;
	gap: 12px;
	position: relative;
	z-index: 10;
	animation: fadeUp 0.5s 0.3s ease both;
	flex-wrap: wrap;
}

.stat-pill {
	background: var(--surface);
	border-radius: 14px;
	padding: 14px 20px;
	box-shadow: var(--shadow);
	display: flex;
	align-items: center;
	gap: 12px;
}

.stat-icon {
	font-size: 22px;
}

.stat-info .num {
	font-family: 'Syne', sans-serif;
	font-size: 1.2rem;
	font-weight: 700;
	color: var(--dark);
	line-height: 1;
}

.stat-info .lbl {
	font-size: 11px;
	color: var(--muted);
	margin-top: 3px;
}

.section {
	max-width: 1100px;
	margin: 40px auto;
	padding: 0 32px;
}

.section-header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 24px;
}

.section-title {
	font-family: 'Syne', sans-serif;
	font-size: 1.4rem;
	font-weight: 700;
	color: var(--dark);
}

.section-title span {
	color: var(--orange);
}

.item-count {
	font-size: 13px;
	color: var(--muted);
	background: var(--border);
	padding: 4px 14px;
	border-radius: 20px;
}

.grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
	gap: 20px;
}

.card {
	background: var(--surface);
	border-radius: 20px;
	overflow: hidden;
	box-shadow: var(--shadow);
	border: 1px solid var(--border);
	display: flex;
	flex-direction: column;
	transition: transform 0.25s, box-shadow 0.25s;
	animation: cardIn 0.5s ease both;
}

.card:nth-child(1) {
	animation-delay: 0.35s;
}

.card:nth-child(2) {
	animation-delay: 0.40s;
}

.card:nth-child(3) {
	animation-delay: 0.45s;
}

.card:nth-child(4) {
	animation-delay: 0.50s;
}

.card:nth-child(5) {
	animation-delay: 0.55s;
}

.card:nth-child(6) {
	animation-delay: 0.60s;
}

.card:nth-child(7) {
	animation-delay: 0.65s;
}

.card:nth-child(8) {
	animation-delay: 0.70s;
}

.card:nth-child(9) {
	animation-delay: 0.75s;
}

.card:nth-child(10) {
	animation-delay: 0.80s;
}

.card-strip {
	height: 5px;
	background: linear-gradient(90deg, var(--orange), #ffb347);
}

.card-strip.off {
	background: var(--border);
}

.card-body {
	padding: 20px;
	flex: 1;
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.card-top {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.card-num {
	font-size: 11px;
	font-weight: 600;
	color: var(--muted);
	letter-spacing: 0.5px;
}

.avail-badge {
	display: inline-flex;
	align-items: center;
	gap: 5px;
	font-size: 11px;
	font-weight: 600;
	padding: 4px 10px;
	border-radius: 20px;
}

.avail-badge.yes {
	background: var(--green-lt);
	color: var(--green);
}

.avail-badge.no {
	background: var(--red-lt);
	color: var(--red);
}

.avail-badge .dot {
	width: 6px;
	height: 6px;
	border-radius: 50%;
}

.avail-badge.yes .dot {
	background: var(--green);
}

.avail-badge.no  .dot {
	background: var(--red);
}

.card-name {
	font-family: 'Syne', sans-serif;
	font-size: 1.05rem;
	font-weight: 700;
	color: var(--dark);
	line-height: 1.3;
}

.card-desc {
	font-size: 13px;
	color: var(--muted);
	line-height: 1.6;
	flex: 1;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
}

.card-footer {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 14px 20px;
	border-top: 1px solid var(--border);
	background: #fdfcfa;
}

.price-block .lbl {
	font-size: 10px;
	color: var(--muted);
	text-transform: uppercase;
	letter-spacing: 1px;
}

.price-block .amount {
	font-family: 'Syne', sans-serif;
	font-size: 1.25rem;
	font-weight: 700;
	color: var(--dark);
}

.price-block .amount sup {
	font-size: 0.75rem;
	color: var(--muted);
	font-weight: 500;
	vertical-align: super;
}

.btn-order {
	display: inline-flex;
	align-items: center;
	gap: 7px;
	background: var(--orange);
	color: #fff;
	font-family: 'Outfit', sans-serif;
	font-size: 13px;
	font-weight: 600;
	padding: 10px 18px;
	border-radius: 12px;
	border: none;
	cursor: pointer;
	transition: background 0.2s, transform 0.15s;
}

.btn-order:hover {
	background: #e04e00;
	transform: scale(1.04);
}

.btn-order:active {
	transform: scale(0.97);
}

.btn-order.disabled {
	background: var(--border);
	color: var(--muted);
	cursor: not-allowed;
	pointer-events: none;
}

.qty-wrapper {
	display: inline-flex;
	align-items: center;
	gap: 10px;
	background: var(--orange-lt);
	border-radius: 12px;
	padding: 6px 12px;
	border: 1.5px solid rgba(255, 92, 0, 0.15);
}

.btn-qty-minus, .btn-qty-plus {
	width: 30px;
	height: 30px;
	background: var(--orange);
	color: #fff;
	border-radius: 8px;
	font-size: 18px;
	font-weight: 700;
	cursor: pointer;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	line-height: 1;
	user-select: none;
	transition: background 0.2s, transform 0.15s;
}

.btn-qty-minus:hover, .btn-qty-plus:hover {
	background: #e04e00;
	transform: scale(1.08);
}

.btn-qty-minus:active, .btn-qty-plus:active {
	transform: scale(0.95);
}

.order-qty {
	font-weight: 700;
	font-size: 1rem;
	color: var(--dark);
	min-width: 22px;
	text-align: center;
}

.checkout-bar {
	position: sticky;
	bottom: 16px;
	display: flex;
	justify-content: center;
	z-index: 50;
	margin-top: 24px;
	pointer-events: none;
}

.btn-checkout {
	pointer-events: all;
	display: none;
	align-items: center;
	gap: 10px;
	background: var(--orange);
	color: #fff;
	font-family: 'Outfit', sans-serif;
	font-size: 15px;
	font-weight: 700;
	padding: 14px 48px;
	border-radius: 16px;
	border: none;
	cursor: pointer;
	box-shadow: 0 8px 28px rgba(255, 92, 0, 0.40);
	transition: background 0.2s, transform 0.15s;
}

.btn-checkout:hover {
	background: #e04e00;
	transform: scale(1.04);
}

.btn-checkout:active {
	transform: scale(0.97);
}

.btn-checkout .badge {
	background: #fff;
	color: var(--orange);
	font-size: 12px;
	font-weight: 800;
	border-radius: 20px;
	padding: 2px 10px;
}

.empty {
	text-align: center;
	padding: 80px 20px;
	animation: fadeUp 0.5s ease both;
}

.empty-emoji {
	font-size: 56px;
	margin-bottom: 16px;
}

.empty h3 {
	font-family: 'Syne', sans-serif;
	font-size: 1.4rem;
	color: var(--dark);
	margin-bottom: 8px;
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

/* ── Toast ── */
.toast {
	position: fixed;
	top: 80px;
	left: 50%;
	transform: translateX(-50%);
	padding: 14px 24px;
	border-radius: 12px;
	font-size: 14px;
	font-weight: 600;
	z-index: 999;
	box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
	display: none;
	align-items: center;
	gap: 10px;
	white-space: nowrap;
}

.toast.show {
	display: flex;
	animation: toastIn 0.4s ease both;
}

.toast.hide {
	animation: toastOut 0.4s ease both;
}

.toast-success {
	background: #e6f7f0;
	color: #1eaa6a;
	border: 1.5px solid #1eaa6a;
}

.toast-error {
	background: #fdeaea;
	color: #e03e3e;
	border: 1.5px solid #e03e3e;
}

/* ── Modal ── */
.modal-overlay {
	display: none;
	position: fixed;
	inset: 0;
	background: rgba(26, 18, 8, 0.55);
	z-index: 200;
	align-items: center;
	justify-content: center;
	backdrop-filter: blur(3px);
}

.modal-overlay.active {
	display: flex;
}

.bill-modal {
	background: #fffcf8;
	border-radius: 20px;
	width: 100%;
	max-width: 480px;
	max-height: 90vh;
	overflow-y: auto;
	box-shadow: 0 24px 64px rgba(26, 18, 8, 0.25);
	animation: slideUp 0.3s ease both;
	position: relative;
}

.bill-header {
	background: var(--orange);
	padding: 20px 28px 18px;
	border-radius: 20px 20px 0 0;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.bill-title {
	font-family: 'Syne', sans-serif;
	font-size: 1.2rem;
	font-weight: 800;
	color: #fff;
	letter-spacing: 1px;
}

.bill-subtitle {
	font-size: 11px;
	color: rgba(255, 255, 255, 0.65);
	margin-top: 3px;
}

.btn-close-modal {
	background: rgba(255, 255, 255, 0.2);
	border: none;
	color: #fff;
	width: 32px;
	height: 32px;
	border-radius: 50%;
	font-size: 18px;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	transition: background 0.2s;
}

.btn-close-modal:hover {
	background: rgba(255, 255, 255, 0.35);
}

.bill-items {
	padding: 16px 28px;
}

.bill-item-row {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 12px 0;
	border-bottom: 1px dashed var(--border);
	gap: 12px;
}

.bill-item-row:last-child {
	border-bottom: none;
}

.bill-item-name {
	font-family: 'Syne', sans-serif;
	font-size: 14px;
	font-weight: 700;
	color: var(--dark);
}

.bill-item-price {
	font-size: 12px;
	color: var(--muted);
	margin-top: 2px;
}

.bill-qty-control {
	display: flex;
	align-items: center;
	gap: 8px;
}

.bill-qty-btn {
	width: 26px;
	height: 26px;
	background: var(--orange);
	color: #fff;
	border: none;
	border-radius: 7px;
	font-size: 16px;
	font-weight: 700;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	transition: background 0.15s, transform 0.1s;
}

.bill-qty-btn:hover {
	background: #e04e00;
	transform: scale(1.08);
}

.bill-qty-btn.minus {
	background: #f0ebe3;
	color: var(--dark);
}

.bill-qty-btn.minus:hover {
	background: var(--red-lt);
	color: var(--red);
}

.bill-qty-val {
	font-weight: 700;
	font-size: 15px;
	color: var(--dark);
	min-width: 22px;
	text-align: center;
}

.bill-item-total {
	font-weight: 700;
	font-size: 14px;
	color: var(--dark);
	min-width: 64px;
	text-align: right;
}

.bill-totals {
	padding: 12px 28px 16px;
	border-top: 2px dashed var(--border);
}

.bill-total-row {
	display: flex;
	justify-content: space-between;
	font-size: 13px;
	color: var(--muted);
	padding: 4px 0;
}

.bill-total-row .val {
	font-weight: 600;
	color: var(--dark);
}

.bill-total-row.grand {
	border-top: 2px solid var(--dark);
	margin-top: 8px;
	padding-top: 12px;
}

.bill-total-row.grand .lbl {
	font-family: 'Syne', sans-serif;
	font-size: 15px;
	font-weight: 800;
	color: var(--dark);
	text-transform: uppercase;
}

.bill-total-row.grand .val {
	font-size: 22px;
	font-weight: 800;
	color: var(--orange);
}

.bill-footer {
	padding: 16px 28px 24px;
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.btn-place-order {
	width: 100%;
	padding: 15px;
	background: var(--dark);
	color: #fff;
	font-family: 'Syne', sans-serif;
	font-size: 14px;
	font-weight: 700;
	letter-spacing: 1.5px;
	text-transform: uppercase;
	border: none;
	border-radius: 12px;
	cursor: pointer;
	transition: background 0.2s, transform 0.15s;
	box-shadow: 0 4px 0 rgba(26, 18, 8, 0.25);
}

.btn-place-order:hover {
	background: var(--orange);
	transform: translateY(-1px);
}

.btn-place-order:active {
	transform: translateY(1px);
}

.btn-place-order:disabled {
	background: var(--muted);
	cursor: not-allowed;
	transform: none;
	box-shadow: none;
}

.btn-continue {
	width: 100%;
	padding: 12px;
	background: transparent;
	color: var(--muted);
	font-family: 'Outfit', sans-serif;
	font-size: 13px;
	border: 1.5px solid var(--border);
	border-radius: 12px;
	cursor: pointer;
	transition: border-color 0.2s, color 0.2s;
}

.btn-continue:hover {
	border-color: var(--orange);
	color: var(--orange);
}

.bill-empty {
	text-align: center;
	padding: 40px 20px;
	color: var(--muted);
	font-size: 14px;
}

.bill-empty span {
	font-size: 36px;
	display: block;
	margin-bottom: 10px;
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
keyframes cardIn {from { opacity:0;
	transform: translateY(20px) scale(0.97);
}

to {
	opacity: 1;
	transform: translateY(0) scale(1);
}

}
@
keyframes slideUp {from { opacity:0;
	transform: translateY(32px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
@
keyframes toastIn {from { opacity:0;
	transform: translateX(-50%) translateY(-12px);
}

to {
	opacity: 1;
	transform: translateX(-50%) translateY(0);
}

}
@
keyframes toastOut {from { opacity:1;
	
}

to {
	opacity: 0;
}

}
@media ( max-width : 640px) {
	.nav, .hero {
		padding-left: 16px;
		padding-right: 16px;
	}
	.stats, .section {
		padding: 0 16px;
	}
	.grid {
		grid-template-columns: 1fr;
	}
	.bill-modal {
		max-width: 100%;
		border-radius: 20px 20px 0 0;
		align-self: flex-end;
	}
}
</style>
</head>
<body>

	<!-- Toast -->
	<div class="toast toast-success" id="toast-success">
		✅ <span id="toast-msg">Order placed!</span>
	</div>
	<div class="toast toast-error" id="toast-error">
		❌ <span id="toast-err-msg">Something went wrong</span>
	</div>

	<nav class="nav">
		<div class="nav-logo">
			Bhaskar<span>.</span>Gandham
		</div>
		<div class="nav-right">
			<div class="dot"></div>
			Kitchen Open
		</div>
	</nav>

	<div class="hero">
		<div class="hero-inner">
			<div class="hero-tag">Fresh &amp; Delicious</div>
			<h1>
				What would you<br>like to eat today?
			</h1>
			<p>Browse our menu and place your order instantly.</p>
		</div>
	</div>

	<c:choose>
		<c:when test="${not empty items}">
			<div class="stats">
				<div class="stat-pill"
					onclick="window.location.href='http://localhost:8080/item/items'"
					style="cursor: pointer">
					<div class="stat-icon">🍴</div>
					<div class="stat-info">
						<div class="num">${fn:length(items)}</div>
						<div class="lbl">Menu Items</div>
					</div>
				</div>
				<div class="stat-pill">
					<div class="stat-icon">✅</div>
					<div class="stat-info">
						<div class="num">
							<c:set var="avail" value="0" />
							<c:forEach var="i" items="${items}">
								<c:if test="${i.available}">
									<c:set var="avail" value="${avail + 1}" />
								</c:if>
							</c:forEach>
							${avail}
						</div>
						<div class="lbl">Available Now</div>
					</div>
				</div>
				<div class="stat-pill">
					<div class="stat-icon">⚡</div>
					<div class="stat-info">
						<div class="num">~20 min</div>
						<div class="lbl">Avg. Prep Time</div>
					</div>
				</div>
			</div>

			<div class="section">
				<div class="section-header">
					<div class="section-title">
						Our <span>Menu</span>
					</div>
					<div class="item-count">${fn:length(items)}items</div>
				</div>

				<div class="grid">
					<c:forEach var="item" items="${items}" varStatus="status">
						<div class="card">
							<div class="card-strip ${item.available ? '' : 'off'}"></div>
							<div class="card-body">
								<div class="card-top">
									<div class="card-num">${status.count}</div>
									<c:choose>
										<c:when test="${item.available}">
											<span class="avail-badge yes"><span class="dot"></span>
												Available</span>
										</c:when>
										<c:otherwise>
											<span class="avail-badge no"><span class="dot"></span>
												Unavailable</span>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="card-name">${item.itemName}</div>
								<div class="card-desc">${item.description}</div>
							</div>
							<div class="card-footer">
								<div class="price-block">
									<div class="lbl">Price</div>
									<div class="amount">
										<sup>₹</sup>${item.price}</div>
								</div>
								<c:choose>
									<c:when test="${item.available}">
										<div class="qty-wrapper" data-name="${item.itemName}"
											data-price="${item.price}">
											<span class="btn-qty-minus" style="display: none">−</span> <span
												class="order-qty" style="display: none">0</span> <span
												class="btn-qty-plus">+</span>
										</div>
									</c:when>
									<c:otherwise>
										<span class="btn-order disabled">Unavailable</span>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</c:forEach>
				</div>

				<div class="checkout-bar">
					<button class="btn-checkout" id="btn-checkout"
						onclick="openBillModal()">
						🛒 Checkout &nbsp;<span class="badge" id="checkout-badge">0</span>
					</button>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="section">
				<div class="empty">
					<div class="empty-emoji">🍽️</div>
					<h3>Menu is Empty</h3>
					<p>No items available right now. Please check back soon.</p>
				</div>
			</div>
		</c:otherwise>
	</c:choose>

	<div class="page-footer">Bhaskar.Gandham &nbsp;·&nbsp; Made with
		❤️ for food lovers</div>

	<!-- BILL MODAL -->
	<div class="modal-overlay" id="billModal"
		onclick="handleOverlayClick(event)">
		<div class="bill-modal">
			<div class="bill-header">
				<div>
					<div class="bill-title">🧾 Your Bill</div>
					<div class="bill-subtitle" id="bill-subtitle">0 items
						selected</div>
				</div>
				<button class="btn-close-modal" onclick="closeBillModal()">✕</button>
			</div>
			<div class="bill-items" id="bill-items-container"></div>
			<div class="bill-totals">
				<div class="bill-total-row">
					<span>Subtotal</span> <span class="val">₹<span
						id="bill-subtotal">0.00</span></span>
				</div>
				<div class="bill-total-row">
					<span>GST (5%)</span> <span class="val">₹<span id="bill-gst">0.00</span></span>
				</div>
				<div class="bill-total-row grand">
					<span class="lbl">Total</span> <span class="val">₹<span
						id="bill-grand">0.00</span></span>
				</div>
			</div>
			<div class="bill-footer">
				<button class="btn-place-order" id="btn-place-order"
					onclick="placeOrder()">✦ Place Order</button>
				<button class="btn-continue" onclick="closeBillModal()">←
					Continue Ordering</button>
			</div>
		</div>
	</div>

	<script>
    var totalItems = 0;

    document.querySelectorAll('.card-footer .qty-wrapper').forEach(function(wrapper) {
        var minus    = wrapper.querySelector('.btn-qty-minus');
        var plus     = wrapper.querySelector('.btn-qty-plus');
        var qtyLabel = wrapper.querySelector('.order-qty');

        plus.addEventListener('click', function() {
            var val = parseInt(qtyLabel.textContent) + 1;
            qtyLabel.textContent = val;
            totalItems++;
            updateCheckoutBtn();
            if (val === 1) { minus.style.display = ''; qtyLabel.style.display = ''; }
        });

        minus.addEventListener('click', function() {
            var val = parseInt(qtyLabel.textContent);
            if (val > 0) {
                val--;
                qtyLabel.textContent = val;
                totalItems--;
                updateCheckoutBtn();
                if (val === 0) { minus.style.display = 'none'; qtyLabel.style.display = 'none'; }
            }
        });
    });

    function updateCheckoutBtn() {
        var btn   = document.getElementById('btn-checkout');
        var badge = document.getElementById('checkout-badge');
        badge.textContent = totalItems;
        btn.style.display = totalItems > 0 ? 'inline-flex' : 'none';
    }

    function openBillModal() {
        renderBill();
        document.getElementById('billModal').classList.add('active');
        document.body.style.overflow = 'hidden';
    }

    function closeBillModal() {
        document.getElementById('billModal').classList.remove('active');
        document.body.style.overflow = '';
    }

    function handleOverlayClick(e) {
        if (e.target === document.getElementById('billModal')) closeBillModal();
    }

    function renderBill() {
        var container = document.getElementById('bill-items-container');
        container.innerHTML = '';
        var orders = getOrders();

        if (orders.length === 0) {
            var emptyDiv  = document.createElement('div');
            emptyDiv.className = 'bill-empty';
            var emptyIcon = document.createElement('span');
            emptyIcon.textContent = '🛒';
            var emptyText = document.createTextNode('No items selected yet.');
            emptyDiv.appendChild(emptyIcon);
            emptyDiv.appendChild(emptyText);
            container.appendChild(emptyDiv);
            document.getElementById('bill-subtotal').textContent = '0.00';
            document.getElementById('bill-gst').textContent      = '0.00';
            document.getElementById('bill-grand').textContent    = '0.00';
            document.getElementById('bill-subtitle').textContent = '0 items selected';
            return;
        }

        var subtotal = 0;
        for (var i = 0; i < orders.length; i++) {
            var order     = orders[i];
            var price     = parseFloat(order.price);
            var qty       = order.quantity;
            var itemTotal = price * qty;
            subtotal     += itemTotal;

            var row = document.createElement('div');
            row.className = 'bill-item-row';

            var infoDiv = document.createElement('div');
            infoDiv.style.flex = '1';
            var nameDiv = document.createElement('div');
            nameDiv.className   = 'bill-item-name';
            nameDiv.textContent = order.itemName;
            var priceDiv = document.createElement('div');
            priceDiv.className   = 'bill-item-price';
            priceDiv.textContent = '₹' + price.toFixed(2) + ' each';
            infoDiv.appendChild(nameDiv);
            infoDiv.appendChild(priceDiv);

            var qtyCtrl = document.createElement('div');
            qtyCtrl.className = 'bill-qty-control';
            var btnMinus = document.createElement('button');
            btnMinus.className   = 'bill-qty-btn minus';
            btnMinus.textContent = '−';
            btnMinus.setAttribute('data-name', order.itemName);
            btnMinus.onclick = function() { changeBillQty(this.getAttribute('data-name'), -1); };
            var qtyVal = document.createElement('span');
            qtyVal.className   = 'bill-qty-val';
            qtyVal.textContent = qty;
            var btnPlus = document.createElement('button');
            btnPlus.className   = 'bill-qty-btn';
            btnPlus.textContent = '+';
            btnPlus.setAttribute('data-name', order.itemName);
            btnPlus.onclick = function() { changeBillQty(this.getAttribute('data-name'), 1); };
            qtyCtrl.appendChild(btnMinus);
            qtyCtrl.appendChild(qtyVal);
            qtyCtrl.appendChild(btnPlus);

            var totalDiv = document.createElement('div');
            totalDiv.className   = 'bill-item-total';
            totalDiv.textContent = '₹' + itemTotal.toFixed(2);

            row.appendChild(infoDiv);
            row.appendChild(qtyCtrl);
            row.appendChild(totalDiv);
            container.appendChild(row);
        }

        var gst   = subtotal * 0.05;
        var grand = subtotal + gst;
        document.getElementById('bill-subtotal').textContent = subtotal.toFixed(2);
        document.getElementById('bill-gst').textContent      = gst.toFixed(2);
        document.getElementById('bill-grand').textContent    = grand.toFixed(2);
        document.getElementById('bill-subtitle').textContent =
            totalItems + ' item' + (totalItems !== 1 ? 's' : '') + ' selected';
    }

    function changeBillQty(itemName, delta) {
        document.querySelectorAll('.card-footer .qty-wrapper').forEach(function(wrapper) {
            if (wrapper.dataset.name === itemName) {
                var minus    = wrapper.querySelector('.btn-qty-minus');
                var qtyLabel = wrapper.querySelector('.order-qty');
                var val      = parseInt(qtyLabel.textContent) + delta;
                if (val < 0) val = 0;
                qtyLabel.textContent = val;
                totalItems += delta;
                if (totalItems < 0) totalItems = 0;
                if (val === 0) { minus.style.display = 'none'; qtyLabel.style.display = 'none'; }
                else           { minus.style.display = '';     qtyLabel.style.display = ''; }
            }
        });
        updateCheckoutBtn();
        renderBill();
    }

    function getOrders() {
        var orders = [];
        document.querySelectorAll('.card-footer .qty-wrapper').forEach(function(wrapper) {
            var qty = parseInt(wrapper.querySelector('.order-qty').textContent);
            if (qty > 0) {
                orders.push({
                    itemName: wrapper.dataset.name,
                    price:    wrapper.dataset.price,
                    quantity: qty
                });
            }
        });
        return orders;
    }

    // ── Place Order ────────────────────────────────────────
    function placeOrder() {
        var orders = getOrders();
        if (orders.length === 0) return;

        var btn = document.getElementById('btn-place-order');
        btn.textContent = 'Placing Order...';
        btn.disabled    = true;

        var subtotal = 0;
        for (var i = 0; i < orders.length; i++) {
            subtotal += parseFloat(orders[i].price) * orders[i].quantity;
        }
        var gst   = subtotal * 0.05;
        var grand = subtotal + gst;

        var formData = new FormData();
        formData.append('orders', JSON.stringify(orders));

        fetch('/order/placeOrder', {
            method: 'POST',
            body:   formData
        })
        .then(function(res) { return res.json(); })
        .then(function(data) {
            if (data.status === 'success') {
                // Generate and download PDF
                printInvoice(orders, data.orderNumber, subtotal, gst, grand);

                // Reset cart
                document.querySelectorAll('.card-footer .qty-wrapper').forEach(function(w) {
                    var minus    = w.querySelector('.btn-qty-minus');
                    var qtyLabel = w.querySelector('.order-qty');
                    qtyLabel.textContent  = '0';
                    minus.style.display    = 'none';
                    qtyLabel.style.display = 'none';
                });
                totalItems = 0;
                updateCheckoutBtn();
                closeBillModal();

                // Show success toast
                showToast('success', 'Order ' + data.orderNumber + ' placed! PDF downloading...');
            } else {
                showToast('error', data.message || 'Something went wrong');
            }
            btn.textContent = '✦ Place Order';
            btn.disabled    = false;
        })
        .catch(function(err) {
            showToast('error', 'Something went wrong: ' + err.message);
            btn.textContent = '✦ Place Order';
            btn.disabled    = false;
        });
    }

    // ── Toast ──────────────────────────────────────────────
    function showToast(type, msg) {
        var el  = document.getElementById(type === 'success' ? 'toast-success' : 'toast-error');
        var txt = document.getElementById(type === 'success' ? 'toast-msg' : 'toast-err-msg');
        txt.textContent = msg;
        el.className = 'toast ' + (type === 'success' ? 'toast-success' : 'toast-error') + ' show';
        setTimeout(function() {
            el.className = 'toast ' + (type === 'success' ? 'toast-success' : 'toast-error') + ' hide';
            setTimeout(function() { el.className = 'toast ' + (type === 'success' ? 'toast-success' : 'toast-error'); }, 400);
        }, 3500);
    }

    // ── Print Invoice PDF ──────────────────────────────────
    function printInvoice(orders, orderNumber, subtotal, gst, grand) {
        var doc   = new window.jspdf.jsPDF('p', 'mm', 'a5');
        var pageW = doc.internal.pageSize.getWidth();
        var y     = 0;

        // Header
        doc.setFillColor(26, 18, 8);
        doc.rect(0, 0, pageW, 30, 'F');
        doc.setTextColor(255, 255, 255);
        doc.setFontSize(18);
        doc.setFont('helvetica', 'bold');
        doc.text('Bhaskar.Gandham', pageW / 2, 13, { align: 'center' });
        doc.setFontSize(8);
        doc.setFont('helvetica', 'normal');
        doc.setTextColor(180, 170, 160);
        doc.text('FRESH & DELICIOUS', pageW / 2, 21, { align: 'center' });
        y = 38;

        // Order meta
        doc.setTextColor(158, 144, 128);
        doc.setFontSize(7);
        doc.setFont('helvetica', 'normal');
        doc.text('ORDER NUMBER', 10, y);
        doc.text('DATE & TIME', pageW - 10, y, { align: 'right' });
        y += 5;
        doc.setTextColor(26, 18, 8);
        doc.setFontSize(11);
        doc.setFont('helvetica', 'bold');
        doc.text(orderNumber, 10, y);
        var now     = new Date();
        var dateStr = now.toLocaleDateString('en-IN') + '  ' +
                      now.toLocaleTimeString('en-IN', { hour: '2-digit', minute: '2-digit' });
        doc.setFontSize(9);
        doc.text(dateStr, pageW - 10, y, { align: 'right' });
        y += 8;

        // Divider
        doc.setDrawColor(232, 224, 208);
        doc.setLineWidth(0.3);
        doc.line(10, y, pageW - 10, y);
        y += 6;

        // Items header
        doc.setTextColor(158, 144, 128);
        doc.setFontSize(7);
        doc.setFont('helvetica', 'normal');
        doc.text('ITEM',   10,          y);
        doc.text('QTY',    pageW - 40,  y, { align: 'center' });
        doc.text('AMOUNT', pageW - 10,  y, { align: 'right' });
        y += 3;
        doc.line(10, y, pageW - 10, y);
        y += 5;

        // Items
        for (var i = 0; i < orders.length; i++) {
            var item      = orders[i];
            var price     = parseFloat(item.price);
            var itemTotal = price * item.quantity;

            doc.setTextColor(26, 18, 8);
            doc.setFontSize(10);
            doc.setFont('helvetica', 'bold');
            doc.text(item.itemName,                    10,          y);
            doc.text('x' + item.quantity,              pageW - 40,  y, { align: 'center' });
            doc.text('Rs.' + itemTotal.toFixed(2),     pageW - 10,  y, { align: 'right' });
            y += 5;
            doc.setFontSize(8);
            doc.setFont('helvetica', 'normal');
            doc.setTextColor(158, 144, 128);
            doc.text('Rs.' + price.toFixed(2) + ' each', 10, y);
            y += 4;
            doc.setDrawColor(232, 224, 208);
            doc.setLineWidth(0.2);
            doc.line(10, y, pageW - 10, y);
            y += 4;
        }

        y += 2;

        // Subtotal & GST
        doc.setFontSize(9);
        doc.setFont('helvetica', 'normal');
        doc.setTextColor(158, 144, 128);
        doc.text('Subtotal', 10, y);
        doc.setTextColor(26, 18, 8);
        doc.setFont('helvetica', 'bold');
        doc.text('Rs.' + subtotal.toFixed(2), pageW - 10, y, { align: 'right' });
        y += 6;
        doc.setFont('helvetica', 'normal');
        doc.setTextColor(158, 144, 128);
        doc.text('GST (5%)', 10, y);
        doc.setTextColor(26, 18, 8);
        doc.setFont('helvetica', 'bold');
        doc.text('Rs.' + gst.toFixed(2), pageW - 10, y, { align: 'right' });
        y += 4;

        // Grand total
        doc.setDrawColor(26, 18, 8);
        doc.setLineWidth(0.5);
        doc.line(10, y, pageW - 10, y);
        y += 6;
        doc.setFontSize(13);
        doc.setFont('helvetica', 'bold');
        doc.setTextColor(26, 18, 8);
        doc.text('TOTAL', 10, y);
        doc.setTextColor(255, 92, 0);
        doc.text('Rs.' + grand.toFixed(2), pageW - 10, y, { align: 'right' });
        y += 4;
        doc.setDrawColor(26, 18, 8);
        doc.setLineWidth(0.5);
        doc.line(10, y, pageW - 10, y);
        y += 10;

        // Footer
        doc.setFontSize(9);
        doc.setFont('helvetica', 'bold');
        doc.setTextColor(26, 18, 8);
        doc.text('Thank you for dining with us!', pageW / 2, y, { align: 'center' });
        y += 5;
        doc.setFontSize(8);
        doc.setFont('helvetica', 'normal');
        doc.setTextColor(158, 144, 128);
        doc.text('Visit us again soon  •  Bhaskar.Gandham', pageW / 2, y, { align: 'center' });

        doc.save('receipt-' + orderNumber + '.pdf');
    }
</script>

</body>
</html>