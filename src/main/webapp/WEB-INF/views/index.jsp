<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp"%>

<!-- 페이지 태그라인 start -->
<header>
	<div class="my-header-text my-bg-img1 my-font1">
		<h1>MyBlog</h1>
		<p class="lead mb-0">stories and ideas</p>
	</div>
</header>
<!-- 페이지 태그라인 end -->

<!-- 페이지 내용 start -->
<div class="container">
	<div class="row">
		<!-- 페이지 내용 (좌측) start -->
		<div class="col-lg-8">
		<c:choose>
    	<c:when test="${not empty boards.content}">
			<!-- 글리스트 start -->
			<c:forEach var="board" items="${boards.content}">
			<div class="card mb-4">
				<div class="card-header my-card-header">
					<div class="my-postInfo-top justify-content-between">
						<div class="my-postInfo-top">
						<div class="my-profile-img-box-s my-mr1">
							<img class="" src="${board.user.profilePath}" onerror="this.src='/image/no_profile_img.jpg'"/>
						</div>
							<div class="my-bold">
								<a class="my-writer" href="/${board.user.id}">${board.user.nickname}</a>
							</div>
						</div>
						<div class="my-font-small">
							<c:set var="rawCreateDate" value="${board.createDate}" />
							<fmt:parseDate var="parsedDate" value="${rawCreateDate}" pattern="yyyy-MM-dd HH:mm:ss.SSS" />
							<fmt:formatDate value="${parsedDate}" pattern="yyyy년 M월 d일" var="formattedDate" />
							${formattedDate}
						</div>
					</div>
				</div>
				<div class="my-postInfo-middle">
					<c:if test="${not empty board.thumbnail}">
					    <div class="my-postInfo-img">
					        <img alt="썸네일" src="${board.thumbnail}">
					    </div>
					</c:if>
					<div class="card-body my-postInfo-main">
						<div class="my-postInfo-right">
							<div class="my-postInfo-titlecontent">
								<h2 class="card-title my-postInfo-title">${board.title}</h2>
								<div class="card-text my-postInfo-content">${board.content}</div>
							</div>
							<div class="my-end my-font-small">
								<p>댓글 ${board.replyCount} 좋아요 ${board.likeCount}</p>
								<a class="btn btn-dark my-ml1" href="/${board.user.id}/board/${board.id}">More ></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
			<!-- 글리스트 end -->
			
			<!-- 페이징 start -->
			<div class="pagination justify-content-center my-4">
				<c:choose>
					<c:when test="${currentPage lt 5}">
						<a class="page-link my-pre-page disabled" tabindex="-1" aria-disabled="true">이전</a>
					</c:when>
					<c:otherwise>
						<a class="page-link my-pre-page" href="/?page=${startPage - pageBlock}" tabindex="-1" aria-disabled="true">이전</a>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<c:choose>
						<c:when test="${i eq boards.number}">
							<a class="page-link active" href="/?page=${i}">${i}</a>
						</c:when>
						<c:otherwise>
							<a class="page-link" href="/?page=${i}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${currentPage ge (boards.totalPages - (boards.totalPages % pageBlock))}">
						<a class="page-link my-next-page disabled">다음</a>
					</c:when>
					<c:otherwise>
						<a class="page-link my-next-page" href="/?page=${startPage + pageBlock}">다음</a>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- 페이징 end -->
			
		</c:when>
    		<c:otherwise> <!-- 게시글이 없을 때 -->
			<div class="card mb-4">
				<div class="my-postInfo-middle my-m-position my-col">
				<h5>작성하신 게시글이 없습니다.</h5><br>
					<div class="button-container-2">
						<span class="mas">블로그</span>
						<button>블로그</button>
					</div>
				</div>
			</div>    
   		 	</c:otherwise>
		</c:choose>	
		</div>
		<!-- 페이지 내용 (좌측) end -->
		
		<!-- 페이지 내용 (우측) start -->
		<div class="col-lg-4">
			<div class="card mb-4"> <!-- Widget 1 -->
				<div class="card-header my-card-header">카테고리</div>
				<div class="card-body my-catrgory-box">
					<div class="my-category-down">
						<c:choose>
							<c:when test="${empty principal}">
								<a href="/loginForm" class="btn btn-primary prim">내블로그</a>
							</c:when>
							<c:otherwise>
								<a href="/${principal.user.id}" class="btn btn-primary prim">내블로그</a>
							</c:otherwise>
						</c:choose>
						<a href="/board/blogWrite" class="btn btn-success succ">글쓰기</a>
					</div>
				</div>
			</div>
			<div class="card mb-4"> <!-- Widget 2 -->
				<div class="card-header my-card-header">날씨</div>
				<div class="card-body">
					<div class="weather-box">
						<div>
							<h5 class="city"></h5><p class="icon"></p>
							<div class="my-row my-center"><p class="ctemp"></p><p>°C</p></div>
						</div>
						<div class="weather2">
							<h5 class="city"></h5><p class="icon"></p>
							<div class="my-row my-center"><p class="ctemp"></p><p>°C</p></div>
						</div>
						<div>
							<h5 class="city"></h5><p class="icon"></p>
							<div class="my-row my-center"><p class="ctemp"></p><p>°C</p></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 페이지 내용 (우측) end -->
	</div>
</div>
<!-- 페이지 내용 end -->

<script src="/js/features/weather.js"></script>
<%@ include file="layout/footer.jsp"%>