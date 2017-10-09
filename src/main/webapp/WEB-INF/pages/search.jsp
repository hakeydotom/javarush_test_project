<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="tag" uri="/WEB-INF/taglibs/customTaglib.tld" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<html>
<t:head title="Поиск"/>
<body>

<div class="container">
    <h1 class="mb-3">Поиск книги</h1>

    <div class="row">
        <div class="col-sm-4">
            <form role="search" class="mb-2" action="/books/search" method="post">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Поиск по имени" name="search">
                    <span class="input-group-btn">
                        <button type="submit" class="btn btn-default">Поиск</button>
                    </span>
                </div>
            </form>
        </div>
    </div>

    <c:choose>
        <c:when test="${noResults}">
            <div class="alert alert-warning">Ничего не найдено</div>
        </c:when>
        <c:otherwise>

            <table class="table">
                <thead>
                <tr class="cart_menu">
                    <th>ID</th>
                    <th>Название</th>
                    <th class="text-center">Год</th>
                    <th class="text-center">Уже прочитана?</th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>

                <c:forEach var="book" items="${searchBooks}" varStatus="bookItr">
                    <tr>
                        <td>
                                ${offset + bookItr.index + 1}
                        </td>
                        <td>
                            <p>${book.title}</p>
                        </td>
                        <td class="text-center">
                            <p> ${book.description}</p>
                        </td>
                        <td class="text-center">

                            <p>${book.readedAlready ? '<span class="glyphicon glyphicon-ok"></span>' : '<span class="glyphicon glyphicon-remove"></span>'}</p>
                        </td>

                        <td class="text-center">
                            <form action="/books/edit" method="POST">
                                <input type="hidden" name="bookEdit" value="${book.id}">
                                <input type="submit" name="submit" value="Редактировать" class="btn btn-default btn-sm">
                            </form>
                        </td>

                        <td class="text-center">
                            <form action="/delete" method="POST">
                                <input type="hidden" name="bookDeleted" value="${book.id}">
                                <input type="submit" name="submit" value="Удалить" class="btn btn-default btn-sm">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>

            <tag:paginate max="15" offset="${offset}" count="${count}" uri="/books" next="&raquo;" previous="&laquo;"/>

        </c:otherwise>
    </c:choose>
</div>
</body>
</html>