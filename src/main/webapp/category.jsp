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
        <h2 class="text-center mb-4">Shop By Category</h2>
        <div class="row">
            <c:forEach var="cat" items="${categories}">
                <div class="col-md-3 col-6 mb-4">
                    <a href="CategoryServlet?id=${cat.id}" class="text-decoration-none">
                        <div class="card text-center p-3 category-card h-100 shadow-sm border">
                            <c:set var="catImg" value="https://via.placeholder.com/150?text=${cat.name}" />
                            <c:choose>
                                <c:when test="${cat.id == 1}"><c:set var="catImg" value="https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=200&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 2}"><c:set var="catImg" value="https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=200&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 3}"><c:set var="catImg" value="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=200&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 4}"><c:set var="catImg" value="https://images.unsplash.com/photo-1593305841991-05c297ba4575?w=200&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 5}"><c:set var="catImg" value="https://images.unsplash.com/photo-1617137968427-85924c800a22?w=200&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 6}"><c:set var="catImg" value="https://images.unsplash.com/photo-1618244972963-dbee1a7edc95?w=200&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 7}"><c:set var="catImg" value="https://images.unsplash.com/photo-1515488042361-404e9250afef?w=200&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 8}"><c:set var="catImg" value="https://images.unsplash.com/photo-1542838132-92c53300491e?w=200&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 9}"><c:set var="catImg" value="https://images.unsplash.com/photo-1599490659223-930b45c227f4?w=200&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 10}"><c:set var="catImg" value="https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=200&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 11}"><c:set var="catImg" value="https://images.unsplash.com/photo-1556911220-e15b29be8c8f?w=200&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 12}"><c:set var="catImg" value="https://images.unsplash.com/photo-1585832770489-2b6921125342?w=200&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 13}"><c:set var="catImg" value="https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=200&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 14}"><c:set var="catImg" value="https://images.unsplash.com/photo-1550684848-fac1c5b4e853?w=200&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 15}"><c:set var="catImg" value="https://images.unsplash.com/photo-1461896836934-ffe607ba8211?w=200&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 16}"><c:set var="catImg" value="https://images.unsplash.com/photo-1606813907291-d86efa9b94db?w=200&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 17}"><c:set var="catImg" value="https://images.unsplash.com/photo-1486006920555-c77dce18193b?w=200&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 18}"><c:set var="catImg" value="https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=200&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 19}"><c:set var="catImg" value="https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=200&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 20}"><c:set var="catImg" value="https://images.unsplash.com/photo-1497633762265-9d179a990aa6?w=200&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 21}"><c:set var="catImg" value="https://images.unsplash.com/photo-1516734212186-a967f81ad0d7?w=200&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 22}"><c:set var="catImg" value="https://images.unsplash.com/photo-1504148455328-c376907d081c?w=200&auto=format&fit=crop" /></c:when>
                            </c:choose>
                            <img src="${catImg}" class="card-img-top mx-auto rounded" style="width: 120px; height: 120px; object-fit: cover;" alt="${cat.name}">
                            <div class="card-body p-2 d-flex align-items-center justify-content-center">
                                <h5 class="card-title text-dark font-weight-bold m-0" style="font-size: 1rem;">${cat.name}</h5>
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
