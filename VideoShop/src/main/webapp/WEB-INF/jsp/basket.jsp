<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.joda.org/joda/time/tags" prefix="joda" %>
<%@ taglib uri="http://www.salespoint-framework.org/web/taglib" prefix="sp" %>

<!DOCTYPE html>

<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" type="text/css"	href="<c:url value="/res/css/style.css" />" />
	<title><spring:message code="shoppingBasket.title" /></title>
</head>
<body>
	<div class="all">
		<header>
			<h1><spring:message code="shoppingBasket.title" /></h1>
			<jsp:include page="templates/navigation.jsp" />
		</header>
	
		<div class="content">
			<c:choose>
				<c:when test="${!isEmpty}">
					<table>
						<caption><spring:message code="shoppingBasket.title" /></caption>
						<thead>
							<tr>
								<th><spring:message code="shoppingBasket.movieTitle" /></th>
								<th><spring:message code="shoppingBasket.count" /></th>
								<th><spring:message code="catalog.price" /></th>
							</tr>
						</thead>
						<tbody>
							<sp:forEach var="orderline" items="${order.orderLines}">
								<tr>
									<td>${orderline.productName}</td>
									<td>${orderline.quantity}</td>
									<td>${orderline.price}</td>
								</tr>
							</sp:forEach>
						</tbody>
					</table>
					<p><spring:message code="shoppingBasket.sum" />: ${order.totalPrice}</p>
					<div style="width=5em;margin:auto;">
						<form method="post" action="buy">
							<button type="submit"><spring:message code="shoppingBasket.buy" /></button>
						</form>
					</div>
				</c:when>
				<c:otherwise>
					<p><spring:message code="shoppingBasket.empty" /></p>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>