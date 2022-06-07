<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <title>제주잇다::다이어리::</title>
        
		<style>
			.diary-view{margin-top: 80px;}
			.diary-titleview{
				margin-top: 50px;
				margin-bottom: 50px;
				margin-left: 150px;
				margin-right: 150px;
				padding: 50px;
			}
			.diary-main-view{
				margin-left: 150px;
				margin-right: 150px;
				padding: 20px;
				
			}
			.planner-place-area{
				
				--bs-gutter-x: 1.5rem;
				--bs-gutter-y: 0;
				display: flex;
				flex-wrap: wrap;
				margin-top: calc(-1 * var(--bs-gutter-y));
				margin-left: 30px;
				float: left;

				/* margin-right: calc(-.5 * var(--bs-gutter-x));
				margin-left: calc(-.5 * var(--bs-gutter-x)); */
			}
			.diaryline-area{background-color: rgb(231, 242, 253); float: left;}
			.diary-row{clear: both; display: table; padding-bottom: 30px;}
			.planner-place-area, diaryline-area{display: table-cell;}
			.diary-bg-1{background-image: url(../../../img/diary-default.jpg);}
			.diaryline-Image{background-image: url(../../../img/diary-default.jpg); border: 1px solid gray; height: 100px;}
			.place-card{background-color: rgb(255, 248, 236); width: 170px; height: 200px;border: 1px saddlebrown solid;}
		</style>
		<script>
			const DiaryId = "${diary.diaryId}"
			$(function(){
				

				//다이어리 내용조회 ajax
				function selectAllDiryLine(){
					$.ajax({
						url:"",
						type:"post",
						dataType: "json",
						data: {}
					})
				}
				//다이어리 등록 ajax

				//다이어리 
			})

			// 모달 정보 ajax
			function modalInfoPlace(placeId){
				$.ajax({
					url: "${pageContext.request.contextPath}/planner/selectPlace",
					type: "post",
					dataType: "json",
					data: {placeId: placeId},
					success: function(result){
						$("#placeNameModal").text(result.placeName);
						$("#placeAddrModal").text(result.placeAddr);
						$("#placeContentModal").text(result.placeContent);
						$("placePhotoModal").attr("src", "/images/place/"+result.placePhoto )
						$("modal-link-bnt").attr("urlInfo",result.placeUrl);

					},
					error: function(error){
						alert("정보를 불러올 수 없습니다.")
					}
				})
			}
			//오른쪽 사이드바 - 장소 정보 모달 버튼동작
			$(document).on("click","#plan-info-bnt",function(){
				modalInfoPlace($(this).attr('placeId'));

			})

			
		</script>

	</head>
	<body>
		<section class="diary-view">
			<div class="container">
				<!--상단 제목-->
				<div class="diary-titleview">
					<h1>${diary.diaryTitle}</h1>
					<h4>${diary.plannerStart} ~ ${diary.plannerEnd}  (${diary.planDays} DAY)</h4>
					<div>
						<span>${diary.diaryType}</span>
						<span>${diary.diaryCount}명</span>
					</div>
				</div>
			</div>
			
			
			<div class="container">
				<div class="diary-main-view">

					



					<!--place 내용-->
					<c:forEach items="${plannerplacelist}" var="plannerplace" varStatus="status">
						<div class="diary-row">
							<div class="planner-place-area">
								<div class="place-container">
										<div class="place-card">
											<a href="#"><div class="place-Img">장소이미지 자리 ${plannerplace.plannerPlaceDate}</div></a>
											<div class="place-detail-box">
												<h3><a href="#">${plannerplace.placeName}</a></h3>
												<p class="blog-meta">
													<span class="author"><button type="button" id="plan-info-bnt" class='badge rounded-pill bg-light text-dark' data-bs-toggle="modal" data-bs-target="#placeInfoModal"  placeId="${plannerplace.placeId}">i</button></span>
												</p>
											</div>
										</div>
								</div>
							</div>
							<!--본문 - 다이어리 내용-->
							<div class="diaryline-area">
								<div class="diaryline-container">
									<div class="diaryline-card" plannerPlaceId="${plannerplace.plannerplaceId}">다이어리 내용 작성하기</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
					<!--본문 - 다이어리 내용-->
					<div class="diaryline-area">
						<div class="diaryline-container">
							<c:forEach items="${diarylinelist}" var="diaryline">
								
								<div class="diaryline-col">
									<div class="single-latest-news">
										<a href="#"><div class="diaryline-Image diary-bg-1"></div></a>
									</div>
								</div>
								<div class="diaryline-col">
									<div class="single-latest-news">
										<div class="diaryline-text-box">
											<p class="excerpt">${diaryline.diaryLineContent}
											Hibernate: select diary0_.diary_id as diary_id1_5_0_, diary0_.diary_count as diary_count2_5_0_, diary0_.diary_photo as diary_photo3_5_0_, diary0_.diary_title as diary_title4_5_0_, diary0_.diary_type as diary_type5_5_0_, diary0_.planner_planner_id as planner_planner_id6_5_0_, diary0_.user_fk as user_fk7_5_0_ from diary diary0_ where diary0_.diary_id=?
											</p>	
											<p>
												<span>경비: <fmt:formatNumber value="${diaryline.diaryLinePrice}" pattern="#,###"/> 원</span>
												<span><img alt="편집아이콘" src="/icon/pen.png" class="icon-edit-diaryline" style="width: 15px; height: inherit;"></span>
												<span><img alt="삭제아이콘" src="/icon/bin.png" class="icon-delete-diaryline" style="width: 15px; height: inherit;"></span>
											</p>
										</div>
									</div>
								</div>
									
							</c:forEach>
						</div>
					</div>
				</div>
			</div>

			

	
					
		</section>

		<!--장소 정보 모달-->
		<div id="placeInfoModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="placeInfoTitleModal"></h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-6">
                                <img class="img-fluid" id="placePhotoModal" src="">
                                <!-- 썸네일 이미지 -->
                            </div>
                            <div class="col-6">
                                <div class="row">
                                    
                                    <div class="col-8">
										
                                        <p id="placeNameModal"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    
                                    <div class="col-8" id="placeContentModal-area">
                                        <p id="placeContentModal"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    
                                    <div class="col-8">
                                        <p id="placeAddrModal"></p>
                                    </div>
                                </div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal" id="modal-link-bnt">링크</button>
								</div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
		
	</body>
</html>