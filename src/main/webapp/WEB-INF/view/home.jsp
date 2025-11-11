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
<div class="tbl-div">
    <table class="table">
        <thead class="thead-dark">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Show Details</th>
            <th scope="col">Add/Update</th>
            <th scope="col">Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${productsList}" var="item">
            <tr>
                <td>${item.id}</td>
                <td>${item.name}</td>
                <td>
                    <form:form action="showProductDetails">
                        <input type="submit" class="btn btn-primary" value="View Details"/>
                    </form:form>
                </td>
                <td>
                    <form:form action="updateProduct">
                        <input type="submit" class="btn btn-warning" value="Add/update Details"/>
                    </form:form>
                </td>
                <td>
                    <form:form action="deleteProduct">
                        <input type="submit" class="btn btn-danger" value="Delete"/>
                    </form:form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <form:form action="addProduct">
        <input type="submit" class="btn btn-success" value="Add new Product"/>
    </form:form>
</div>
</body>

</html>