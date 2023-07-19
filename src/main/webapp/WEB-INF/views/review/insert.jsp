<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	<link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
	<h2>reviewInsert</h2>
	<form:form action="/review/insertReview" method="post" modelAttribute="reviewBean" enctype="multipart/form-data" >
		<%-- <form:hidden path="rs_idx"/> --%>
		<form:label path="rev_title">제목</form:label>
		<form:input type="text" path="rev_title"/><br>
		<form:errors path="rev_title" style="color:red;" /><br>
		
		<form:label path="rev_score">점수</form:label>
		<form:input type="number" path="rev_score"/><br>
		<form:errors path="rev_score" style="color:red;" /><br>
		
		<%-- <form:hidden path="rev_id"/> --%>
		
		<!-- accept="image/*  :  이미지 파일 확장자는 전부 첨부 가능 -->
		<form:label path="upload_file">첨부 이미지</form:label>
		<form:input type="file" path="upload_file" accept="image/*"/><br>
		
		<form:label path="rev_content">내용</form:label>
		<form:textarea path="rev_content"/><br>
		<form:errors path="rev_content" style="color:red;" /><br>
		
		<form:button type="submit">제출</form:button>
	</form:form>
</body>
</html>