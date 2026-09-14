<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Categories - SKRozaanaBazaar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>

    <div class="container mt-5">
        <h2>Shop By Category</h2>
        <hr>
        <div class="row">
            <c:forEach var="cat" items="${categories}">
                <div class="col-md-3 mb-4">
                    <a href="CategoryServlet?id=${cat.id}" class="text-decoration-none">
                        <div class="card text-center p-3 category-card">
                            <img src="images/categories/${cat.image}" class="card-img-top mx-auto" style="width: 100px; height: 100px;" alt="${cat.name}">
                            <div class="card-body">
                                <h5 class="card-title text-dark">${cat.name}</h5>
                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>

    <%@ include file="includes/footer.jsp" %>
</body>
</html>
