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
		<div class="col-md-8">
			<h1>Product Details</h1>

			<!-- Display success/error messages -->
			<c:if test="${msg != null}">
				<div class="alert alert-success">${msg}</div>
			</c:if>
			<c:if test="${err != null}">
				<div class="alert alert-danger">${err}</div>
			</c:if>

			<div class="card">
				<div class="card-header">
					<h3>Product Information</h3>
				</div>
				<div class="card-body">
					<p><strong>ID:</strong> ${product.id}</p>
					<p><strong>Name:</strong> ${product.name}</p>

					<c:if test="${product.details != null}">
						<hr>
						<h4>Product Details</h4>
						<p><strong>Details Name:</strong> ${product.details.name}</p>
						<p><strong>Expiration Date:</strong> ${product.details.expirationDate}</p>
						<p><strong>Manufacturer:</strong> ${product.details.manufacturer}</p>
						<p><strong>Price:</strong> $${product.details.price}</p>
						<p><strong>Available:</strong>
							<c:choose>
								<c:when test="${product.details.available}">Yes</c:when>
								<c:otherwise>No</c:otherwise>
							</c:choose>
						</p>
					</c:if>

					<c:if test="${product.details == null}">
						<div class="alert alert-info">
							No details available for this product.
							<a href="<c:url value='/product/${product.id}/details' />">Add details</a>
                        </div>
                    </c:if>
                </div>
	            <div class="card-footer">
		            <a href="<c:url value='/product/${product.id}/details' />" class="btn btn-warning">
			            <c:choose>
				            <c:when test="${product.details != null}">Edit Details</c:when>
				            <c:otherwise>Add Details</c:otherwise>
			            </c:choose>
		            </a>
		            <a href="<c:url value='/' />" class="btn btn-secondary ml-2">Back to List</a>
		            <form action="<c:url value='/product/${product.id}/delete' />" method="post" style="display:inline;"
		                  class="ml-2">
			            <input type="submit" class="btn btn-danger" value="Delete Product"
			                   onclick="return confirm('Are you sure you want to delete this product?')"/>
		            </form>
	            </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>