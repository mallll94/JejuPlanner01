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
			input[ class="icon-bnt"]{display: none;}
			.input-diaryPhoto-bnt{padding: 6px; background-color: orange; border-radius: 4px; color: white; cursor: pointer;}
			.form-modal-content{width: 100%; resize: none; border: gainsboro 1px solid; border-radius: 4px;}
			
			textarea:focus{outline: 1px solid gray;}

			#insert-diaryPhoto{display: none;}
		</style>
		<script>
			$(function(){
				const DiaryId = "${diary.plannerId}"

				//다이어리 내용조회 ajax
				function selectAllDiryLine(){
					$.ajax({
						url:"${pageContext.request.contextPath}/diary/selectAllDiaryLine",
						type:"post",
						dataType: "json",
						data: {diaryId: DiaryId},
						success: function(result){
							//alert(result)
							let str="";
							$.each(result,function(index,diaryline){
								if(diaryline.diaryLineContent){}
							})
						

						},
						error: function(error){
							alert("항목을 불러오지 못했습니다.")
						}
					})
				}


				//다이어리 등록 ajax
				// $("#insert-diary-bnt").click(function(){
				// 	alert("다이어리 등록하기")
				// 	let plannerPlaceId =$(this).val()
				// 	let diaryLineContent = $("#insert-diaryLineContent").val()
				// 	alert(plannerPlaceId)
					
				// 	$.ajax({
				// 		url: "${pageContext.request.contextPath}/diary/insertDiaryLine",
				// 		type: "post",
				// 		dataType: "json",
				// 		data: {plannerPlaceId: plannerPlaceId, content},
				// 		success: function(result){
							

				// 		},
				// 		error: function(error){
				// 			alert("정보를 불러올 수 없습니다.")
				// 		}
				// 	})
					
				// })

				
				
			

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
			
				//장소 정보 모달 버튼동작
				$(document).on("click","#plan-info-bnt",function(){
					modalInfoPlace($(this).attr('placeId'));

				})

				
				//다이어리 등록 폼 값 전달
				$(document).on("click","#write-diaryline-bnt", function(){
					let target = $(this).attr('plannerPlaceId');
					$('#insert-diary-bnt').val(target)
				})

				//다이어리 내용 수정하기
				$(document).on("click","#edit-diaryline-bnt",function(){
					let target = $(this).attr('plannerPlaceId');
					$('#insert-diary-bnt').val(target)
					
				})

				


				
				

				function uploadDiaryline(){
					
					var form = $('#writeForm')[0];
					var formData = new FormData(form)
					$.ajax({
					url: "${pageContext.request.contextPath}/diary/diaryInsertAjax",
					type: "post",
					dataType: "json",
					data: formData,
					cache: false,
					contentType: false,
					processData: false,
					success: function(diaryLine){
						
						str+=``

					},
					error: function(error){
						alert("정보를 불러올 수 없습니다.")
					}
				})

				}

				// $("#insert-diary-bnt").on("click",function(){
				// 	checkValid();
				// 	uploadDiaryline();
				// })
				

				//목록으로 돌아가기 버튼
				$(document).on("click","#back-list-btn",function(){
					console.log("만들어야함")
					//let url = `${pageContext.request.contextPath}/diary/diaryIndex&nowPage=${pageNum}`
					//location.replace(url);
				})

				//다이어리 내용 삭제하기
				$("#delete-diaryline-bnt").click(function(){
					var deletetarget = $(this).attr("plannerPlaceId");
					alert(deletetarget)
					let url=`${pageContext.request.contextPath}/diary/deleteDiaryLine?diaryLineId=`+deletetarget;
					location.replace(url);
				})

			})
			//다이어리 등록 폼 유효성 체크
			function checkValid(){
					
				//경비가 null값이면 0으로 submit
				if($('[name=diaryLinePrice]').val()==''){
					$('[name=diaryLinePrice]').val('0')
				}
			}

			
			// $(document).on("click","#delete-diaryline-bnt",function(){
			// 	var deletetarget = $(this).attr("plannerPlaceId");
			// 	alert(deletetarget)
			// 	let url=`${pageContext.request.contextPath}/diary/deleteDiaryLine?diaryLineId=`+deletetarget;
			// 	location.replace(url);
			// })

			
		</script>

	</head>
	<body>
		<section class="diary-view">
			<!--상단 제목-->
			<div class="container">
				<div class="diary-titleview">
					<h1>${diary.diaryTitle}</h1>
					<h4>${diary.plannerStart} ~ ${diary.plannerEnd}  (${diary.planDays} DAY)</h4>
					<div>
						<span>${diary.diaryType}</span>
						<span>${diary.diaryCount}명</span>
					</div>
				</div>
			</div>
			
			<!--본문-->
			<div class="container">
				<div class="diary-main-view">
					<!--place 내용-->
					<c:forEach items="${diarylinelist}" var="diaryline" varStatus="status">
						<div class="diary-row">
							<div class="planner-place-area">
								<div class="place-container">
										<div class="place-card">
											<a href="#"><div class="place-Img">장소이미지 자리 ${diaryline.placePhoto}</div></a>
											<div class="place-detail-box">
												<h3><a href="#">${diaryline.placeName}</a></h3>
												<p class="blog-meta">
													<span class="author"><button type="button" id="plan-info-bnt" class='badge rounded-pill bg-light text-dark' data-bs-toggle="modal" data-bs-target="#placeInfoModal"  placeId="${diaryline.placeId}">i</button></span>
												</p>
											</div>
										</div>
								</div>
							</div>
							<!--diary 내용-->
							<div class="diaryline-area">
								<div class="diaryline-container">
									<c:choose>
										<c:when test="${diaryline.diaryLinePrice eq 0 and empty diaryline.diaryLineContent and empty diaryline.diaryLinePhoto}">
											<div class="diaryline-card" >
												<a href="javascript:void(0);" id="write-diaryline-bnt" data-bs-toggle="modal" data-bs-target="#DiaryFormModal" plannerPlaceId="${diaryline.plannerPlaceId}"><div>다이어리 작성하기</div></a>
												
											</div>
										</c:when>
										<c:otherwise>
											<div class="diaryline-col">
												<div class="single-latest-news">
													<a href="#"><div class="diaryline-Image diary-bg-1">${diaryline.diaryLinePhoto}</div></a>
												</div>
											</div>
											<div class="diaryline-col">
												<div class="single-latest-news">
													<div class="diaryline-text-box">
														<p class="excerpt">${diaryline.diaryLineContent} , ${diaryline.plannerPlaceId}
														</p>	
														<p>
															<span>경비: <fmt:formatNumber value="${diaryline.diaryLinePrice}" pattern="#,###"/> 원</span>
															<span>
																<input class="icon-bnt" id="edit-diaryline-bnt" type="button" data-bs-toggle="modal" data-bs-target="#DiaryFormModal" plannerPlaceId="${diaryline.plannerPlaceId}" />
																<label class="icon-bnt" for="edit-diaryline-bnt" >
																	<img alt="편집아이콘" src="/icon/pen.png" class="icon-edit-diaryline" style="width: 15px; height: inherit;">
																</label>
															</span>
															<span>
																<a class="icon-bnt" id="delete-diaryline-bnt" type="button" plannerPlaceId="${diaryline.plannerPlaceId}">
																	<img alt="삭제아이콘" src="/icon/bin.png" class="icon-delete-diaryline" style="width: 15px; height: inherit;">${diaryline.plannerPlaceId}
																</a>
																<label class="icon-bnt" for="delete-diaryline-bnt" >
																	
																</label>
															</span>
														</p>
													</div>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>	
			</div>
			<!--다이어리 하단-->
			<div class="container">
				<a href="#" id="back-list-btn" class="btn btn-outline-dark shadow-none">목록으로 돌아가기</a>
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


		<!--다이어리 작성하기 모달2-->
		<div id="DiaryFormModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="placeInfoTitleModal">다이어리 등록하기</h4>
                    </div>
					<form name="writeForm" method="post" action="${pageContext.request.contextPath}/diary/insertDiaryLine" onSubmit='return checkValid()' enctype="multipart/form-data" > 
					<!-- <form name="writeForm"> -->
						<div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12">
								
                                <div class="row">
                                    <div class="col-lg-12">
                                        <p><label class="" for="insert-diaryLineContent">내용</label></p>
										<textarea class="form-modal-content" name="diaryLineContent" id="insert-diaryLineContent" placeholder="다이어리 내용을 입력하세요"></textarea>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-8" id="placeContentModal-area">
                                        <p><label class="" for="insert-diaryLinePrice">경비</label></p>
										<input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-red-500 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white-500"
										name="diaryLinePrice" id="insert-diaryLinePrice" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"  placeholder="0">원
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-8">
                                        <label class="input-diaryPhoto-bnt" for="insert-diaryPhoto">
											사진첨부하기
										</label>
										<input id="insert-diaryPhoto" name="file" type="file" accept=".jpg, .jpeg, .png">
										<p id="file-status"></p>
										<img style="width: 50%;" id="preview-image" src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
										<script>
											//////////파일 사진 미리보기//////////
												const status = document.getElementById('file-status')
												const output = document.getElementById('preview-image')
												// 인풋 태그에 파일이 있는 경우
												if(window.FileList && window.File && window.FileReader){
													document.getElementById('insert-diaryPhoto').addEventListener('change', event =>{
														output.src='';
														status.textContent='';
														const file = event.target.files[0];
														if(!file.type){
															status.textContent = "첨부한 파일 타입이 현재 브라우저에서 지원하지 않습니다."
															return;
														}
														const reader = new FileReader();
														reader.addEventListener('load', event =>{
															output.src = event.target.result;
														})
														reader.readAsDataURL(file);
													})
												}
											///////////////////////////////
										</script>
                                    </div>
                                </div>
								<div class="modal-footer">
									<button id="insert-diary-bnt" class='btn btn-default' name="plannerPlaceId"> 등록 </button>
									<button type="button" class="btn btn-default" data-bs-dismiss="modal">취소</button>
								</div>
                            </div>
                        </div>
                    </div>
					</form>
                </div>
            </div>
        </div>



		







		
	</body>
</html>