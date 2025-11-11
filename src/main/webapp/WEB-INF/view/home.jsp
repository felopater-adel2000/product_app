<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%--        import Bootstrap--%>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css" />">

    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css" />">

</head>
<body>
<h1>Products Data</h1>

<!-- Display success/error messages -->
<c:if test="${msg != null}">
	<div class="alert alert-success">${msg}</div>
</c:if>
<c:if test="${err != null}">
	<div class="alert alert-danger">${err}</div>
</c:if>

<div class="tbl-div">
    <table class="table">
        <thead class="thead-dark">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Show Details</th>
	        <th scope="col">Add/Update Details</th>
            <th scope="col">Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${products}" var="item">
            <tr>
                <td>${item.id}</td>
                <td>${item.name}</td>
                <td>
	                <a href="<c:url value='/product/${item.id}' />" class="btn btn-primary">View Details</a>
                </td>
                <td>
	                <a href="<c:url value='/product/${item.id}/details' />" class="btn btn-warning">Add/Update
		                Details</a>
                </td>
                <td>
	                <form action="<c:url value='/product/${item.id}/delete' />" method="post" style="display:inline;">
		                <input type="submit" class="btn btn-danger" value="Delete"
		                       onclick="return confirm('Are you sure you want to delete this product?')"/>
	                </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <form:form action="product/add">
        <input type="submit" class="btn btn-success" value="Add new Product"/>
    </form:form>
</div>
</body>

</html>