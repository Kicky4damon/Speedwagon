<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

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

			<div class="container">
				<div class="row">

					<!-- 뭉탱이 -->
					<div class="col-lg-9 mb-3">
						<div class="row text-left mb-5">
							<div class="col-lg-6 mb-3 mb-sm-0">
								<div
									class="dropdown bootstrap-select form-control form-control-lg bg-white bg-op-9 text-sm w-lg-50"
									style="width: 100%;">
									<select
										class="form-control form-control-lg bg-white bg-op-9 text-sm w-lg-50"
										data-toggle="select" tabindex="-98">
										<option>Categories</option>
										<option>Learn</option>
										<option>Share</option>
										<option>Build</option>
									</select>
								</div>
							</div>
						</div>

						<!-- 게시글 -->
						<c:forEach items="${list }" var="BoardDTO">

							<div
								class="card row-hover pos-relative py-3 px-3 mb-3 border-warning border-top-0 border-right-0 border-bottom-0 rounded-0">
								<div class="row align-items-center">
									<div class="col-md-8 mb-3 mb-sm-0">
										<h5>
											<a href="detail?num=${BoardDTO.num }" class="text-primary">${BoardDTO.title }</a>
										</h5>
										<!-- 댓글 미리보기 예시 -->
										<!-- <div class="text-sm op-5"> <a class="text-black mr-2" href="#">#C++</a></div> -->
									</div>

									<div class="col-md-4 op-7">
										<div class="row text-center op-7">
											<div class="col px-1">
												<i class="ion-connection-bars icon-1x"></i> <span
													class="d-block text-sm">Likes</span>
											</div>
											<div class="col px-1">
												<i class="ion-ios-eye-outline icon-1x"></i> <span
													class="d-block text-sm">${BoardDTO.cnt } Views</span>
											</div>
										</div>
									</div>

								</div>
							</div>
						</c:forEach>
						<!-- /-게시글 -->

					</div>
					<!-- /뭉탱이 -->

				</div>
				<div>
				<nav aria-label="Page navigation example">
					<ul class="pagination">

						<!-- 페이징 Prev 버튼 넘어갈 목록이 있으면 활성/비활  -->
						<c:if test="${pageMaker.prev}">
							<li class="page-item"><a class="page-link"
								href="listCri?page=${pageMaker.startPage - 1}"
								aria-label="Previous">&laquo;</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }" var="idx">
							<li class="page-item"
								<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
								<a class="page-link" href="listCri?page=${idx }">${idx }</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li class="page-item"><a class="page-link"
								href="listCri?page=${pageMaker.endPage +1}" aria-label="Next">
								&raquo;</a></li>
						</c:if>
					</ul>
				</nav>
				</div>
			</div>

		</div>
	</div>
	<%@include file="include/js.jsp"%>
</body>
<script>
	var result = '${msg}';
	if (result == 'success') {
		alert("게시물이 등록 되었습니다.");
	} else if (result == "modify") {
		alert("게시물이 수정 되었습니다.");
	}
</script>

</html>