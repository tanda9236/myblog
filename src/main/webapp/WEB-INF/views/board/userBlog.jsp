<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<!-- 페이지 태그라인 start -->
<header>
	<div class="my-header-text my-bg-img2">
		<h1>${user.nickname}의 블로그</h1>
		<h4 class="mb-0 my-mt0">${user.intro}</h4>
		<div class="blog-header-btn">
		<c:if test="${user.id == principal.user.id}">
			<a href="/board/blogWrite" class="btn btn-success succ my-h40 my-mr0">글쓰기</a>
		</c:if>
		<c:choose>
			<c:when test="${empty principal}">
				<a class="btn btn-danger my-h40 dang" onclick="alert('로그인 후 이용하실 수 있습니다.')">후원</a>
			</c:when>
			<c:otherwise>
				<a class="btn btn-danger my-h40 dang" onclick="openDonate()">후원</a>
			</c:otherwise>
		</c:choose>
		</div>
	</div>
</header>
<!-- 페이지 태그라인 end -->

<!-- 페이지 내용 start -->
<div class="container">
	<div class="row" style="justify-content: center;">
		<div class="col-lg-9">
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
	</div>
</div>
<!-- 페이지 내용 end -->

<!-- Modal Start -->
<div id="myModal" class="modal">
	<div class="my-modal-content">
		<span class="md-close">&times;</span>
		<div class="donate-info">
			<img class="donate-img" src="${user.profilePath}" onerror="this.src='/image/no_profile_img.jpg'" alt="profile">
			<div class="donate-text">
				<h4 class="my-bold">${user.nickname}</h4>
				<p>이 블로그에 후원</p>
			</div>
		</div>
		<div class="text-center my-mt1">
			<input id="payeeId" type="hidden" value="${user.id}">
			<input id="blogName" type="hidden" value="${user.nickname}">
			<input id="nickname" type="hidden" value="${principal.user.nickname}">
			<input id="email" type="hidden" value="${principal.user.email}">
			<input id="price" type="hidden" value="1990">
			<p>₩1,990</p>
			<div class="button-container-2 my-mt4" style="width: 120px;">
				<span class="mas">후원</span>
				<button id="pay-btn">후원</button>
				<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
				<script src="/js/payment.js"></script>
			</div>
		</div>
	</div>
</div>
<!-- Modal End -->

<script src="/js/features/modal.js"></script>
<%@ include file="../layout/footer.jsp"%>