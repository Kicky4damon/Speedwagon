<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<head>
<title>ㅎㅎㅎ</title>
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
			<%@include file="include/nav.jsp"%>
			<div class="container-fluid">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title fw-semibold mb-4">게시물 수정</h5>
						<div class="card">
							<div class="card-body">
								<form role="form" method="post">
									<!--
									<div class="mb-3">
										<label for="selectCategory" class="form-label">카테고리</label> <select
											name="category" class="form-control">
											<option value="일상">일상</option>
											<option value="전문기술">전문기술</option>
											<option value="자기계발">자기계발</option>
										</select>
										<div id="subject" class="form-text">카테고리를 선택해주세요</div>
									</div>-->
									<div class="mb-3">
										<label for="subjectmodify" class="form-label">제목</label>
										<input type="text" name="title" class="form-control" id="subject_input"
											aria-describedby="subjectHelp" value="${boardDTO.title }">
										<div id="subject" class="form-text">수정 할 텍스트를 입력해주세요.</div>
									</div>
									<div class="mb-3">
										<label for="Contentmodify" class="form-label">본문내용</label>
										<div class="text-section col pb-10">
											<textarea id="contentmodify" name="content"class="form-control"
												 onkeydown="resize(this)" onkeyup="resize(this)">${boardDTO.content }</textarea>
										</div>
									</div>
									<button type="button" class="btn btn-outline-primary backlistBtn"
									>뒤로가기</button>
									<button type="submit" class="btn btn-outline-primary submitBtn" formmethod="POST">수정하기</button>
									<button type="reset" class="btn btn-outline-primary" >초기화</button>
								</form>
							</div>
						</div>


					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function resize(obj) {
			obj.style.height = '1px';
			obj.style.height = (12 + obj.scrollHeight) + 'px';
		}
		
		$(document).ready(function(){
			
			var formObj = $("form[role='form']");
			
			console.log(formObj);
			$(".backlistBtn").on("click", function(){
				self.location ="/board/listPage?page=${cir.page}&perPageNum=${cri.perPageNum}";
			});
			
			$(".submitBtn").on("click", function(){
				formObj.submit();
			});
			
		});
		
	</script>
	<%@include file="include/js.jsp"%>
</body>

</html>