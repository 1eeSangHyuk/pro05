<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

        <title>QnA 상세보기</title>
                
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="./resources/assets/favicon.ico" />
        
        <!-- CSS (includes Bootstrap) -->
        <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>	  
		  	    
	    <!-- Custom styles for this template -->
	    <!--<link href="${pageContext.request.contextPath}/resources/css/product.css" rel="stylesheet">-->
    	<link href="${pageContext.request.contextPath}/resources/css/carousel.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/color-modes.js"></script>
	
	<style>
		.container-wrap {
			margin-top: 120px;
			position: relative;
			min-height: 100%;
		    padding-bottom: 250px;
			bottom:0px;
		}
		
		.shadow {
			width: 1000px;
			display: flex;
			margin: 0 auto;
		}
	</style>
</head>
<body>

<!-- Header -->
<c:import url="/WEB-INF/views/include/top_menu.jsp"></c:import>	

<!-- 맛집 리스트 글쓰기 -->
	<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-sm-12">
				<div class="card shadow">
					<div class="card-body">
						<h3 class="text-center card-title">
							<strong>QnA 상세보기</strong>
						</h3>
						<label for="qna_id">작성자</label> <input type="text" id="qna_id"
							name="qna_id" class="form-control"
							value="${qnaDetailBean.qna_id }" disabled="disabled" />
					</div>
					<div class="form-group">
						<label for="qna_resdate">작성날짜</label> <input type="text"
							id="qna_resdate" name="qna_resdate" class="form-control"
							value="${qnaDetailBean.qna_resdate }" disabled="disabled" />
					</div>
					<div class="form-group">
						<label for="qna_title">제목</label> <input type="text"
							id="qna_title" name="qna_title" class="form-control"
							value="${qnaDetailBean.qna_title }" disabled="disabled" />
					</div>
					<div class="form-group">
						<label for="qna_content">내용</label>
						<textarea id="qna_content" name="qna_content" class="form-control"
							rows="10" style="resize: none" disabled="disabled">${qnaDetailBean.qna_content }</textarea>
					</div>
					<div class="form-group">
						<div class="text-right">
							<a href="${root }qna/main?page=${page }" class="btn btn-primary">목록보기</a>
							<c:if test="${sid == qnaDetailBean.qna_id}">
								<a href="${root }qna/modify?qna_idx=${qna_idx}&page=${page}"
									class="btn btn-info">수정하기</a>
								<a href="${root }qna/delete?qna_idx=${qna_idx}&page=${page}"
									class="btn btn-danger">삭제하기</a>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-12" style="margin-top: 20px;">
				<div class="card shadow">
					<div class="card mb-2">
						<div class="card-body">
							<h4 style="text-align: center;">답글달기</h4>
						</div>
						<div class="card-body">
							<form:form action="${root }qna/qnaReply_procedure" method="post"
								modelAttribute="replyQnaBean">
								<form:input type="hidden" path="qna_title"/>
								<input type="hidden" id="page" name="page" value="${page }" />
								<input type="hidden" id="parno" name="parno" value="${qna_idx }" />
								<input type="hidden" id="numb1" name="numb1" value="${qna_idx }" />
								<input type="hidden" id="qna_idx" name="qna_idx"
									value="${qna_idx }" />
								<input type="hidden" id="qna_id" name="qna_id" value="${sid }" />
								<form:textarea path="qna_content" class="form-control" rows="10"
									style="resize:none" />
								<form:errors path="qna_content" style="color:red;" /><br>
								<form:button>댓글등록</form:button>
							</form:form>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-12" style="margin-top: 20px;">
				<div class="card shadow">
					<div class="card-body">
						<h3 style="text-align: center;">REPLY</h3>
					</div>
					<table class="table table-hover" id='답변을 달아줘'>
						<thead>
							<tr>
								<th class="text-center d-none d-md-table-cell">내용</th>
								<th class="text-center d-none d-md-table-cell">작성자</th>
								<th class="text-center d-none d-md-table-cell">작성일</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="replyQnaBean" items="${qnaReplyList }">
								<c:if test="${replyQnaBean.parno==qnaDetailBean.qna_idx}">
									<tr>
										<td class="text-center d-none d-md-table-cell">${replyQnaBean.qna_content }</td>
										<td class="text-center d-none d-md-table-cell">${replyQnaBean.qna_id }</td>
										<td class="text-center d-none d-md-table-cell">${replyQnaBean.qna_resdate }</td>
										<td>
										<c:if test="${replyQnaBean.qna_id.equals(sid) }">
		                  <a href="/qna/modify?qna_idx=${replyQnaBean.qna_idx}&qna_id=${replyQnaBean.qna_id }&page=${page}&lev1_qna_idx=${qna_idx }" class="btn btn-outline-danger" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">수정</a>
		                  <a href="/qna/deleteReply?qna_idx=${replyQnaBean.qna_idx}&qna_id=${replyQnaBean.qna_id }&page=${page}" class="btn btn-outline-danger" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">삭제</a>
		                </c:if>
		                </td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/include/bottom_menu.jsp"></c:import>
   <!-- Bootstrap core JS-->
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
   <!-- Core theme JS-->
   <script src="${root }/resources/js/scripts.js"></script>
</body>
</html>