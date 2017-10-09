<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="tag" uri="/WEB-INF/taglibs/customTaglib.tld" %>

<html>
<t:head title="Книги"/>

<body>
<div class="container">

    <h1 class="mb-3">Книги</h1>

    <div class="row">
        <div class="col-sm-4">
            <form role="search" class="mb-2" action="/books/search" method="post">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Поиск по названию" name="search">
                    <span class="input-group-btn">
                        <button type="submit" class="btn btn-default">Поиск</button>
                    </span>
                </div>
            </form>
        </div>


    <table class="table">
        <thead>
        <tr class="cart_menu">
            <th>ID</th>
            <th>Название</th>
            <th class="text-center">Описание</th>
            <th class="text-center">Автор</th>
            <th class="text-center">Год издания</th>
            <th class="text-center">ISBN</th>
            <th class="text-center">Прочитана?</th>
            <th></th>
            <th></th>
        </tr>
        </thead>

        <c:forEach var="book" items="${books}" varStatus="bookItr">
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
                    <p> ${book.author}</p>
                </td>

                <td class="text-center">
                    <p> ${book.printYear}</p>
                </td>

                <td class="text-center">
                    <p> ${book.isbn}</p>
                </td>

                <td class="text-center">

                    <p>${book.readedAlready ? '<span class="glyphicon glyphicon-plus"></span>' : '<span class="glyphicon glyphicon-minus"></span>'}</p>
                </td>

                <td class="text-center">
                    <form action="/books/edit" method="POST">
                        <input type="hidden" name="bookEdit" value="${book.id}">
                        <input type="submit" name="submit" value="Редактировать" class="btn btn-default btn-sm">
                    </form>
                </td>

                <td class="text-center">
                    <form action="/readed" method="POST">
                        <input type="hidden" name="bookReaded" value="${book.id}">
                        <input type="submit" name="submit" value="Отметить прочитанной" class="btn btn-default btn-sm">
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

        <div class="col-sm-8">
            <a class="btn btn-primary pull-right" href="/addBook">Создать книгу</a>
        </div>
    </div>

    <tag:paginate max="10" offset="${offset}" count="${count}" uri="/books" next="&raquo;" previous="&laquo;"/>
</div>


</body>
</html>
