<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp"%>

<!-- Page header with logo and tagline-->
<header>
	<div class="my-header-text">
		<h1>MyBlog</h1>
		<p class="lead mb-0">stories and ideas</p>
		<p>${principal.getUsername()}</p>
	</div>
</header>
<!-- Page content-->
<div class="container">
	<div class="row">
		<!-- Blog entries-->
		<div class="col-lg-8">
			<!-- Featured blog post-->
			<div class="card mb-4">
				<div class="card-header my-card-header">
					<div class="my-postInfo-top justify-content-between">
						<div class="my-postInfo-top">
							<img class="my-profile-img my-mr1" src="/image/no_profile_img.jpg" />
							<div class="my-bold">nickname</div>
						</div>
						<div class="my-font-small">2024년 1월 25일</div>
					</div>
				</div>

				<div class="my-postInfo-middle">
					<div class="my-postInfo-img">
						<img alt="" src="../image/kakao.png">
					</div>
					<div class="card-body">
						<div class="my-postInfo-right">
							<div>
								<h2 class="card-title">카카오</h2>
								<p class="card-text">KAKAO TALK</p>
							</div>

							<div class="my-end my-font-small">
								<p>댓글 0 좋아요 0</p>
								<a class="btn btn-dark my-ml1" href="#!">Read More ></a>
							</div>
						</div>
					</div>
				</div>

			</div>
<!-- Featured blog post-->
			<div class="card mb-4">
				<div class="card-header my-card-header">
					<div class="my-postInfo-top justify-content-between">
						<div class="my-postInfo-top">
							<img class="my-profile-img my-mr1" src="/image/no_profile_img.jpg" />
							<div class="my-bold">nickname</div>
						</div>
						<div class="my-font-small">2024년 1월 25일</div>
					</div>
				</div>

				<div class="my-postInfo-middle">
					<div class="my-postInfo-img">
						<img alt="" src="../image/google.png">
					</div>
					<div class="card-body">
						<div class="my-postInfo-right">
							<div>
								<h2 class="card-title">구글</h2>
								<p class="card-text">Google is good</p>
							</div>

							<div class="my-end my-font-small">
								<p>댓글 0 좋아요 0</p>
								<a class="btn btn-dark my-ml1" href="#!">Read More ></a>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- Featured blog post-->
			<div class="card mb-4">
				<div class="card-header my-card-header">
					<div class="my-postInfo-top justify-content-between">
						<div class="my-postInfo-top">
							<img class="my-profile-img my-mr1" src="/image/no_profile_img.jpg" />
							<div class="my-bold">nickname</div>
						</div>
						<div class="my-font-small">2024년 1월 25일</div>
					</div>
				</div>

				<div class="my-postInfo-middle">
					<div class="my-postInfo-img">
						<img alt="" src="../image/naver.png">
					</div>
					<div class="card-body">
						<div class="my-postInfo-right">
							<div>
								<h2 class="card-title">네이버</h2>
								<p class="card-text">Naver Line 치지직</p>
							</div>

							<div class="my-end my-font-small">
								<p>댓글 0 좋아요 0</p>
								<a class="btn btn-dark my-ml1" href="#!">Read More ></a>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- Pagination-->
			<nav aria-label="Pagination">
				<hr class="my-0" />
				<ul class="pagination justify-content-center my-4">
					<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">이전</a></li>
					<li class="page-item active" aria-current="page"><a class="page-link" href="#!">1</a></li>
					<li class="page-item"><a class="page-link" href="#!">2</a></li>
					<li class="page-item"><a class="page-link" href="#!">3</a></li>
					<li class="page-item"><a class="page-link" href="#!">4</a></li>
					<li class="page-item"><a class="page-link" href="#!">5</a></li>
					<li class="page-item"><a class="page-link" href="#!">다음</a></li>
				</ul>
			</nav>
		</div>
		<!-- Side widgets-->
		<div class="col-lg-4">
			<!-- Categories widget-->
			<div class="card mb-4">
				<div class="card-header my-card-header">카테고리</div>
				<div class="card-body my-catrgory-box">
					<div class="my-category">
						<a href="#!" class="btn btn-success" onclick="alert('준비중!')">내블로그</a>
						<a href="/blogWrite" class="btn btn-success">글쓰기</a>
						<a href="#!" class="btn btn-primary" onclick="alert('준비중!')">ToDo</a>
					</div>
					<div class="my-category">
						<a href="#!" class="btn btn-dark" onclick="alert('준비중!')">ㄱㄴㄷ</a>
						<a href="#!" class="btn btn-dark" onclick="alert('준비중!')">ABC</a>
						<a href="#!" class="btn btn-danger" onclick="alert('준비중!')">あかさ</a>
					</div>
				</div>
			</div>
			<!-- Recomend widget-->
			<div class="card mb-4">
				<div class="card-header my-card-header">추천</div>
				<div class="card-body">...</div>
			</div>
			<!-- Side widget-->
			<div class="card mb-4">
				<div class="card-header my-card-header">위젯</div>
				<div class="card-body">기타 API</div>
			</div>
		</div>
	</div>
</div>

<div class="my-side-btn">
	<button class="rollUp" onclick="window.scrollTo(0,0);">
		<img src="../image/top.png" alt="top">
	</button>
</div>
<%@ include file="layout/footer.jsp"%>