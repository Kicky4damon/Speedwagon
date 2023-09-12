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
						<h5 class="card-title fw-semibold mb-4">${exception.toString() }</h5>
						<div class="card">
							<div class="card-body">
								<ul>
									<c:forEach items="${exception.getStackTrace()}" var="stack">
										<li>${stack.toString() }</li>
									</c:forEach>
								</ul>
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