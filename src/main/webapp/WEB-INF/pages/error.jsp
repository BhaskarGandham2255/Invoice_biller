<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Error Page</title>
<link
	href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=Outfit:wght@300;400;500;600&display=swap"
	rel="stylesheet">
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
	background: radial-gradient(ellipse 60% 80% at 90% 50%, rgba(224, 62, 62, 0.25),
		transparent);
}

.hero::after {
	content: '⚠️';
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
	background: var(--red);
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

/* ── Section ── */
.section {
	max-width: 1100px;
	margin: 48px auto;
	padding: 0 32px;
	flex: 1;
	display: flex;
	align-items: center;
	justify-content: center;
}

/* ── Error Card ── */
.error-card {
	background: var(--surface);
	border: 1px solid var(--border);
	border-radius: 24px;
	box-shadow: var(--shadow-lg);
	padding: 60px 48px;
	text-align: center;
	max-width: 540px;
	width: 100%;
	animation: cardIn 0.5s 0.3s ease both;
}

.error-icon {
	font-size: 52px;
	margin-bottom: 16px;
}

.error-strip {
	height: 4px;
	width: 60px;
	background: linear-gradient(90deg, var(--red), #ff8a80);
	border-radius: 4px;
	margin: 0 auto 24px;
}

.error-title {
	font-family: 'Syne', sans-serif;
	font-size: 1.4rem;
	font-weight: 700;
	color: var(--dark);
	margin-bottom: 12px;
}

.error-desc {
	font-size: 14px;
	color: var(--muted);
	line-height: 1.7;
	margin-bottom: 28px;
}

.error-msg-box {
	background: var(--red-lt);
	border: 1px solid rgba(224, 62, 62, 0.2);
	border-radius: 12px;
	padding: 14px 18px;
	font-size: 13px;
	color: var(--red);
	margin-bottom: 32px;
	text-align: left;
	line-height: 1.6;
}

.error-msg-box strong {
	font-weight: 600;
}

.btn-home {
	display: inline-flex;
	align-items: center;
	gap: 8px;
	background: var(--dark);
	color: #fff;
	font-family: 'Outfit', sans-serif;
	font-size: 14px;
	font-weight: 600;
	padding: 12px 28px;
	border-radius: 12px;
	text-decoration: none;
	transition: background 0.2s, transform 0.15s;
}

.btn-home:hover {
	background: var(--orange);
	transform: scale(1.04);
}

.btn-home:active {
	transform: scale(0.97);
}

/* ── Footer ── */
.page-footer {
	text-align: center;
	padding: 28px;
	color: var(--muted);
	font-size: 12px;
	border-top: 1px solid var(--border);
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
@media ( max-width : 640px) {
	.nav {
		padding: 0 16px;
	}
	.hero {
		padding: 36px 16px 48px;
	}
	.section {
		padding: 0 16px;
		margin: 32px auto;
	}
	.error-card {
		padding: 40px 24px;
	}
}
</style>
</head>
<body>

	<!-- Error Card -->
	<div class="section">
		<div class="error-card">
			<div class="error-icon">❌</div>
			<div class="error-strip"></div>
			<div class="error-title">Something Went Wrong</div>
			<div class="error-desc">
				We ran into an unexpected issue.<br> Please try again or go
				back to the home page.
			</div>

			<c:if test="${not empty errorMsg}">
				<div class="error-msg-box">
					⚠️ <strong>Error Details:</strong> ${errorMsg}
				</div>
			</c:if>

			<a href="${pageContext.request.contextPath}/menu/" class="btn-home">
				🏠 Back to Home </a>
		</div>
	</div>

	<div class="page-footer">Bhaskar.Gandham &nbsp;·&nbsp; Made with
		❤️ for food lovers</div>

</body>
</html>
