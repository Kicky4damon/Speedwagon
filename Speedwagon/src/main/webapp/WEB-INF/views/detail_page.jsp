<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<head>
<%@include file="include/head.jsp"%>
</head>

<body>

	<!--  Body Wrapper -->
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">

		<!-- Sidebar Start -->
		<%@include file="include/sidebar.jsp"%>
		<!--  Sidebar End -->

		<!--  Main wrapper -->
		<div class="body-wrapper">
			<!--  Header Start -->

			<!-- nav -->
			<%@include file="include/nav.jsp"%>
			<div class="container-fluid">
				<div class="container-fluid">
					<div class="card">
						<div class="card-body">
							<div class="card-body p-4">
								<div
									class="d-sm-flex d-block align-items-center justify-content-between mb-0">
									<h5 class="card-title fw-semibold mb-0">Category</h5>
									<span class="k1"> <strong>No. ${board.num }</strong>
									</span>
								</div>
								<hr>
								<!-- 여기서 부터 작성 -->
								<div
									class="d-sm-flex d-block align-items-center justify-content-between mb-9">
									<span class="k2"> <strong>조회수</strong> | ${board.cnt }
									</span> <span class="k2"> <strong>작성일</strong> | ${board.date }
									</span>
								</div>
								<table class="table table-hover">
									<thead>
										<tr>
											<th scope="col"><h4>
													<strong>${board.title }</strong>
												</h4></th>
										</tr>

										<tr>
											<td><i class="ti ti-user"></i><strong>${board.member_nickname }</strong></td>
										</tr>

										<tr height="1" bgcolor="#f5f5f5">
											<td colspan="4">${board.content }<br> <br> <br>
												<br></td>
										</tr>
								</table>

								<button type="submit" class="btn btn-outline-primary goListBtn" formmethod="POST"
									onclick="location.href='listPage?page=${cri.page}&perPageNum=${cri.perPageNum}'">목록으로</button>
									
								<button type="submit" class="btn btn-outline-primary modyfyBtn" formmethod="POST"
									onclick="location.href='modifyPage?num=${board.num}'">수정하기
								</button>
								
								<button type="submit" class="btn btn-outline-primary removeBtn" formmethod="POST"
									onclick="location.href='board_delete?num=${board.num}&page=${cri.page }&perPageNum=${cri.perPageNum }'">삭제하기
								</button>
								<button type="submit" class="btn btn-outline-primary articleBtn" formmethod="POST"
									onclick="location.href='article_Insert?num=${board.num}&member=${nickname}'">댓글작성
								</button>
								
								<!-- 페이지 뒤에 번호 삽입하는 꼼수 -->
								<form role="form" action="modifyPage" method="post">

								<input type='hidden' name='num' value="${boardDTO.num}">
								<input type='hidden' name='page' value="${cri.page}">
								<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
								
								</form>
								
								<!-- 	
				<c:forEach var="article" items="${article }">
					<thead>
						<div>
							<div class="article">
								<i class="fas fa-fw fa-user"></i><strong>${article.FK_u_number }</strong>
							</div>
							<div>${article.a_context }
								<button class="btn btn-outline btn-sm border-none">
									<a
										href="article_Modify?a_number=${article.a_number}&user=${user}&b_number=${board.b_number}">수정</a>
								</button>
								<button class="btn btn-outline btn-sm border-none">
									<a
										href="article_Remove?a_number=${article.a_number}&user=${user}&b_number=${board.b_number}">삭제</a>
								</button>
							</div>
				</c:forEach> -->
							</div>
							<br>



						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="include/js.jsp"%>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		
		var formobj = $("form[role='form']");
		console.log(formObj);
		$(".modyfyBtn").on("click," function(){
			formObj.attr("method", "get");
			formObj.attr("action", "/board/modify");
			formObj.submit();
		});
		
		$(".removeBtn").on("click", function(){
			formObj.attr("method", "post");
			formObj.attr("action", "/board_delete");
			formObj.submit();
		});
		
		$(".goListBtn").on("click", function(){
			formObj.attr("action", "/board/listPage");
			formObj.submit();
		});
		
	});
</script>
</html>