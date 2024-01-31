<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<!-- Page header with logo and tagline-->
<header>
	<div class="my-header-text my-bg-img2">
		<h1>Individual User's Blog</h1>
		<p class="lead mb-0">stories and ideas</p>
	</div>
</header>
<!-- Page content-->
<div class="container">
	<div class="row">
		<!-- Blog entries-->
		<div class="col-lg-8">
		<c:choose>
    	<c:when test="${not empty boards.content}">
			<!-- Featured blog post-->
			<c:forEach var="board" items="${boards.content}">
			<div class="card mb-4">
				<div class="card-header my-card-header">
					<div class="my-postInfo-top justify-content-between">
						<div class="my-postInfo-top">
							<img class="my-profile-img my-mr1" src="/image/no_profile_img.jpg" />
							<div class="my-bold"><a class="my-writer" href="/${board.user.id}">${board.user.nickname}</a></div>
						</div>
						<div class="my-font-small">
							<c:set var="rawCreateDate" value="${board.createDate}" />
							<fmt:parseDate var="parsedDate" value="${rawCreateDate}" pattern="yyyy-MM-dd HH:mm:ss.SSS" />
							<fmt:formatDate value="${parsedDate}" pattern="yyyy년 M월 d일" var="formattedDate"/>
							${formattedDate}
						</div>
					</div>
				</div>

				<div class="my-postInfo-middle">
					<div class="my-postInfo-img">
						<img alt="" src="../image/kakao.png">
					</div>
					<div class="card-body my-postInfo-main">
						<div class="my-postInfo-right">
							<div class="my-postInfo-titlecontent">
								<h2 class="card-title my-postInfo-title">${board.title}</h2>
								<div class="card-text my-postInfo-content">${board.content}</div>
							</div>

							<div class="my-end my-font-small">
								<p>댓글 ${board.replyCount} 좋아요 0</p>
								<a class="btn btn-dark my-ml1" href="/${board.user.id}/board/${board.id}">More ></a>
							</div>
						</div>
					</div>
				</div>

			</div>
			</c:forEach>
			
			<!-- 페이징 start -->
			<div class="pagination justify-content-center my-4">
		    	<c:choose>
					<c:when test="${currentPage lt 5}">
					<a class="page-link my-pre-page disabled" tabindex="-1" aria-disabled="true">이전</a>
					</c:when>
					<c:otherwise>
					<a class="page-link my-pre-page" href="/${id}?page=${startPage - pageBlock}" tabindex="-1" aria-disabled="true">이전</a>
					</c:otherwise>
				</c:choose>	
		    	<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
		        <c:choose>
		            <c:when test="${i eq boards.number}">
		                <a class="page-link active" href="/${id}?page=${i}">${i}</a>
		            </c:when>
		            <c:otherwise>
		                <a class="page-link" href="/${id}?page=${i}">${i}</a>
		            </c:otherwise>
		        </c:choose>
		        </c:forEach>
				<c:choose>
				<c:when test="${currentPage ge (boards.totalPages - (boards.totalPages % pageBlock))}">
					<a class="page-link my-next-page disabled">다음</a>
				</c:when>
				<c:otherwise>				
					<a class="page-link my-next-page" href="/${id}?page=${startPage + pageBlock}">다음</a>
				</c:otherwise>
				</c:choose>
			</div>
			<!-- 페이징 end -->
		</c:when>
    		<c:otherwise>
<!-- ㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅ -->
			<div class="card mb-4">
				<div class="my-postInfo-middle my-m-position my-col">
				<h5>작성하신 게시글이 없습니다.</h5><br>
					<div class="button-container-2">
						<span class="mas">블로그</span>
						<button>블로그</button>
					</div>
				</div>
			</div>      		  
<!-- ㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅ -->
   		 	</c:otherwise>
		</c:choose>
		</div>
		
		<!-- Side widgets-->
		<div class="col-lg-4">
			<!-- Categories widget-->
			<div class="card mb-4">
				<div class="card-header my-card-header">카테고리</div>
				<div class="card-body my-catrgory-box">
					<div class="my-category">
						<a href="/${principal.user.id}" class="btn btn-success">내블로그</a>
						<a href="/board/blogWrite" class="btn btn-success">글쓰기</a>
						<a href="#!" class="btn btn-primary" onclick="alert('준비중!')">ToDo</a>
					</div>
					<div class="my-category">
						<a href="#!" class="btn btn-dark" onclick="alert('준비중!')">메인과</a>
						<a href="#!" class="btn btn-dark" onclick="alert('준비중!')">다른거</a>
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
	<a id="scr_btn" href="#">
		<img src="../image/top.png" alt="top">
	</a>
</div>
<%@ include file="../layout/footer.jsp"%>