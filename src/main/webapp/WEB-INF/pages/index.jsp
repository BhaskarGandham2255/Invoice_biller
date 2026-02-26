<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Menu</title>
    <link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=Outfit:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg:        #f7f4ef;
            --surface:   #ffffff;
            --orange:    #ff5c00;
            --orange-lt: #fff0e8;
            --dark:      #1a1208;
            --text:      #2e2510;
            --muted:     #9e9080;
            --border:    #e8e0d0;
            --green:     #1eaa6a;
            --green-lt:  #e6f7f0;
            --red:       #e03e3e;
            --red-lt:    #fdeaea;
            --shadow:    0 4px 24px rgba(26,18,8,0.08);
            --shadow-lg: 0 12px 40px rgba(26,18,8,0.14);
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            background: var(--bg);
            font-family: 'Outfit', sans-serif;
            color: var(--text);
            min-height: 100vh;
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

        .nav-logo span { color: var(--orange); }

        .nav-right {
            display: flex;
            align-items: center;
            gap: 8px;
            background: rgba(255,255,255,0.08);
            border-radius: 20px;
            padding: 6px 14px;
            color: #fff;
            font-size: 13px;
            font-weight: 500;
        }

        .nav-right .dot {
            width: 8px; height: 8px;
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
            background: radial-gradient(ellipse 60% 80% at 90% 50%, rgba(255,92,0,0.25), transparent);
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

        .hero-inner { position: relative; z-index: 1; max-width: 1100px; margin: 0 auto; }

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
            color: rgba(255,255,255,0.45);
            font-size: 15px;
            animation: fadeUp 0.5s 0.2s ease both;
        }

        /* ── Stats ── */
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

        .stat-icon { font-size: 22px; }

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

        /* ── Section ── */
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

        .section-title span { color: var(--orange); }

        .item-count {
            font-size: 13px;
            color: var(--muted);
            background: var(--border);
            padding: 4px 14px;
            border-radius: 20px;
        }

        /* ── Grid ── */
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
        }

        /* ── Card ── */
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

        .card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-lg);
        }

        .card:nth-child(1)  { animation-delay: 0.35s; }
        .card:nth-child(2)  { animation-delay: 0.40s; }
        .card:nth-child(3)  { animation-delay: 0.45s; }
        .card:nth-child(4)  { animation-delay: 0.50s; }
        .card:nth-child(5)  { animation-delay: 0.55s; }
        .card:nth-child(6)  { animation-delay: 0.60s; }
        .card:nth-child(7)  { animation-delay: 0.65s; }
        .card:nth-child(8)  { animation-delay: 0.70s; }
        .card:nth-child(9)  { animation-delay: 0.75s; }
        .card:nth-child(10) { animation-delay: 0.80s; }

        .card-strip {
            height: 5px;
            background: linear-gradient(90deg, var(--orange), #ffb347);
        }

        .card-strip.off { background: var(--border); }

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
            width: 30px; height: 30px;
            background: var(--orange-lt);
            color: var(--orange);
            border-radius: 8px;
            font-size: 12px;
            font-weight: 700;
            font-family: 'Syne', sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
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

        .avail-badge.yes { background: var(--green-lt); color: var(--green); }
        .avail-badge.no  { background: var(--red-lt);   color: var(--red); }
        .avail-badge .dot { width: 6px; height: 6px; border-radius: 50%; }
        .avail-badge.yes .dot { background: var(--green); }
        .avail-badge.no  .dot { background: var(--red); }

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

        /* ── Card Footer ── */
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

        /* ── Order Button ── */
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

        .btn-order:hover  { background: #e04e00; transform: scale(1.04); }
        .btn-order:active { transform: scale(0.97); }

        .btn-order.disabled {
            background: var(--border);
            color: var(--muted);
            cursor: not-allowed;
        }

        /* ── Empty ── */
        .empty {
            text-align: center;
            padding: 80px 20px;
            animation: fadeUp 0.5s ease both;
        }

        .empty-emoji { font-size: 56px; margin-bottom: 16px; }

        .empty h3 {
            font-family: 'Syne', sans-serif;
            font-size: 1.4rem;
            color: var(--dark);
            margin-bottom: 8px;
        }

        .empty p { color: var(--muted); font-size: 14px; }

        /* ── Footer ── */
        .page-footer {
            text-align: center;
            padding: 28px;
            color: var(--muted);
            font-size: 12px;
            border-top: 1px solid var(--border);
            margin-top: 20px;
        }

        /* ── Animations ── */
        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(16px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        @keyframes cardIn {
            from { opacity: 0; transform: translateY(20px) scale(0.97); }
            to   { opacity: 1; transform: translateY(0)   scale(1); }
        }

        @media (max-width: 640px) {
            .nav, .hero { padding-left: 16px; padding-right: 16px; }
            .stats, .section { padding: 0 16px; }
            .grid { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>

<!-- Nav -->
<nav class="nav">
    <div class="nav-logo">Bhaskar<span>.</span>Gandham</div>
    <div class="nav-right">
        <div class="dot"></div>
        Kitchen Open
    </div>
</nav>

<!-- Hero -->
<div class="hero">
    <div class="hero-inner">
        <div class="hero-tag">Fresh &amp; Delicious</div>
        <h1>What would you<br>like to eat today?</h1>
        <p>Browse our menu and place your order instantly.</p>
    </div>
</div>

<c:choose>
    <c:when test="${not empty items}">

        <!-- Stats Pills -->
        <div class="stats">
            <div class="stat-pill">
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
                        <c:set var="avail" value="0"/>
                        <c:forEach var="i" items="${items}">
                            <c:if test="${i.available}">
                                <c:set var="avail" value="${avail + 1}"/>
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

        <!-- Menu Grid -->
        <div class="section">
            <div class="section-header">
                <div class="section-title">Our <span>Menu</span></div>
                <div class="item-count">${fn:length(items)} items</div>
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
                                        <span class="avail-badge yes">
                                            <span class="dot"></span> Available
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="avail-badge no">
                                            <span class="dot"></span> Unavailable
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </div>

                            <div class="card-name">${item.itemName}</div>
                            <div class="card-desc">${item.description}</div>
                        </div>

                        <div class="card-footer">
                            <div class="price-block">
                                <div class="lbl">Price</div>
                                <div class="amount"><sup>₹</sup>${item.price}</div>
                            </div>

                            <c:choose>
                                <c:when test="${item.available}">
                                    <form action="placeOrder" method="post">
                                        <input type="hidden" name="itemName" value="${item.itemName}"/>
                                        <input type="hidden" name="price"    value="${item.price}"/>
                                        <button type="submit" class="btn-order">
                                            Add
                                        </button>
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <span class="btn-order disabled">Add</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </c:forEach>
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

<div class="page-footer">Bhaskar.Gandham &nbsp;·&nbsp; Made with ❤️ for food lovers</div>

</body>
</html>
