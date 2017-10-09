<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<t:head title="Новая книга"/>
<body>
<div class="container">

    <h1>Новая книга</h1>

    <div class="row">
        <div class="col-sm-6">
            <div class="jumbotron">
                <form:form method="post" action="addBook" commandName="book" class="form-horizontal">
                    <div class="form-group">
                        <label for="title" class="col-sm-2 control-label">Название</label>
                        <div class="col-sm-10">
                            <form:input path="title" class="form-control"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Описание</label>
                        <div class="col-sm-10">
                            <form:input path="description" class="form-control"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Автор</label>
                        <div class="col-sm-10">
                            <form:input path="author" class="form-control"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">ISBN</label>
                        <div class="col-sm-10">
                            <form:input path="isbn" class="form-control"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Год написания</label>
                        <div class="col-sm-10">
                            <form:input path="printYear" class="form-control"/>
                        </div>
                    </div>



                    <%--<div class="form-group">--%>
                        <%--<label class="col-sm-2 control-label">Уже прочитана?</label>--%>
                        <%--<div class="col-sm-10">--%>
                            <%--<label class="radio-inline">--%>
                                <%--<input type="radio" name="readedAlready" value="yes"> Да--%>
                            <%--</label>--%>
                            <%--<label class="radio-inline">--%>
                                <%--<input type="radio" name="readedAlready" value="no" checked> Нет--%>
                            <%--</label>--%>
                        <%--</div>--%>
                    <%--</div>--%>

                    <div class="form-group">
                        <input type="submit" value="Добавить" class="btn btn-primary btn-lg pull-right"/>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>