<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%--        import Bootstrap--%>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css" />">

    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css" />">

</head>
<body>
<div class="container mt-5">
	<div class="row justify-content-center">
		<div class="col-md-6">
			<h1>Add New Product</h1>

			<!-- Display validation errors -->
			<c:if test="${msg != null}">
				<div class="alert alert-success">${msg}</div>
			</c:if>
			<c:if test="${err != null}">
				<div class="alert alert-danger">${err}</div>
			</c:if>

			<form:form action="${pageContext.request.contextPath}/product/add" method="post" modelAttribute="product">
				<div class="form-group">
					<label for="name">Product Name</label>
					<form:input type="text" cssClass="form-control" path="name" placeholder="Enter product name"/>
					<form:errors path="name" cssClass="error text-danger"/>
				</div>

				<div class="form-group mt-3">
					<input type="submit" class="btn btn-primary" value="Add Product"/>
					<a href="<c:url value='/' />" class="btn btn-secondary ml-2">Cancel</a>
				</div>
			</form:form>
        </div>
    </div>
</div>
</body>
</html>