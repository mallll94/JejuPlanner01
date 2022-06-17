<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <title>제주잇다::다이어리::</title>

        <!-- CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/3d026d01cb.js" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/diary/main.css">
		<script src="https://kit.fontawesome.com/3d026d01cb.js" crossorigin="anonymous"></script>

		<!-- Css Styles -->
		<link rel="stylesheet" href="/css/diary/diaryRead.css" type="text/css">

		<style>
			
		</style>
		<script>
			$(function(){
				const DiaryId = "${requestScope.diary.plannerId}"
				const curPage = "${requestScope.nowPage}"

				//다이어리 title조회 ajax
				function selectDiaryTitle(){
					console.log(DiaryId)
					console.log(curPage)
					$.ajax({
						url:"${pageContext.request.contextPath}/diary/DiaryTitle",
						type:"post",
						dataType: "json",
						data: {plannerId: DiaryId},
						
						success: function(result){
							console.log(result)
							let str="";
							str+=`<p class='diaryTitle'>\${result.diary.diaryTitle}</p>`;
							str+=`<p class='diaryDays'>\${result.diary.plannerStart} ~ \${result.diary.plannerEnd}  (\${result.diary.planDays} DAY)</p>`
							str+=`<div class='diaryBottom'>`
								if(!result.diary.diaryType){
									str+=`<span><i class="fa-solid fa-plane"></i>\${result.diary.diaryCount}명</span>`
								}else{
									str+=`<span>
											<i class="fa-solid fa-plane"></i>\${result.diary.diaryType}
											<i class="fa-solid fa-plane"></i>\${result.diary.diaryCount}명
										</span>`
								}
								str+=`<span id="setting"><select id="setting-select" class='diary-setting'>`
									str+=`<option value='none'>⚙️관리</option>`
									str+=`<option value='updateTitle' >다이어리 이름 변경</option>`
									str+=`<option value='updateInfo' >다이어리 정보 수정</option>`
									str+=`<option value='deleteDiary' >다이어리 삭제</option>`
								str+=`</select></span>`
							str+=`</div>`
							$("#diary-titleview").html("");
							$("#diary-titleview").append(str)

							let str2="";
							if(result.total==0){
								str2+=`<div class="diary-row">`
									str2+=`<div class='when-empty-diaryline'>`
										str2+=`<p>저장된 일정 없습니다.👀<br>우선 플래너에서 여행 계획을 세워보세요!</p>`
									str2+=`</div>`
								str2+=`</div>`

							}else{
								$.each(result.diarylinelist,function(index,diaryline){
									var price = diaryline.diaryLinePrice;
									var content =diaryline.diaryLineContent
									var photo =diaryline.diaryLinePhoto
									var priceComma = diaryline.diaryLinePrice.toString().replace(/(\B)(?=(\d\d\d)+(?!\d))/g, ",")
									//장소
									str2+=`<div class="diary-row">`
										str2+=`<div class="planner-place-area">`
											str2+= `<div class="place-card">`
												str2+= `<div>
															<img class='place-Img' src='/images/place/\${diaryline.placePhoto}'></img>
														</div>`
												str2+=`<div class="place-detail-box">`
													str2+=`<p class='place-name'>\${diaryline.placeName}</p>`
													str2+=`<p class="place-info"><span><button type="button" id="plan-info-bnt" class='plan-info-bnt' data-bs-toggle="modal" data-bs-target="#placeInfoModal"  placeId="\${diaryline.placeId}">i</button><span></p>`
												str2+=`</div>`
											str2+=`</div>`
										str2+=`</div>`

										str2+=`<div class="diaryline-area">`
												
											if(!price  && !content && !photo){
												str2+=`<div class="diaryline-card">`
													str2+=`<a href="javascript:void(0);" id="write-diaryline-bnt" class='write-diaryline-bnt' data-bs-toggle="modal" data-bs-target="#DiaryFormModal" plannerPlaceId="\${diaryline.plannerPlaceId}">+</a>`
												str2+=`</div>`
											}else{
												str2+=`<div class="diaryline-card">`
													str2+=`<div class="diaryImg-card">`
														str2+=`<a href="#"><div class="diaryline-Image diary-bg-1">`
														if(!photo){
															str2+=`<img class="diarylineImg" alt="다이어리 사진" src="../../../img/diaryline-default.jpg" onerror="javascript:src={../../../img/diaryline-default.jpg}">`
														}else{
															str2+=`<img class="diarylineImg" alt="다이어리 사진" src="/images/diary/\${diaryline.diaryLinePhoto}" onerror="javascript:src={../../../img/diaryline-default.jpg}">`
														}
														str2+=`</div></a>`
													str2+=`</div>`
												str2+=`</div>`
												str2+=`<div class="diaryline-card">`
													str2+=`<div class="diaryline-text-box">`
														str2+=`<div class="content-box">`
														str2+=`<p class="diaryline-content">\${diaryline.diaryLineContent}\</p>`
														str2+=`</div>`
														str2+=`<p class="diaryline-bottom">`
															str2+=`<span class='price-Num'>경비: \${priceComma}원</span>`
															str2+=`<span class='icon-bnt-area'><a href="javascript:void(0);" class="icon-bnt" id="edit-diaryline-bnt" data-bs-toggle="modal" data-bs-target="#DiaryUpdateFormModal" plannerPlaceId="\${diaryline.plannerPlaceId}">
																<i class="fa-solid fa-pen-nib"></i>
																</a></span>`
															str2+=`<span class='icon-bnt-area'><a href="javascript:void(0);" class="icon-bnt" id="delete-diaryline-bnt" plannerPlaceId="\${diaryline.plannerPlaceId}">
																	<i class="fa-solid fa-trash-can"></i>
																</a></span>`
														str2+=`</p>`
													str2+=`</div>`
												str2+=`</div>`
												
											}

										str2+=`</div>`
									str2+=`</div>`
									
								})
							}
							$("#diary-main-view").html("");
							$("#diary-main-view").append(str2);

							var totalComma = result.totalPrice.toString().replace(/(\B)(?=(\d\d\d)+(?!\d))/g, ",")
							let str3="";
							str3+=`<a href="${pageContext.request.contextPath}/diary/diaryIndex?nowPage=\${curPage}" id="back-list-btn" class="back-list-btn">목록으로 돌아가기</a>`
							str3+=`<span class='totalPlace'>총 경비: \${totalComma}원</span>`
							$("#diary-bottom-area").html("")
							$("#diary-bottom-area").append(str3)

							

							
						},
						error: function(error){
							alert("항목을 불러오지 못했습니다.")
						}
					})
				}
			

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
							$("#placePhotoModal").attr("src", "/images/place/"+result.placePhoto )
							$("#modal-link-bnt").attr("href",result.placeUrl);

						},
						error: function(error){
							alert("정보를 불러올 수 없습니다.")
						}
					})
				}

				//수정하기 ajax
				function modalUpdateDiary(plannerPlaceId){
					$.ajax({
						url: "${pageContext.request.contextPath}/diary/updateDiaryForm",
						type: "post",
						dataType: "json",
						data: {diaryLineId: plannerPlaceId},
						success: function(result){
							var photo = result.diaryLinePhoto;
							$("#update-diaryLineContent").text(result.diaryLineContent);
							$("#update-diaryLinePrice").val(result.diaryLinePrice*=1);
							$("#update-diary-bnt").val(result.plannerPlaceId);

							if(photo){
								console.log("photo값:"+photo)
								//$("#update-diary-diaryPhoto").val(result.diaryLinePhoto); //file 타입에 값 넣는건 보안상의문제로 안됨 
								$("#update-diary-preview-image").attr("src", "/images/place/"+result.diaryLinePhoto )
							}
							

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

				//다이어리 내용 수정하기
				$(document).on("click","#edit-diaryline-bnt",function(){
					let target = $(this).attr('plannerPlaceId');
					console.log(target)
					modalUpdateDiary($(this).attr('plannerPlaceId'))
					$('#edit-page').val(curPage)
					
				})

				/////이름수정 모달//일정수정
				$(document).on("change","#setting-select",function(){
					console.log("모달 선택")
					if($(this).val()=="updateTitle"){
						$('#edit-name').val(curPage)
						$('#NameUpdateModal').modal('show');
					}else if($(this).val()=="updateInfo"){
						$('#edit-type').val(curPage)
						$("#updateCountAndTypeModal").modal('show');
					}else if($(this).val()=="deleteDiary"){
						$('#deleteDiaryModal').modal('show');
					}
				})
				

				//다이어리 등록 폼 값 전달
				$(document).on("click","#write-diaryline-bnt", function(){
					let insertarget = $(this).attr('plannerPlaceId');
					console.log(insertarget)
					$('#insert-diary-bnt').val(insertarget)
					$('#write-page').val(curPage)
				})

				//다이어리 내용 삭제버튼
				$(document).on("click","#delete-diaryline-bnt", function(){
					var deletetarget = $(this).attr('plannerPlaceId');
					let url="${pageContext.request.contextPath}/diary/deleteDiaryLine?diaryLineId="+deletetarget+"&nowPage="+curPage;
					location.replace(url);
				})
				
						

				selectDiaryTitle();
			})


			function checkValid(){
				alert($('#write-page').val())
				//console.log("checkValid()옴"+$('#insert-diaryLinePrice').val())
				//경비가 null값이면 0으로 submit
				if($('#insert-diaryLinePrice').val()==''){
					$('#insert-diaryLinePrice').val('0')
				}	
			}

			

			//다이어리 수정 폼 유효성 체크
			function checkValidUpdate(){

				console.log("값"+$('#insert-diaryLinePrice').val())
				//경비가 null값이면 0으로 submit
				if($('#insert-diaryLinePrice').val()==''){
					$('#insert-diaryLinePrice').val('0')
				}	
			}

			//이름 변경 유효성 체크
			function checkValidName(){
				//값이 없으면 return
				if($('[name=diaryTitle]').val()==''){
					return false;
				}
				
			}

			//인원,타입 변경 유효성체크
			function checkValidCandT(){
				//인원이 null이면 0으로 submit
				if($('[name=plannerCount]').val()==''){
					alert("인원을 입력해주십시오.")
					return false;
				}
			}

			

			

	
		</script>


	</head>
	<body>
		<div class="latest-news mt-150 mb-150">
			<div class="container">
				<div class="title-row">
					<!--상단 제목-->
					<div id="diary-title-container" class="col-lg-8">
						<div id="diary-titleview" class="diary-titleview"></div>
					</div>
				</div>
				<div class="body-row">
					<!--본문-->
					<div class="col-lg-8">
						<div id="diary-main-view" class="diary-main-view"></div>
					</div>
				</div>	
				<div class="bottom-row">
					<!--다이어리 하단-->
					<div class="col-lg-8">
						<div id='diary-bottom-area' class="diary-bottom-area"></div>
					</div>
				</div>
			</div>	
		</div>


			

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
                                    <div class="col-8 modal-content-area" id="placeContentModal-area" >
                                        <p id="placeContentModal" class="placeContentModal"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-8 modal-addr-area">
                                        <p id="placeAddrModal" class="placeAddrModal"></p>
                                    </div>
                                </div>
								<div class="modal-footer">
									<a href='#' target='_blank'  class="modal-link-bnt" data-dismiss="modal" id="modal-link-bnt">링크</a>
								</div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>


		<!--Modal 다이어리 내용 작성하기-->
		<div id="DiaryFormModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="placeInfoTitleModal">다이어리 작성하기</h4>
                    </div>
					<form name="writeForm" method="post" action="${pageContext.request.contextPath}/diary/insertDiaryLine" onSubmit='return checkValid()' enctype="multipart/form-data" >
						<input type="hidden" name="nowPage" id="write-page">
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


		<!--Modal 다이어리 내용 수정하기-->
		<div id="DiaryUpdateFormModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="update-diaryTitleModal">다이어리 수정하기</h4>
                    </div>
					<form name="updateForm" method="post" action="${pageContext.request.contextPath}/diary/updateDiaryLine" onSubmit='return checkValidUpdate()' enctype="multipart/form-data" >
						<input type="hidden" name="nowPage" id="edit-page">
						<div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12">
								
                                <div class="row">
                                    <div class="col-lg-12">
                                        <p><label class="" for="update-diaryLineContent">내용</label></p>
										<textarea class="form-modal-content" name="diaryLineContent" id="update-diaryLineContent" placeholder="다이어리 내용을 입력하세요"></textarea>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-8" id="update-diaryplaceContentModal-area">
                                        <p><label class="" for="update-diaryLinePrice">경비</label></p>
										<input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-red-500 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white-500"
										name="diaryLinePrice" id="update-diaryLinePrice" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"  placeholder="0">원
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-8">
                                        <label class="input-diaryPhoto-bnt" for="update-diary-diaryPhoto">
											사진첨부하기
										</label>
										<input id="update-diary-diaryPhoto" name="file" type="file" accept=".jpg, .jpeg, .png">
										<p id="update-diary-file-status"></p>
										<img style="width: 50%;" id="update-diary-preview-image" src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
										<script>
											//////////파일 사진 미리보기//////////
												const statusUpdate = document.getElementById('update-diary-file-status')
												const outputUpdate = document.getElementById('update-diary-preview-image')
												// 인풋 태그에 파일이 있는 경우
												if(window.FileList && window.File && window.FileReader){
													document.getElementById('update-diary-diaryPhoto').addEventListener('change', event =>{
														outputUpdate.src='';
														statusUpdate.textContent='';
														const updatefile = event.target.files[0];
														if(!updatefile.type){
															statusUpdate.textContent = "첨부한 파일 타입이 현재 브라우저에서 지원하지 않습니다."
															return;
														}
														const updateReader = new FileReader();
														updateReader.addEventListener('load', event =>{
															outputUpdate.src = event.target.result;
														})
														updateReader.readAsDataURL(updatefile);
													})
												}
											///////////////////////////////
										</script>
                                    </div>
                                </div>
								<div class="modal-footer">
									<button id="update-diary-bnt" class='btn btn-default' name="plannerPlaceId"> 등록 </button>
									<button type="button" class="btn btn-default" data-bs-dismiss="modal">취소</button>
								</div>
                            </div>
                        </div>
                    </div>
					</form>
                </div>
            </div>
        </div>

		<!-- Modal 다이어리 이름 수정-->
		<div id="NameUpdateModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="NameUpdateModal-Title">다이어리 이름 변경</h4>
                    </div>
					<form name="updateNameForm" method="post" action="${pageContext.request.contextPath}/diary/updateName" onSubmit='return checkValidName()' enctype="multipart/form-data" >
						<input type="hidden" name="nowPage" id="edit-name">
						<div class="modal-body">
							<div class="row">
								<div class="col-lg-12">
									<input class="appearance-none block w-full bg-grey-200 text-grey-darker border border-grey-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-grey"
									name="diaryTitle" id="update-diaryName" type="text"  placeholder="변경할 다이어리 이름을 작성하세요.">
								</div>
							</div>
							<div class="modal-footer">
								<button id="update-diaryName-bnt" class='btn btn-default' name="plannerId" value="${requestScope.diary.plannerId}"> 변경 </button>
								<button type="button" class="btn btn-default" data-bs-dismiss="modal">취소</button>
							</div>
                        </div>
					</form>
                </div>
            </div>
        </div>

		<!-- Modal 다이어리 인원,타입 수정-->
		<div id="updateCountAndTypeModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="updateCountAndTypeModal-Title">다이어리 정보 수정</h4>
                    </div>
					<form name="updateCandTForm" method="post" action="${pageContext.request.contextPath}/diary/updateCountAndType" onSubmit='return checkValidCandT()' enctype="multipart/form-data" >
						<input type="hidden" name="nowPage" id="edit-type">
						<div class="modal-body">
							<div class="row">
								<div class="update-col">
									<p><label class="" for="update-diaryType">타입</label></p>
									<p><select id="select-type" name="plannerType">
										<option value='none'>타입 설정</option>
										<option value='연인' >연인</option>
										<option value='나홀로'>나홀로</option>
										<option value='가족/부모님'>가족/부모님</option>
										<option value='친구'>친구</option>
									</select></p>
								</div>
								<div class="update-col">
									<p><label class="" for="update-diaryCount">인원</label></p>
									<input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-red-500 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white-500"
									name="plannerCount" id="update-diaryCount" type="number"  placeholder="0">
								</div>
							</div>
							<div class="modal-footer">
								<button id="update-diaryCandT-bnt" class='btn btn-default' name="plannerId" value="${requestScope.diary.plannerId}"> 변경 </button>
								<button type="button" class="btn btn-default" data-bs-dismiss="modal">취소</button>
							</div>
                        </div>
					</form>
                </div>
            </div>
        </div>

		<!-- Modal 다이어리 삭제 모달-->
		<div id="deleteDiaryModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="NameUpdateModal-Title">다이어리 삭제</h4>
                    </div>
					<form name="deleteForm" method="post" action="${pageContext.request.contextPath}/diary/delete" >
						<div class="modal-body">
							<div class="row">
								<div class="col-lg-12">
									<p id="delete-check-message">다이어리를 삭제하면 기존 플래너도 삭제됩니다.<br>정말로 삭제하시겠습니까?</p>
								</div>
							</div>
							<div class="modal-footer">
								<button id="delete-bnt" class='btn btn-default' name="plannerId" value="${requestScope.diary.plannerId}"> 삭제 </button>
								<button type="button" class="btn btn-default" data-bs-dismiss="modal">취소</button>
							</div>
                        </div>
					</form>
                </div>
            </div>
        </div>
		
	


		
	</body>
</html>