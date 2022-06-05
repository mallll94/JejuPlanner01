<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <title>plannerIndex</title>
        

	<style>

		#placeContent{
			word-wrap: break-word;
			font-size: small;
			padding-bottom: 5px;
		}
		#placeAddr{
			font-size: small;
		}
	</style>

	</head>
	<body>
	  <button type="button" class="btn btn-light w-100" data-bs-toggle="modal" data-bs-target="#placeInfoModal" >" + mealName + "</button>

	  <!--장소 정보 모달-->
		<div class="modal fade" id="placeInfoModaaa" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">장소 상세 정보</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
				
					<div class="col-xxl">
						<div class="card mb-4">
							<div class="card-header d-flex align-items-center justify-content-between">
								<h5 class="mb-0">장소 상세 정보</h5>
								<!-- <small class="text-muted float-end">Default label</small> -->
							</div>
							<div class="card-body">
								<div class="row mb-3">
									<label class="col-sm-4 col-form-label" for="basic-default-name">변경할 이름</label>
									
								<div class="col-sm-10">
									<input type="hidden" id="placeId" class="form-control placeId-mask" name="plannerId" value="1"/>
									<input type="text" id="placeCategory" class="form-control placeCategory-mask" name="plannerName"/>
									</div>
								</div>
							</div>
							</div>
						</div>
		
				</div>
				<div class="modal-footer">
				<button id="update" type="button" class="btn btn-primary">수정하기</button>
				<button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				</div>
				</form>  
			</div>
			</div>
		</div>

		<!--모달2-->
		<div id="placeInfoModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="placeInfoTitle"></h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-6">
                                <img class="img-fluid" id="placeContent" src="">
                                <!-- 썸네일 이미지 -->
                            </div>
                            <div class="col-6">
                                <div class="row">
                                    
                                    <div class="col-8">
                                        <p id="placeName">placeName</p>
                                    </div>
                                </div>
                                <div class="row">
                                    
                                    <div class="col-8" id="placeContent-area">
                                        <p id="placeContent">placeContentplaceContentplaceContentplaceContentplaceContent</p>
                                    </div>
                                </div>
                                <div class="row">
                                    
                                    <div class="col-8">
                                        <p id="placeAddr">placeAddr</p>
                                    </div>
                                </div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal" id="modal-link-bnt">링크</button>
									<button type="button" class="btn btn-default" data-dismiss="modal">추가하기</button>
								</div>
                            </div>
                        </div>


                        <!-- <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal"
                                onclick="dayMealInsert()">등록</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        </div> -->
                    </div>

                </div>
            </div>
        </div>
	</body>
	</html>