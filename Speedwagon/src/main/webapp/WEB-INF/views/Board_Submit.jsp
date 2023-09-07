<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!doctype html>
<html lang="kr">

<head>
<%@include file="include/head.jsp"%>
<title>ㅎㅎㅎ</title>
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
						<h5 class="card-title fw-semibold mb-4">게시물 쓰기</h5>
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
										<label for="subjectInput" class="form-label">제목</label>
										<input type="subjectInput" name="title" class="form-control" id="subject_input"
											aria-describedby="subjectHelp" placeholder="제목을 입력해주세요.">
										<div id="subject" class="form-text">제목은 필수 항목입니다.</div>
									</div>
									<div class="mb-3">
										<label for="ContentInput" class="form-label">본문내용</label>
										<div class="text-section col pb-10">
											<textarea id="contentInput" name="content"class="form-control"
												placeholder="본문 내용을 입력해주세요" onkeydown="resize(this)"
												onkeyup="resize(this)"></textarea>
										</div>
									</div>
									<button type="submit" class="btn btn-primary">글 쓰기</button>
									<button type="reset" class="btn btn-primary">초기화</button>
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
	</script>
</body>

</html>