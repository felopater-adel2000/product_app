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
			<h1>Product Details</h1>

			<!-- Display validation errors -->
			<c:if test="${msg != null}">
				<div class="alert alert-success">${msg}</div>
			</c:if>
			<c:if test="${err != null}">
				<div class="alert alert-danger">${err}</div>
			</c:if>

			<form:form action="${pageContext.request.contextPath}/product/${productId}/details" method="post"
			           modelAttribute="details">
				<div class="form-group">
					<label for="name">Details Name</label>
					<form:input type="text" cssClass="form-control" path="name" placeholder="Enter details name"/>
					<form:errors path="name" cssClass="error text-danger"/>
                </div>

	            <div class="form-group">
		            <label for="expirationDate">Expiration Date</label>
		            <form:input type="date" cssClass="form-control" path="expirationDate"/>
		            <form:errors path="expirationDate" cssClass="error text-danger"/>
	            </div>

	            <div class="form-group">
		            <label for="manufacturer">Manufacturer</label>
		            <form:input type="text" cssClass="form-control" path="manufacturer"
		                        placeholder="Enter manufacturer"/>
		            <form:errors path="manufacturer" cssClass="error text-danger"/>
	            </div>

	            <div class="form-group">
		            <label for="price">Price</label>
		            <form:input type="number" cssClass="form-control" path="price" step="0.01" placeholder="0.00"/>
		            <form:errors path="price" cssClass="error text-danger"/>
	            </div>

	            <div class="form-group">
		            <label for="available">Available</label>
		            <form:select cssClass="form-control" path="available">
			            <form:option value="">-- Select Availability --</form:option>
			            <form:option value="true">Yes</form:option>
			            <form:option value="false">No</form:option>
		            </form:select>
		            <form:errors path="available" cssClass="error text-danger"/>
	            </div>

	            <div class="form-group mt-3">
		            <input type="submit" class="btn btn-primary" value="Save Details"/>
		            <a href="<c:url value='/product/${productId}' />" class="btn btn-secondary ml-2">Cancel</a>
		            <a href="<c:url value='/' />" class="btn btn-outline-secondary ml-2">Back to List</a>
	            </div>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>