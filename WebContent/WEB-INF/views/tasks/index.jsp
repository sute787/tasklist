<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
		<c:if test="${flush != null}">
		    <div id="flush_success">
		        <c:out value="${flush}"></c:out>
		    </div>
		</c:if>
		<h2>タスク一覧</h2>
		<table>
            <tbody>
                <thead>
                    <tr>
                        <th>タスクID</th>
                        <th>タスクタイトル</th>
                        <th>タスク内容</th>
                        <th>タスク期限</th>
                        <th>作成日時</th>
                        <th>更新日時</th>
                    </tr>
                    <c:forEach var="task" items="${tasks}">
	                    <tr>
	                        <td><a href="${pageContext.request.contextPath}/show?id=${task.id}"><c:out value="${task.id}" /></a></td>
	                        <td><c:out value="${task.title}" /></td>
	                        <td><c:out value="${task.content}" /></td>
	                        <td><fmt:formatDate value="${task.deadline_at}" pattern="yyyy-MM-dd" /></td>
	                        <td><fmt:formatDate value="${task.created_at}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	                        <td><fmt:formatDate value="${task.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>


		<div id="pagination">
		    （全 ${tasks_count} 件）<br />
		    <c:forEach var="i" begin="1" end="${((tasks_count - 1) / 15) + 1}" step="1">
		        <c:choose>
		            <c:when test="${i == page}">
		                <c:out value="${i}" />&nbsp;
		            </c:when>
		            <c:otherwise>
		                <a href="${pageContext.request.contextPath}/index?page=${i}"><c:out value="${i}" /></a>&nbsp;
		            </c:otherwise>
		        </c:choose>
		    </c:forEach>
		</div>
		<p><a href="${pageContext.request.contextPath}/new">新規タスクの投稿</a></p>
    </c:param>
</c:import>