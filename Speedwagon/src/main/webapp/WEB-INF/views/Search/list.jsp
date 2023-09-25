<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<head>
<%@include file="../include/head.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>

	<!--  Body Wrapper -->
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">

		<!-- Sidebar Start -->
		<%@include file="../include/sidebar.jsp"%>
		<!--  Sidebar End -->

		<!--  Main wrapper -->
		<div class="body-wrapper">
			<!--  Header Start -->

			<!-- nav -->
			<%@include file="../include/nav.jsp"%>

			<div class="container-fluid">
				<div class="row">
					<div class="card-body">

						<!-- <div class="d-sm-flex d-block align-items-center mb-9"> -->
						<div
							class="d-sm-flex d-block align-items-center justify-content-between mb-9">
							<div class="navbar">
								<div class="mb-0 mb-sm-0">
									<select data-toggle="select"
										class="form-select form-select-sm bg-white bg-op-9 text-sm w-lg-50">
										<option value="n"
											<c:out value="${cri.searchType == null?'selected':''}"/>>
											게시판 검색</option>
										<option value="t"
											<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
											제목</option>
										<option value="c"
											<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
											내용</option>
										<option value="w"
											<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
											작성자</option>
										<option value="tc"
											<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
											제목 OR 내용</option>
										<option value="cw"
											<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
											내용 OR 작성자</option>
										<option value="tcw"
											<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
											제목 OR 내용 OR 작성자</option>
									</select>
								</div>
								<div class="mb-0 mb-sm-0">
									<input type="text" data-toggle='keyword' id="keywordInput"
										class="form-control form-control-sm" value='${cri.keyword}'>
								</div>

								<div class="mb-0 mb-sm-0">
									<button class="btn btn-primary fs-1 lh-sm" id='searchBtn'>검색</button>
								</div>
							</div>


							<!-- 게시판 카테고리 -->
							<div class="col-auto ml-auto">
								<div class="navbar">
									<div class="col-auto ml-auto">

										<select class="form-select form-select-sm bg-white bg-op-9 text-sm w-lg-50"
											tabindex="-98">
											<option>Categories</option>
											<option>Learn</option>
											<option>Share</option>
											<option>Build</option>
										</select>

									</div>
									<button class="btn btn-primary fs-1 lh-sm" id='newBtn'>게시물
										쓰기</button>
								</div>
							</div>
						</div>

						<!-- 게시글 -->
						<c:forEach items="${list }" var="BoardDTO">
							<div
								class="card row-hover pos-relative py-3 px-3 mb-3 border-warning border-top-0 border-right-0 border-bottom-0 rounded-0">
								<div class="row align-items-center">
									<div class="col-md-8 mb-3 mb-sm-0">
										<span class="k1"> No. ${BoardDTO.num }</span>

										<h5>
											<strong> <a
												href='detail_page${pageMaker.makeQuery(pageMaker.cri.page)}&num=${BoardDTO.num}'
												class="text-primary">${BoardDTO.title }</a>
											</strong>
										</h5>
										<!-- 댓글 미리보기 예시 -->
										<!-- <div class="text-sm op-5"> <a class="text-black mr-2" href="#">#C++</a></div> -->
									</div>

									<div class="col-md-4 op-7">
										<div class="row text-center op-7">
											<div class="col px-1">
												<i class="ti ti-thumb-up"></i> <span class="d-block text-sm">Likes</span>
											</div>
											<div class="col px-1">
												<i class="ti ti-eye"></i> <span class="d-block text-sm">${BoardDTO.cnt }
													Views</span>
											</div>
										</div>
									</div>

								</div>
							</div>
						</c:forEach>
						<!-- /-게시글 -->

					</div>

				</div>
				<div>
					<nav aria-label="Page navigation exmaple">
						<ul class="pagination">

							<!-- 페이징 Prev 버튼 넘어갈 목록이 있으면 활성/비활  -->
							<c:if test="${pageMaker.prev}">
								<li class="page-item"><a class="page-link"
									href="list=${pageMaker.makeSearch(pageMaker.startPage - 1) }"
									aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li class="page-item"><a
									class="page-link <c:out value="${pageMaker.cri.page == idx?' active':''}"/>"
									href="list${pageMaker.makeSearch(idx) }">${idx }</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li class="page-item"><a class="page-link"
									href="list${pageMaker.makeSearch(pageMaker.endPage +1) }"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>

		</div>
	</div>
	<%@include file="../include/js.jsp"%>
	<script>
				
		var result = '${msg}';
		if (result == 'success') {
			Swal.fire('게시물이 등록 되었습니다.',
					'목록으로 돌아갑니다',
					'success')
		} else if (result == "modify") {
			Swal.fire('게시물이 수정 되었습니다.',
					'목록으로 돌아갑니다',
					'success')
		} else if (result == "delete") {
			Swal.fire('게시물이 삭제 되었습니다.',
					'목록으로 돌아갑니다',
					'success')
		}
		
		$(document).ready(
				function() {
					$('#searchBtn').on(
							"click",
							function(event) {
								self.location = "list"
										+ '${pageMaker.makeQuery(1)}'
										+ "&searchType="
										+ $("select option:selected").val()
										+ "&keyword="
										+ encodeURIComponent($('#keywordInput')
												.val());
							});
					$('#newBtn').on("click", function(evt) {

						self.location = "submit";
					});

				});
		
	</script>
</body>

</html>