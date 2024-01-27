<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp"%>

<!-- Page header with logo and tagline-->
<header>
	<div class="my-header-text">
		<h1>MyBlog</h1>
		<p class="lead mb-0">stories and ideas</p>
		<p>${principal.getUsername()},${principal.user.id}</p>
	</div>
</header>
<!-- Page content-->
<div class="container">
	<div class="row">
		<!-- Blog entries-->
		<div class="col-lg-8">

			<!-- Featured blog post-->
			<c:forEach var="board" items="${boards.content}">
			<div class="card mb-4">
				<div class="card-header my-card-header">
					<div class="my-postInfo-top justify-content-between">
						<div class="my-postInfo-top">
							<img class="my-profile-img my-mr1" src="/image/no_profile_img.jpg" />
							<div class="my-bold"><a class="my-writer" href="/${board.user.id}">${board.user.username}</a></div>
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
								<p>댓글 0 좋아요 0</p>
								<a class="btn btn-dark my-ml1" href="/${board.user.id}/board/${board.id}">More ></a>
							</div>
						</div>
					</div>
				</div>

			</div>
			</c:forEach>
			
			<!-- Pagination-->
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
		
		</div>
		
		<!-- Side widgets-->
		<div class="col-lg-4">
			<!-- Categories widget-->
			<div class="card mb-4">
				<div class="card-header my-card-header">카테고리</div>
				<div class="card-body my-catrgory-box">
					<div class="my-category">
					
						<c:choose>
						<c:when test="${empty principal}">
							<a href="/loginForm" class="btn btn-success">내블로그</a>
						</c:when>
						<c:otherwise>
							<a href="/${principal.user.id}" class="btn btn-success">내블로그</a>
						</c:otherwise>
						</c:choose>
						
						<a href="/board/blogWrite" class="btn btn-success">글쓰기</a>
						<a href="#!" class="btn btn-primary" onclick="alert('준비중!')">ToDo</a>
					</div>
					<div class="my-category">
						<a href="#!" class="btn btn-dark" onclick="alert('준비중!')">준비중!</a>
						<a href="#!" class="btn btn-dark" onclick="alert('준비중!')">준비중!</a>
						<a href="#!" class="btn btn-danger" onclick="alert('준비중!')">준비중!</a>
					</div>
				</div>
			</div>
			<!-- Recomend widget-->
			<div class="card mb-4">
				<div class="card-header my-card-header">추천</div>
				<div class="card-body">
					...
				</div>
			</div>
			<!-- Side widget-->
			<div class="card mb-4">
				<div class="card-header my-card-header">위젯</div>
				<div class="card-body">
					<div class="weather-box">
						<div class="weather1">
							<h5>Seoul</h5>
							<p class="icon1"></p>
							<div class="my-row"><p class="ctemp1"></p><p>°C</p></div>
						</div>
						<div class="weather2">
							<h5>Busan</h5>
							<p class="icon2"></p>
							<div class="my-row"><p class="ctemp2"></p><p>°C</p></div>
						</div>
						<div class="weather3">
							<h5>Incheon</h5>
							<p class="icon3"></p>
							<div class="my-row"><p class="ctemp3"></p><p>°C</p></div>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="my-side-btn">
	<button class="rollUp" onclick="window.scrollTo(0,0);">
		<img src="../image/top.png" alt="top">
	</button>
</div>
<script>
$.getJSON('https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=ba939557ede20833440726417d9f3f0f&units=metric', function(result){
    $('.ctemp1').append(result.main.temp);
    var wiconUrl = '<img src="https://openweathermap.org/img/wn/'+result.weather[0].icon+'.png" alt="'+result.weather[0].description+'">'
    $('.icon1').html(wiconUrl);
    var ct = result.dt;
});
$.getJSON('https://api.openweathermap.org/data/2.5/weather?q=Busan&appid=ba939557ede20833440726417d9f3f0f&units=metric', function(result){
    $('.ctemp2').append(result.main.temp);
    var wiconUrl = '<img src="https://openweathermap.org/img/wn/'+result.weather[0].icon+'.png" alt="'+result.weather[0].description+'">'
    $('.icon2').html(wiconUrl);
    var ct = result.dt;
});
$.getJSON('https://api.openweathermap.org/data/2.5/weather?q=Incheon&appid=ba939557ede20833440726417d9f3f0f&units=metric', function(result){
    $('.ctemp3').append(result.main.temp);
    var wiconUrl = '<img src="https://openweathermap.org/img/wn/'+result.weather[0].icon+'.png" alt="'+result.weather[0].description+'">'
    $('.icon3').html(wiconUrl);
    var ct = result.dt;
});
</script>
<%@ include file="layout/footer.jsp"%>