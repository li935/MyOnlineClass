<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="64x64" href="${contextPath}/resources/image/classtok_favi4fa9.png" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title> 클래스톡 :: 함께 배우는 온라인 클래스 강의, 수업, 강좌 - 클래스톡 </title>

<!-- 폰트 스타일 시트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<!-- 부트 스트랩 스타일 시트 -->
<link rel="stylesheet"
	  href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	  integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	  crossorigin="anonymous">
    
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<!-- Swiper API -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">

<!-- 새로고침 시 페이지 상단으로 이동 -->
<!-- <script>history.scrollRestoration = "manual"</script> -->

<!-- 다중 Autocomplete -->
<script type="text/javascript">
	$(function() {
		$( "#searchKeyNav, #searchKeyBody" ).autocomplete({
		  source: '${contextPath}/move/popular',
		  delay: 200,
		  select: function(event, ui) {
		  	window.location.href = "detail?reserve=" + JSON.stringify(ui.item.value).replace(/\"/gi, "");
		  }
		});
	});
</script>

<!-- jquery 를 이용하여 화면 맨위로 자연스럽게 올라가는 TOP 버튼 만들기 -->
<script>
    $(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 0) {
                $('#MOVE_TOP_BTN').fadeIn();
            } else {
                $('#MOVE_TOP_BTN').fadeOut();
            }
        });
        
        $("#MOVE_TOP_BTN").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
    });
</script>

<style>
body {
	padding-top: 56px;
}

.carousel-item {
	height: 65vh;
	min-height: 300px;
	background: no-repeat center center scroll;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

.portfolio-item {
	margin-bottom: 30px;
}

.logoImage {
	width: 120px;
	height: auto;
	object-fit: cover;		
}

.ul {
	list-style:none;
}

.custom-card-body {
	-ms-flex: 1 1 auto;
  	flex: 1 1 auto;
  	min-height: 1px;
  	padding: 0.3rem;
  	font-size: 15px;
}

}
</style>

<style>
html,
body {
	position: relative;
  	height: 100%;
}

body {
	background: #eee;
  	font-family: Noto Sans KR, sans-serif, Helvetica Neue, Helvetica, Arial !important;
  	font-size: 14px;
  	color: #000;
  	margin: 0;
  	padding: 0;
}

.swiper-container {
	width: 100%;
	height: 100%;
}

.swiper-slide {
	text-align: center;
  	font-size: 18px;
  	background: #fff;

  /* Center slide text vertically */
 	display: -webkit-box;
  	display: -ms-flexbox;
 	display: -webkit-flex;
 	display: flex;
  	-webkit-box-pack: center;
  	-ms-flex-pack: center;
  	-webkit-justify-content: center;
  	justify-content: center;
  	-webkit-box-align: center;
  	-ms-flex-align: center;
  	-webkit-align-items: center;
  	align-items: center;
}

.swiper-slide img {
	display: block;
  	width: 100%;
  	height: 100%;
  	object-fit: cover;
}

.swiper-button-prev {
	background-repeat: no-repeat;
	background-size: 100% auto;
	background-position: center;
	-webkit-filter: opacity(.5) drop-shadow(0 0 0 gray);
	filter: opacity(.5) dropshadow(0 0 0 gray);
}

.swiper-button-next {
	background-repeat: no-repeat;
	background-size: 100% auto;
	background-position: center;
	-webkit-filter: opacity(.5) drop-shadow(0 0 0 gray);
	filter: opacity(.5) dropshadow(0 0 0 gray);
}

.swiper-button-prev:hover {
	-webkit-filter: opacity(.5) drop-shadow(0 0 0 black);
	filter: opacity(.5) dropshadow(0 0 0 black);
}

.swiper-button-next:hover {
	-webkit-filter: opacity(.5) drop-shadow(0 0 0 black);
	filter: opacity(.5) dropshadow(0 0 0 black);
}

.swiper-button-prev::after {
	display: none;
}

.swiper-button-next::after {
	display: none;
}
</style>

<style>
.my-box {
	border: 1px solid #ff5a5f;
	width: 80px;
	height: 25px;
}

a#MOVE_TOP_BTN {
    position: fixed;
    right: 5%;
    bottom: 80px;
    display: none;
    
/* 화면 레이어 최상단으로 MOVE_TOP_BTN을 표시 */
    z-index: 999;
}
</style>

</head>

<body>

<!-- Move TOP Icon -->
<a id="MOVE_TOP_BTN" href="#">
	<img src="${contextPath}/resources/image/icon_move_top.png">
</a>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top" style="background-color: #ffffff;">
		<div class="container">
			<a class="navbar-brand" href="${contextPath}/">
				<img src="${contextPath}/resources/image/ClassTok_logo.png" alt="클래스톡" class="logoImage">
			</a>
			
			<div class="ui-widget" style="padding-top: 15px;">
				<form id="searchClass" method='GET' action="${contextPath}/search">
            		<label class="header__search-label" for="searchKey" >
                		<input id="searchKeyNav" name="searchKey" type="text" placeholder="클래스나 코치를 검색해보세요" maxlength="20" autocomplete="off" onfocus="this.value=''" style="border:0; outline:0; width: 200px; padding-left:12px; font-size: 13px; background-color: #f8f9fa; border-radius: 30px;">
						<button type="submit" style="border:0; outline:0; background-color: white;">
							<i class="fas fa-search" onclick="search"></i>
						</button>
            		</label>
            	</form>
            </div>
            
			<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarResponsive" aria-controls="navbarResponsive"
					aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active">
						<c:if test="${member.id == null || instructor.id == null}">
							<a class="nav-link" href="${contextPath}/open">클래스 개설
								<span class="sr-only">(current)</span>
							</a>
						</c:if>
					</li>
					<li class="nav-item active">
						<c:if test="${member.id == null || instructor.id == null}">
							<a class="nav-link" href="${contextPath}/alarm">
								<i class="far fa-bell"></i>
							</a>
						</c:if>
					</li>
					<li class="nav-item active">
						<c:if test="${member.id == null || instructor.id == null}">
							<a class="nav-link" href="${contextPath}/login" style="padding-right: 30px;">
								<i class="fas fa-user"></i>
							</a>
						</c:if>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container" style="padding-top:50px; padding-bottom:30px;">
		<div style="display: inline; padding-right: 28px;">
			<a href="${contextPath}/notify" style="color: black; text-decoration: none;">
				<i class="far fa-bell"></i>
					오픈알림
			</a>
		</div>
		
		<div style="display: inline; padding-right: 28px;">
			<a href="${contextPath}/earlybird" style="color: black; text-decoration: none;">
				<i class="far fa-gem"></i>
					기획전
			</a>
		</div>
		
		<div style="display: inline; padding-right: 28px;">
			<a href="${contextPath}/earlybird" style="color: black; text-decoration: none;">
				<i class="fas fa-hand-holding-usd" style="display: inline-block;"></i>
				<div style="display: inline-block; border-bottom: 2px solid red; padding-bottom: 3px;">
					얼리버드 특가
				</div>
			</a>
		</div>
	</div>
	
	<header>
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner" role="listbox">
				<div class="carousel-item active" 
					style="height: 250px; background-image: url('${pageContext.request.contextPath}/resources/image/background.png')">
					<div style="color: #fff; text-align: center; padding-top: 40px;">
						<p style="display: inline-block; font-size: 29px; font-weight: 500;">
							원하시는 클래스를 찾아보세요
						</p>
						<h3 style="display: inline-block; color: red; padding-bottom: 30px;">
							.
						</h3>
						<br>
						<div class="ui-widget">
							<form id="searchClass" method='GET' action="${contextPath}/search">
								<span style="position: relative; left: 40px; color: gray;">#</span>
								<input type="text" id="searchKeyBody" name="searchKey" placeholder="무엇을 배우고 싶나요?" maxlength="20" autocomplete="off" style="width: 500px; height: 50px; border-radius: 30px; border: 0; outline: 0; padding-left: 40px;">
								<button type="submit" style="border:0; outline:0; background-color: white; position: relative; right: 50px;">
									<i class="fas fa-search" onclick="search"></i>
								</button>
							</form>
						</div>
						
						<div style="padding-top: 30px;">
							<input type="button" value="#전체"		style="border-radius: 30px; border: 0; outline: 0; height: 25px; width: 50px; font-size: 11px; margin-right: 5px;" readonly onclick="location.href='search?searchKey='">
							<input type="button" value="#다이어트"	style="border-radius: 30px; border: 0; outline: 0; height: 25px; width: 68px; font-size: 11px; margin-right: 5px;" readonly onclick="location.href='search?searchKey=다이어트'">
							<input type="button" value="#교육"		style="border-radius: 30px; border: 0; outline: 0; height: 25px; width: 50px; font-size: 11px; margin-right: 5px;" readonly onclick="location.href='search?searchKey=교육'">
							<input type="button" value="#외국어"	style="border-radius: 30px; border: 0; outline: 0; height: 25px; width: 60px; font-size: 11px; margin-right: 5px;" readonly onclick="location.href='search?searchKey=외국어'">
							<input type="button" value="#음악"		style="border-radius: 30px; border: 0; outline: 0; height: 25px; width: 50px; font-size: 11px; margin-right: 5px;" readonly onclick="location.href='search?searchKey=음악'">
							<input type="button" value="#커리어"	style="border-radius: 30px; border: 0; outline: 0; height: 25px; width: 60px; font-size: 11px; margin-right: 5px;" readonly onclick="location.href='search?searchKey=커리어'">
							<input type="button" value="#필라테스"	style="border-radius: 30px; border: 0; outline: 0; height: 25px; width: 68px; font-size: 11px; margin-right: 5px;" readonly onclick="location.href='search?searchKey=필라테스'">
							<input type="button" value="#창업"		style="border-radius: 30px; border: 0; outline: 0; height: 25px; width: 50px; font-size: 11px; margin-right: 5px;" readonly onclick="location.href='search?searchKey=창업'">
							<input type="button" value="#손글씨"	style="border-radius: 30px; border: 0; outline: 0; height: 25px; width: 60px; font-size: 11px; margin-right: 5px;" readonly onclick="location.href='search?searchKey=손글씨'">
							<input type="button" value="#블로그"	style="border-radius: 30px; border: 0; outline: 0; height: 25px; width: 60px; font-size: 11px; margin-right: 5px;" readonly onclick="location.href='search?searchKey=블로그'">
							<input type="button" value="#육아"		style="border-radius: 30px; border: 0; outline: 0; height: 25px; width: 50px; font-size: 11px; margin-right: 5px;" readonly onclick="location.href='search?searchKey=육아'">
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Content section -->
	<section class="py-5">
		<div class="container">
			<h5 style="display: inline-block; margin-top: 20px; font-size: 20px; font-weight: 300;">
				지금 뜨고 있는 클래스
			</h5>
			<h5 style="display: inline-block; padding-bottom: 30px; font-size: 20px; font-weight: 500;">
				TOP 5
			</h5>
		</div>

		<div class="container swiper-container mySwiper" align="center">
			<div class="swiper-wrapper">
<%-- 				<% --%>
<!-- // 					for (int i = 0; i < 5; i++) { -->
<%-- 				%> --%>
<!-- 				<div class="mb-4 swiper-slide"> -->
<!-- 					<div class="card h-auto" style="width: 300px; height: 200px; box-shadow: 1.3px 1.8px lightgray;"> -->
<%-- 						<img class="card-img-top" src="${contextPath}/resources/banner/${lecture.url}" alt="Card image" style="height: 200px;"> --%>
<!-- 						<div class="custom-card-body" style="width: 350px; height: 50px;"> -->
<%-- 							<p style="text-align: left; padding-left: 5px; padding-top: 5px; font-weight: bold; font-size: 13px; margin-bottom: 0px; white-space: nowrap; overflow:hidden; text-overflow: ellipsis;">${lecture.name}</p> --%>
<%-- 							<p style="text-align: left; padding-left: 5px; padding-top: 5px; font-weight: bold; font-size: 13px; margin-bottom: 0px; color: gray;">${instructor.name}</p> --%>
<!-- 						</div> -->
<!-- 						<div class="custom-card-body" style="width: 300px; height: 40px; text-align: left;"> -->
<%-- 							<p style="padding-left: 5px; padding-top: 8px; font-weight: bold; font-size: 13px; margin-bottom: 0px; color: red; display: inline-block;">${lecture.discount}</p> --%>
<%-- 							<p style="padding-left: 150px; padding-top: 8px; font-weight: bold; font-size: 10px; margin-bottom: 0px; color: gray; display: inline-block;">${lecture.participants}</p> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<%-- 				<% --%>
<!-- // 					} -->
<%-- 				%> --%>
				<div class="mb-3 swiper-slide">
					<div class="card h-auto" style="cursor: pointer; width: 300px; height: 200px; box-shadow: 1.3px 1.8px lightgray;" onclick="location.href='classdetail/${lecture.id}'">
						<img class="card-img-top" src="${contextPath}/resources/banner/BWYizTwRFWqwIygK95a5.png" alt="Card image" style="height: 200px;">
						<div class="custom-card-body" style="width: 300px; height: 50px;">
							<p style="text-align: left; padding-left: 5px; padding-top: 5px; font-weight: bold; font-size: 13px; margin-bottom: 0px; white-space: nowrap; overflow:hidden; text-overflow: ellipsis;">네이버 블로그 중급 (콘텐츠 디자인 완성반)</p>
							<p style="text-align: left; padding-left: 5px; padding-top: 5px; font-weight: bold; font-size: 13px; margin-bottom: 0px; color: gray;">임효주강사</p>
						</div>
						<div class="custom-card-body" style="width: 300px; height: 40px;">
							<p style="text-align: left; padding-left: 5px; padding-top: 8px; font-weight: bold; font-size: 10px; margin-bottom: 0px; color: gray;">참여 멤버 14</p>
						</div>
					</div>
				</div>
				<div class="mb-3 swiper-slide">
					<div class="card h-auto" style="cursor: pointer; width: 300px; height: 200px; box-shadow: 1.3px 1.8px lightgray;" onclick="location.href='classdetail/${lecture.id}'">
						<img class="card-img-top" src="${contextPath}/resources/banner/jtr28ShMk7KC0hdU.png" alt="Card image" style="height: 200px;">
						<div class="custom-card-body" style="width: 300px; height: 50px;">
							<p style="text-align: left; padding-left: 5px; padding-top: 5px; font-weight: bold; font-size: 13px; margin-bottom: 0px; white-space: nowrap; overflow:hidden; text-overflow: ellipsis;">프랑스 자수로 수놓는 특별한 선물, 입체꽃 웨딩 액자</p>
							<p style="text-align: left; padding-left: 5px; padding-top: 5px; font-weight: bold; font-size: 13px; margin-bottom: 0px; color: gray;">수록</p>
						</div>
						<div class="custom-card-body" style="width: 300px; height: 40px;">
							<p style="text-align: left; padding-left: 5px; padding-top: 8px; font-weight: bold; font-size: 10px; margin-bottom: 0px; color: gray;">참여 멤버 114</p>
						</div>
					</div>
				</div>
				<div class="mb-3 swiper-slide">
					<div class="card h-auto" style="cursor: pointer; width: 300px; height: 200px; box-shadow: 1.3px 1.8px lightgray;" onclick="location.href='classdetail/${lecture.id}'">
						<img class="card-img-top" src="${contextPath}/resources/banner/wSJNkmZPeDedDRyC.png" alt="Card image" style="height: 200px;">
						<div class="custom-card-body" style="width: 300px; height: 50px;">
							<p style="text-align: left; padding-left: 5px; padding-top: 5px; font-weight: bold; font-size: 13px; margin-bottom: 0px; white-space: nowrap; overflow:hidden; text-overflow: ellipsis;">※전신 통증완화※ 엄마의 몸이 개운해지는 임산부 요가</p>
							<p style="text-align: left; padding-left: 5px; padding-top: 5px; font-weight: bold; font-size: 13px; margin-bottom: 0px; color: gray;">모나요가</p>
						</div>
						<div class="custom-card-body" style="width: 300px; height: 40px; ">
							<p style="text-align: left; padding-left: 5px; padding-top: 8px; font-weight: bold; font-size: 10px; margin-bottom: 0px; color: gray;">참여 멤버 8937</p>
						</div>
					</div>
				</div>
				<div class="mb-3 swiper-slide">
					<div class="card h-auto" style="cursor: pointer; width: 300px; height: 200px; box-shadow: 1.3px 1.8px lightgray;" onclick="location.href='classdetail/${lecture.id}'">
						<img class="card-img-top" src="${contextPath}/resources/banner/wSJNkmZPeDedDRyC.png" alt="Card image" style="height: 200px;">
						<div class="custom-card-body" style="width: 300px; height: 50px;">
							<p style="text-align: left; padding-left: 5px; padding-top: 5px; font-weight: bold; font-size: 13px; margin-bottom: 0px; white-space: nowrap; overflow:hidden; text-overflow: ellipsis;">※전신 통증완화※ 엄마의 몸이 개운해지는 임산부 요가</p>
							<p style="text-align: left; padding-left: 5px; padding-top: 5px; font-weight: bold; font-size: 13px; margin-bottom: 0px; color: gray;">모나요가</p>
						</div>
						<div class="custom-card-body" style="width: 300px; height: 40px;">
							<p style="text-align: left; padding-left: 5px; padding-top: 8px; font-weight: bold; font-size: 10px; margin-bottom: 0px; color: gray;">참여 멤버 8937</p>
						</div>
					</div>
				</div>
				<div class="mb-3 swiper-slide">
					<div class="card h-auto" style="cursor: pointer; width: 300px; height: 200px; box-shadow: 1.3px 1.8px lightgray;" onclick="location.href='classdetail/${lecture.id}'">
						<img class="card-img-top" src="${contextPath}/resources/banner/wSJNkmZPeDedDRyC.png" alt="Card image" style="height: 200px;">
						<div class="custom-card-body" style="width: 300px; height: 50px;">
							<p style="text-align: left; padding-left: 5px; padding-top: 5px; font-weight: bold; font-size: 13px; margin-bottom: 0px; white-space: nowrap; overflow:hidden; text-overflow: ellipsis;">※전신 통증완화※ 엄마의 몸이 개운해지는 임산부 요가</p>
							<p style="text-align: left; padding-left: 5px; padding-top: 5px; font-weight: bold; font-size: 13px; margin-bottom: 0px; color: gray;">모나요가</p>
						</div>
						<div class="custom-card-body" style="width: 300px; height: 40px;">
							<p style="text-align: left; padding-left: 5px; padding-top: 8px; font-weight: bold; font-size: 10px; margin-bottom: 0px; color: gray;">참여 멤버 8937</p>
						</div>
					</div>
				</div>
			</div>
			<div class="swiper-button-prev" style="background-image: url('${contextPath}/resources/image/icon_card_arrow_left.png');"></div>
		 	<div class="swiper-button-next" style="background-image: url('${contextPath}/resources/image/icon_card_arrow_right.png');"></div>
		</div>
	</section>
	
	<!-- Content section -->
	<section class="py-5">
		<div class="container">
			<h5 style="display: inline-block; padding-bottom: 30px; font-size: 20px; font-weight: 500px;">
				원하시는 관심사를 찾아보세요.
			</h5>
		</div>
		
		<div class="container">
			<div class="row" style="margin-left: 20px;">
				<div class="col-lg-1 mb-4" style="border-radius: 15px; width: 70px; margin-left: 13px; margin-right: 13px;" onclick="location.href='search?searchKey=운동/건강'">
					<div class="card h-auto" align="center" style="border-radius: 15px; width: 70px; border-style: none; cursor: pointer;" onclick="location.href ='${contextPath}/move/popular/'">
						<img class="card-img-top" src="${contextPath}/resources/genre/R1M0BHQbOWruXtgj.png" alt="Card image" style="width: 70px; border-radius: 15px;">
						<p style="text-align:center; padding-top: 5px; font-weight: bold; font-size: 11.5px; margin-bottom: 0px; color: gray">운동/건강</p>
						
					</div>
				</div>
				<div class="col-lg-1 mb-4" style="border-radius: 15px; width: 70px; margin-left: 13px; margin-right: 13px;" onclick="location.href='search?searchKey=라이프스타일'">
					<div class="card h-auto" align="center" style="border-radius: 15px; width: 70px; border-style: none; cursor: pointer;" onclick="location.href ='${contextPath}/move/popular/'">
						<img class="card-img-top" src="${contextPath}/resources/genre/2EA29I1A3zshSlKX.png" alt="Card image" style="width: 70px; border-radius: 15px;">
						<p style="text-align:center; padding-top: 5px; font-weight: bold; font-size: 11.5px; margin-bottom: 0px; color: gray">라이프스타일</p>
					</div>
				</div>
				<div class="col-lg-1 mb-4" style="border-radius: 15px; width: 70px; margin-left: 13px; margin-right: 13px;" onclick="location.href='search?searchKey=음료/요리'">
					<div class="card h-auto" align="center" style="border-radius: 15px; width: 70px; border-style: none; cursor: pointer;" onclick="location.href ='${contextPath}/move/popular/'">
						<img class="card-img-top" src="${contextPath}/resources/genre/vyoeoLhzJ4N1jQmd.png" alt="Card image" style="width: 70px; border-radius: 15px;">
						<p style="text-align:center; padding-top: 5px; font-weight: bold; font-size: 11.5px; margin-bottom: 0px; color: gray">음료/요리</p>
					</div>
				</div>
				<div class="col-lg-1 mb-4" style="border-radius: 15px; width: 70px; margin-left: 13px; margin-right: 13px;" onclick="location.href='search?searchKey=미술'">
					<div class="card h-auto" align="center" style="border-radius: 15px; width: 70px; border-style: none; cursor: pointer;" onclick="location.href ='${contextPath}/move/popular/'">
						<img class="card-img-top" src="${contextPath}/resources/genre/ywzTGhQObpLfQ6lH.png" alt="Card image" style="width: 70px; border-radius: 15px;">
						<p style="text-align:center; padding-top: 5px; font-weight: bold; font-size: 11.5px; margin-bottom: 0px; color: gray">미술</p>
					</div>
				</div>
				<div class="col-lg-1 mb-4" style="border-radius: 15px; width: 70px; margin-left: 13px; margin-right: 13px;" onclick="location.href='search?searchKey=커리어'">
					<div class="card h-auto" align="center" style="border-radius: 15px; width: 70px; border-style: none; cursor: pointer;" onclick="location.href ='${contextPath}/move/popular/'">
						<img class="card-img-top" src="${contextPath}/resources/genre/p4m7pzeWxon33Ifn.png" alt="Card image" style="width: 70px; border-radius: 15px;">
						<p style="text-align:center; padding-top: 5px; font-weight: bold; font-size: 11.5px; margin-bottom: 0px; color: gray">커리어</p>
					</div>
				</div>
				<div class="col-lg-1 mb-4" style="border-radius: 15px; width: 70px; margin-left: 13px; margin-right: 13px;" onclick="location.href='search?searchKey=공예'">
					<div class="card h-auto" align="center" style="border-radius: 15px; width: 70px; border-style: none; cursor: pointer;" onclick="location.href ='${contextPath}/move/popular/'">
						<img class="card-img-top" src="${contextPath}/resources/genre/s8yShBULMq85PLiZ.png" alt="Card image" style="width: 70px; border-radius: 15px;">
						<p style="text-align:center; padding-top: 5px; font-weight: bold; font-size: 11.5px; margin-bottom: 0px; color: gray">공예</p>
					</div>
				</div>
				<div class="col-lg-1 mb-4" style="border-radius: 15px; width: 70px; margin-left: 13px; margin-right: 13px;" onclick="location.href='search?searchKey=사진/영상'">
					<div class="card h-auto" align="center" style="border-radius: 15px; width: 70px; border-style: none; cursor: pointer;" onclick="location.href ='${contextPath}/move/popular/'">
						<img class="card-img-top" src="${contextPath}/resources/genre/T6BTV6lavBmdgR3g.png" alt="Card image" style="width: 70px; border-radius: 15px;">
						<p style="text-align:center; padding-top: 5px; font-weight: bold; font-size: 11.5px; margin-bottom: 0px; color: gray">사진/영상</p>
					</div>
				</div>
				<div class="col-lg-1 mb-4" style="border-radius: 15px; width: 70px; margin-left: 13px; margin-right: 13px;" onclick="location.href='search?searchKey=음악'">
					<div class="card h-auto" align="center" style="border-radius: 15px; width: 70px; border-style: none; cursor: pointer;" onclick="location.href ='${contextPath}/move/popular/'">
						<img class="card-img-top" src="${contextPath}/resources/genre/E4CGKWC7PoNg1YyI.png" alt="Card image" style="width: 70px; height: 70px; border-radius: 15px;">
						<p style="text-align:center; padding-top: 5px; font-weight: bold; font-size: 11.5px; margin-bottom: 0px; color: gray">음악</p>
					</div>
				</div>
				<div class="col-lg-1 mb-4" style="border-radius: 15px; width: 70px; margin-left: 13px; margin-right: 13px;" onclick="location.href='search?searchKey=외국어'">
					<div class="card h-auto" align="center" style="border-radius: 15px; width: 70px; border-style: none; cursor: pointer;" onclick="location.href ='${contextPath}/move/popular/'">
						<img class="card-img-top" src="${contextPath}/resources/genre/LXAYO1Hc4pXyYaOj.png" alt="Card image" style="width: 70px; height: 70px; border-radius: 15px;">
						<p style="text-align:center; padding-top: 5px; font-weight: bold; font-size: 11.5px; margin-bottom: 0px; color: gray">외국어</p>
					</div>
				</div>
				<div class="col-lg-1 mb-4" style="border-radius: 15px; width: 70px; margin-left: 13px; margin-right: 13px;" onclick="location.href='search?searchKey=교육'">
					<div class="card h-auto" align="center" style="border-radius: 15px; width: 70px; border-style: none; cursor: pointer;" onclick="location.href ='${contextPath}/move/popular/'">
						<img class="card-img-top" src="${contextPath}/resources/genre/9A2UrIdMXHc2rLxM.png" alt="Card image" style="width: 70px; height: 70px; border-radius: 15px;">
						<p style="text-align:center; padding-top: 5px; font-weight: bold; font-size: 11.5px; margin-bottom: 0px; color: gray">교육</p>
					</div>
				</div>
				<div class="col-lg-1 mb-4" style="border-radius: 15px; width: 70px; margin-left: 13px; margin-right: 13px;" onclick="location.href='search?searchKey='">
					<div class="card h-auto" align="center" style="border-radius: 15px; width: 70px; border-style: none; cursor: pointer;" onclick="location.href ='${contextPath}/move/popular/'">
						<img class="card-img-top" src="${contextPath}/resources/genre/icon_search_all.png" alt="Card image" style="width: 70px; border-radius: 15px;">
						<p style="text-align:center; padding-top: 5px; font-weight: bold; font-size: 11.5px; margin-bottom: 0px; color: gray">전체보기</p>
					</div>
				</div>
			</div>
		</div>			
	</section>
	
	<!-- Content section -->
	<section class="py-5" style="margin-bottom: 40px;">
		<div class="container">
			<h5 style="font-size: 20px; font-weight: 300;">
				수강생, 평점 ★4 이상!
			</h5>
			<h5 style="font-size: 20px; font-weight: 500; padding-bottom: 30px; ">
				클래스톡 인기 코치
			</h5>
		</div>

		<div class="container swiper-container mySwiper2" align="center">
			<div class="swiper-wrapper">
				<div class="mb-2 swiper-slide">
					<div class="card h-auto" style="width: 208px; height: 180px;">
						<img class="card-img-top" src="${contextPath}/resources/instructor/sample1.png" alt="Profile image" style="width:96px; height: 96px; margin: 15px auto 0; border: 1px solid #efefef; border-radius: 50%; background-repeat: no-repeat; background-size: cover; background-position: center;">
						<div class="custom-card-body" style="width: 208px; height: 50px;">
							<p style="text-align: center; font-weight: bold; font-size: 13px; color: #5a5858; margin-bottom: 0px; white-space: nowrap; overflow:hidden; text-overflow: ellipsis;">석재원</p>
							<p style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 11px; margin-left: 3px; margin-right: 3px; margin-bottom: 0px; color: darkgray;">'오늘도 수고했어' 당신을 위한 힐링 캘리그라피</p>
						</div>
						<div class="custom-card-body" style="width: 208px; height: 50px; padding-top: 17px;" align="center">
							<div class="my-box">
								<p style="cursor: pointer; color: #ff5a5f; font-weight: 400; font-size: 12px; padding-top: 2px;" onclick="location.href='profile?${instructor.id}'">프로필보기</p>
							</div>
						</div>
					</div>
				</div>
				<div class="mb-2 swiper-slide">
					<div class="card h-auto" style="width: 208px; height: 180px;">
						<img class="card-img-top" src="${contextPath}/resources/instructor/sample2.png" alt="Profile image" style="width:96px; height: 96px; margin: 15px auto 0; border: 1px solid #efefef; border-radius: 50%; background-repeat: no-repeat; background-size: cover; background-position: center;">
						<div class="custom-card-body" style="width: 208px; height: 50px;">
							<p style="text-align: center; font-weight: bold; font-size: 13px; color: #5a5858; margin-bottom: 0px; white-space: nowrap; overflow:hidden; text-overflow: ellipsis;">날큐</p>
							<p style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 11px; margin-left: 3px; margin-right: 3px; margin-bottom: 0px; color: darkgray;">방구석 아이패드 구출, 100% 활용하는 아이패드 튜토리얼</p>
						</div>
						<div class="custom-card-body" style="width: 208px; height: 50px; padding-top: 17px;" align="center">
							<div class="my-box">
								<p style="cursor: pointer; color: #ff5a5f; font-weight: 400; font-size: 12px; padding-top: 2px;" onclick="location.href='profile?${instructor.id}'">프로필보기</p>
							</div>
						</div>
					</div>
				</div>
				<div class="mb-2 swiper-slide">
					<div class="card h-auto" style="width: 208px; height: 180px;">
						<img class="card-img-top" src="${contextPath}/resources/instructor/sample3.png" alt="Profile image" style="width:96px; height: 96px; margin: 15px auto 0; border: 1px solid #efefef; border-radius: 50%; background-repeat: no-repeat; background-size: cover; background-position: center;">
						<div class="custom-card-body" style="width: 208px; height: 50px;">
							<p style="text-align: center; font-weight: bold; font-size: 13px; color: #5a5858; margin-bottom: 0px; white-space: nowrap; overflow:hidden; text-overflow: ellipsis;">neo</p>
							<p style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 11px; margin-left: 3px; margin-right: 3px; margin-bottom: 0px; color: darkgray;">[남들보다 2배 빠른 초고속 승진] 현장 실무에 맞춘 파워포인트 실무 강좌</p>
						</div>
						<div class="custom-card-body" style="width: 208px; height: 50px; padding-top: 17px;" align="center">
							<div class="my-box">
								<p style="cursor: pointer; color: #ff5a5f; font-weight: 400; font-size: 12px; padding-top: 2px;" onclick="location.href='profile?${instructor.id}'">프로필보기</p>
							</div>
						</div>
					</div>
				</div>
				<div class="mb-2 swiper-slide">
					<div class="card h-auto" style="width: 208px; height: 180px;">
						<img class="card-img-top" src="${contextPath}/resources/instructor/sample4.png" alt="Profile image" style="width:96px; height: 96px; margin: 15px auto 0; border: 1px solid #efefef; border-radius: 50%; background-repeat: no-repeat; background-size: cover; background-position: center;">
						<div class="custom-card-body" style="width: 208px; height: 50px;">
							<p style="text-align: center; font-weight: bold; font-size: 13px; color: #5a5858; margin-bottom: 0px; white-space: nowrap; overflow:hidden; text-overflow: ellipsis;">에디</p>
							<p style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 11px; margin-left: 3px; margin-right: 3px; margin-bottom: 0px; color: darkgray;">실전! 소액으로 시작하는 20, 30대 부동산 투자법!</p>
						</div>
						<div class="custom-card-body" style="width: 208px; height: 50px; padding-top: 17px;" align="center">
							<div class="my-box">
								<p style="cursor: pointer; color: #ff5a5f; font-weight: 400; font-size: 12px; padding-top: 2px;" onclick="location.href='profile?${instructor.id}'">프로필보기</p>
							</div>
						</div>
					</div>
				</div>
				<div class="mb-2 swiper-slide">
					<div class="card h-auto" style="width: 208px; height: 180px;">
						<img class="card-img-top" src="${contextPath}/resources/instructor/sample5.png" alt="Profile image" style="width:96px; height: 96px; margin: 15px auto 0; border: 1px solid #efefef; border-radius: 50%; background-repeat: no-repeat; background-size: cover; background-position: center;">
						<div class="custom-card-body" style="width: 208px; height: 50px;">
							<p style="text-align: center; font-weight: bold; font-size: 13px; color: #5a5858; margin-bottom: 0px; white-space: nowrap; overflow:hidden; text-overflow: ellipsis;">감성식탁</p>
							<p style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 11px; margin-left: 3px; margin-right: 3px; margin-bottom: 0px; color: darkgray;">3가지 타르트반죽으로 만드는 미니 타르트&노오븐 타르트</p>
						</div>
						<div class="custom-card-body" style="width: 208px; height: 50px; padding-top: 17px;" align="center">
							<div class="my-box">
								<p style="cursor: pointer; color: #ff5a5f; font-weight: 400; font-size: 12px; padding-top: 2px;" onclick="location.href='profile?${instructor.id}'">프로필보기</p>
							</div>
						</div>
					</div>
				</div>
				<div class="mb-2 swiper-slide">
					<div class="card h-auto" style="width: 208px; height: 180px;">
						<img class="card-img-top" src="${contextPath}/resources/instructor/sample6.png" alt="Profile image" style="width:96px; height: 96px; margin: 15px auto 0; border: 1px solid #efefef; border-radius: 50%; background-repeat: no-repeat; background-size: cover; background-position: center;">
						<div class="custom-card-body" style="width: 208px; height: 50px;">
							<p style="text-align: center; font-weight: bold; font-size: 13px; color: #5a5858; margin-bottom: 0px; white-space: nowrap; overflow:hidden; text-overflow: ellipsis;">한정혜</p>
							<p style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 11px; margin-left: 3px; margin-right: 3px; margin-bottom: 0px; color: darkgray;">슬기로운 유튜브 생활</p>
						</div>
						<div class="custom-card-body" style="width: 208px; height: 50px; padding-top: 17px;" align="center">
							<div class="my-box">
								<p style="cursor: pointer; color: #ff5a5f; font-weight: 400; font-size: 12px; padding-top: 2px;" onclick="location.href='profile?${instructor.id}'">프로필보기</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="swiper-button-prev" style="background-image: url('${contextPath}/resources/image/icon_card_arrow_left.png');"></div>
		 	<div class="swiper-button-next" style="background-image: url('${contextPath}/resources/image/icon_card_arrow_right.png');"></div>
		</div>
	</section>
	
	<!-- URL: localhost/classtok/earlybird -->
	<div style="margin-bottom: 100px;" align="center">
		<img src="${contextPath}/resources/banner/Cct9EfMnw1iWUWC0.png" onclick="location.href='earlybird'" style="cursor: pointer;">
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>


	<!-- Bootstrap core CSS -->
	<link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<!--  Custom styles for this template-->
	<link href="${contextPath}/resources/css/full-width-pics.css" rel="stylesheet">
	
	<!-- Swiper JS -->
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

	<!-- Initialize Swiper -->
	 <script>
     var swiper = new Swiper(".mySwiper", {
       slidesPerView: 3,
       spaceBetween: 30,
       navigation: {
         nextEl: ".swiper-button-next",
         prevEl: ".swiper-button-prev"
       }
     });
     
     var swiper = new Swiper(".mySwiper2", {
         slidesPerView: 4,
         spaceBetween: 0,
         navigation: {
           nextEl: ".swiper-button-next",
           prevEl: ".swiper-button-prev"
         }
       });
	</script>
</body>
</html>