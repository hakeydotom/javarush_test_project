<%@ page language="java" contentType="text/html; charset=utf8"  pageEncoding="utf8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<t:head title="Редактирование данных о книге"/>
<body>


<div class="container">

    <h1>Редактирование данных о книге</h1>

    <div class="row">
        <div class="col-sm-6">
            <div class="jumbotron">
                <form:form method="post" action="/editBook" commandName="bookEdit" class="form-horizontal">
                    <input type="hidden" name="OldBookId" value="${bookEdit.id}">

                    <div class="form-group">
                        <label for="title" class="col-sm-2 control-label">Название</label>
                        <div class="col-sm-10">
                            <form:input path="title" class="form-control"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="description" class="col-sm-2 control-label">Описание</label>
                        <div class="col-sm-10">
                            <form:input path="description" class="form-control"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="isbn" class="col-sm-2 control-label">Описание</label>
                        <div class="col-sm-10">
                            <form:input path="isbn" class="form-control"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="printYear" class="col-sm-2 control-label">Год</label>
                        <div class="col-sm-10">
                            <form:input path="printYear" class="form-control"/>
                        </div>
                    </div>

                    <%--<div class="form-group">--%>
                        <%--<label for="readedAlready" class="col-sm-2 control-label">Прочитана?</label>--%>
                        <%--<div class="col-sm-10">--%>
                            <%--<label class="radio-inline">--%>
                                <%--<input type="radio" name="readedAlready" value="yes" ${bookEdit.readedAlready ? 'checked' : ''}> Да--%>
                            <%--</label>--%>
                            <%--<label class="radio-inline">--%>
                                <%--<input type="radio" name="readedAlready" value="no" ${bookEdit.readedAlready ? '' : 'checked'}> Нет--%>
                            <%--</label>--%>
                        <%--</div>--%>
                    <%--</div>--%>

                    <div class="form-group">
                        <input type="submit" value="Обновить" class="btn btn-primary btn-lg pull-right"/>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
</html>
