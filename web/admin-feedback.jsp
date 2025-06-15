<%-- 
    Document   : admin-feedback.jsp
    Created on : Jun 14, 2025, 4:20:37 PM
    Author     : Admin
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý Feedback</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ccc;
        }
        th {
            background-color: #f2f2f2;
        }
        .pagination {
            margin-top: 20px;
        }
        .pagination a {
            padding: 8px 12px;
            margin: 0 2px;
            background-color: #e0e0e0;
            border: 1px solid #ccc;
            text-decoration: none;
        }
        .pagination a.active {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>
    <h1>Danh sách phản hồi từ khách hàng</h1>

    <form method="get" action="/Spa/admin/feedback">
        <input type="text" name="search" placeholder="Tìm kiếm nội dung..." value="${search}" />
        <select name="rating">
            <option value="">-- Chọn đánh giá --</option>
            <c:forEach var="i" begin="1" end="5">
                <option value="${i}" <c:if test="${param.rating == i}">selected</c:if>>${i} sao</option>
            </c:forEach>
        </select>
        <select name="status">
            <option value="">-- Đã phản hồi? --</option>
            <option value="1" <c:if test="${status == '1'}">selected</c:if>>Đã phản hồi</option>
            <option value="0" <c:if test="${status == '0'}">selected</c:if>>Chưa phản hồi</option>
        </select>
        <select name="sortBy">
            <option value="">-- Sắp xếp theo --</option>
            <option value="CreatedAt" <c:if test="${sortBy == 'CreatedAt'}">selected</c:if>>Ngày tạo</option>
            <option value="Rating" <c:if test="${sortBy == 'Rating'}">selected</c:if>>Đánh giá</option>
        </select>
        <select name="sortOrder">
            <option value="asc" <c:if test="${sortOrder == 'asc'}">selected</c:if>>Tăng dần</option>
            <option value="desc" <c:if test="${sortOrder == 'desc'}">selected</c:if>>Giảm dần</option>
        </select>
        <button type="submit">Lọc</button>
    </form>

    <table>
        <tr>
            <th>ID</th>
            <th>Người gửi</th>
            <th>Nội dung</th>
            <th>Đánh giá</th>
            <th>Đã phản hồi?</th>
            <th>Ngày tạo</th>
        </tr>
        <c:forEach var="fb" items="${feedbacks}">
            <tr>
                <td>${fb.id}</td>
                <td>${fb.userId}</td>
                <td>${fb.content}</td>
                <td>${fb.rating} ⭐</td>
                <td><c:choose>
                        <c:when test="${fb.responded}">✅</c:when>
                        <c:otherwise>❌</c:otherwise>
                    </c:choose>
                </td>
                <td>${fb.createdAt}</td>
            </tr>
        </c:forEach>
    </table>

    <div class="pagination">
        <c:forEach var="i" begin="1" end="${totalPages}">
            <a href="admin/feedback?page=${i}" class="${i == currentPage ? 'active' : ''}">${i}</a>
        </c:forEach>
    </div>
</body>
</html>
