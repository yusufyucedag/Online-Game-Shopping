<%@page import="com.handstand.util.MyUtils"%>
<%@page import="com.handstand.entity.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	<link rel="stylesheet" type="text/css" href="css/style.css">  
	<title>Ürünleri Düzenle</title>
</head>
<body>

	<jsp:include page="_header.jsp"></jsp:include>
	<jsp:include page="_menu.jsp"></jsp:include>

	<p class="text-danger">${errorMessage}</p>
	
	<%
		Admin loginedAdmin = MyUtils.getLoginedAdmin(session);
		if (loginedAdmin == null) {
	%>
		<h3 class="text-danger">Erişim Hakkınız Yok</h3>
		
	<% } else { %>
	
	<h3 class="text-info">Ürünleri Düzenle</h3>

		<form method="POST" action="${pageContext.request.contextPath}/editProduct">
			<input type="hidden" name="code" value="${products.code}" />
			<table class="table table-dark table-striped font-weight-bold">
				<tr>
					<td>Ürün Barkod Kodu : </td>
					<td>${products.code}</td>
				</tr>
				
				<tr>
					<td>Ürünün Platform Adı : </td>
					<td>${products.platformName}</td>
				</tr>
				
				<tr>
					<td>Ürünün Kategori Adı : </td>
					<td>${products.categoryName}</td>
				</tr>
					
				<tr>
					<td>Ürünün Adı : </td>
					<td><input class="form-control font-weight-bold"  type="text" name="productName" value="${products.productName}" /></td>
				</tr>
				<tr>
					<td>Ürünün Fiyatı : </td>
					<td><input class="form-control font-weight-bold" type="text" name="price" value="${products.price}"/></td>
				</tr>
				<tr>
					<td>Stok Durumu</td>
					<td><input class="form-control font-weight-bold" type="text" name="stockAmount" value="${products.stockAmount}" required="required"/></td>
				</tr>
				<tr>
					<td>Ürünün Resmi</td>
					<td><input class="form-control font-weight-bold" type="file" name="image" value="${products.image}" required="required"/></td>
				</tr>
				<tr>
					<td>Ürünün Açıklaması</td>
					<td><input class="form-control font-weight-bold" type="text" name="description" value="${products.description}" required="required"/></td>
				</tr>
				
				<tr>
					<td></td>
					<td colspan="2"><input class="btn btn-success" type="submit" value="Kaydet" /> 
					<a class="btn btn-danger" href="${pageContext.request.contextPath}/listProduct">İptal Et</a></td>
				</tr>
			</table>
		</form>
	<%} %>
	<jsp:include page="_footer.jsp"></jsp:include>
	
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>