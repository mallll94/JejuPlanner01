<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!doctype html>
        <html lang="en">

        <head>
            <!-- Required meta tags -->
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

            <title>상품관리 페이지</title>
            <!-- 부트스트랩 CSS CDN -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                crossorigin="anonymous">

            <!-- 부트스트랩 JS CDN -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
                crossorigin="anonymous"></script>


            <script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>


            <style>
                .wrap {
                    width: 900px;
                    margin: 10px auto;
                }

                img {
                    width: 70px;
                    height: 70px;
                }
            </style>

            <script type="text/javascript">


                $(function () {

                    //수정하기 ajax
                    function modalUpdate(goodsId){
                        $.ajax({
                            url: "${pageContext.request.contextPath}/goods/updateForm",
                            type: "post",
                            dataType: "json",
                            data: {goodsId: goodsId},
                            success: function(result){
                                //var photo = result.diaryLinePhoto;
                                
                                $("#updateGoodsAddr").val(result.goodsAddr);
                                $("#updateGoodsCategory").val(result.goodsLocalCategory);
                                $("#updateGoodsContent").val(result.goodsContent);
                                $("#updateGoodsLocalCategory").val(result.goodsCategory);
                                $("#updateGoodsName").val(result.goodsName);
                                $("#savedGoodsPhoto").val(result.goodsPhoto);//기존 저장된 사진 있는지 확인용
                                $("#updateGoodsPrice").val(result.goodsPrice);

                                // if(photo){
                                //     console.log("photo값:"+photo)
                                //     //$("#update-diary-diaryPhoto").val(result.diaryLinePhoto); //file 타입에 값 넣는건 보안상의문제로 안됨 
                                //     $("#update-diary-preview-image").attr("src", "/images/place/"+result.diaryLinePhoto )
                                // }
                                

                            },
                            error: function(error){
                                alert("정보를 불러올 수 없습니다.")
                            }
                        })
                    }

                    //수정하기 값전달
                    $(document).on("click","#goods-update-bnt",function(){
                        let target = $(this).attr('goodsId');
                        console.log("수정할 gooodsid"+target)
                        $('#updateGoodsId').val(target)
                        modalUpdate(target)
                        
                    })
                })
            </script>

        </head>

        <body>
            <div class="row">
                <div class="col-2 float-right">
                    <button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal"
                        data-bs-target="#addGoodsModal">+</button>
                </div>
            </div>


            <div class="modal fade" id="addGoodsModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <form name="insertForm" action="${pageContext.request.contextPath}/goods" method="post" enctype="multipart/form-data">
                            <div class="modal-header">
                                <h4 class="modal-title">상품 추가하기</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-4">
                                        <p>상품ID</p>
                                    </div>
                                    <div class="col-8">
                                        id안들어가도록 해봄
                                        <!-- <input type="hidden" class="spiner-text" id="goodsId" name="goodsId"> -->
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-4">
                                        <p>상품주소</p>
                                    </div>
                                    <div class="col-8">
                                        <!-- select box -->
                                        <input type="text" class="spiner-text" id="goodsAddr" name="goodsAddr"
                                            value="1">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-4">
                                        <p>카테고리</p>
                                    </div>
                                    <div class="col-8">
                                        <input type="text" class="spiner-text" id="goodsCategory" name="goodsCategory"
                                            value="">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-4">
                                        <p>상세설명</p>
                                    </div>
                                    <div class="col-8">
                                        <input type="text" class="spiner-text" id="goodsContent" name="goodsContent"
                                            value="">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-4">
                                        <p>지역</p>
                                    </div>
                                    <div class="col-8">
                                        <input type="text" class="spiner-text" id="goodsLocalCategory"
                                            name="goodsLocalCategory" value="">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-4">
                                        <p>상품이름</p>
                                    </div>
                                    <div class="col-8">
                                        <input type="text" class="spiner-text" id="goodsName" name="goodsName" value="">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-4">
                                        <p>상품사진</p>
                                    </div>
                                    <div class="col-8">
                                        <!-- <input type="text" class="spiner-text" id="goodsPhoto" name="goodsPhoto" value=""> -->
                                        <input id="goodsPhoto"  class="spiner-text" name="file" type="file" accept=".jpg, .jpeg, .png">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-4">
                                        <p>상품가격</p>
                                    </div>
                                    <div class="col-8">
                                        <input type="text" class="spiner-text" id="goodsPrice" name="goodsPrice" value="">
                                        
                                    </div>
                                </div>
                                <!-- <div class="row">
                                    <div class="col-4">
                                        <p>장소명</p>
                                    </div>

                                    <div class="container">
                                        <select id="placeSelectInput" name="placeSelectInput">
                                            <c:forEach items="${requestScope.placeList}" var="place">
                                                <option value="${place.placeId}">${place.placeName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div> -->

                                <div class="modal-footer">
                                    <input type="submit" class="btn btn-secondary btn-sm" data-dismiss="modal" id="goodsInsert">
                                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">취소</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>


            <div style="width: 100%;">
                <div class="container-fluid overflow-scroll">
                    <div class="row">
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped table-sm" id="goodsTable">
                            <thead>
                                <tr>
                                    <th scope="col">상품ID</th>
                                    <th scope="col">상품주소</th>
                                    <th scope="col">카테고리</th>
                                    <th scope="col">상세설명</th>
                                    <th scope="col">지역</th>
                                    <th scope="col">상품이름</th>
                                    <th scope="col">상품사진</th>
                                    <th scope="col">상품가격</th>
                                    <th scope="col">Place_Fk</th>
                                    <th scope="col">수정하기</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.goodsList}" var="goods">
                                    <tr>
                                        <td>${goods.goodsId}</td>
                                        <td>${goods.goodsAddr}</td>
                                        <td>${goods.goodsCategory}</td>
                                        <td>${goods.goodsContent}</td>
                                        <td>${goods.goodsLocalCategory}</td>
                                        <td>${goods.goodsName}</td>
                                        <td>${goods.goodsPhoto}</td>
                                        <td>${goods.goodsPrice}</td>
                                        <td>${goods.place.placeId}</td>
                                        <td><button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal" id="goods-update-bnt"
                                            data-bs-target="#updateGoodsModal" goodsId="${goods.goodsId}">수정하기</button></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>


                <!-- 수정 모달 -->
                <div id="updateGoodsModal" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <form name="insertForm" action="${pageContext.request.contextPath}/goods/updateGoods" method="post" enctype="multipart/form-data">
                                <div class="modal-header">
                                    <h4 class="modal-title">상품 수정하기</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-4">
                                            <p>상품ID</p>
                                        </div>
                                        <div class="col-8">
                                            <input id="updateGoodsId" type="hidden" class="spiner-text"  name="goodsId" value="">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4">
                                            <p>상품주소</p>
                                        </div>
                                        <div class="col-8">
                                            <input type="text" class="spiner-text" id="updateGoodsAddr" name="goodsAddr" value="">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4">
                                            <p>카테고리</p>
                                        </div>
                                        <div class="col-8">
                                            <input type="text" class="spiner-text" id="updateGoodsCategory" name="goodsCategory" value="">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4">
                                            <p>상세설명</p>
                                        </div>
                                        <div class="col-8">
                                            <input type="text" class="spiner-text" id="updateGoodsContent" name="goodsContent" value="">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-4">
                                            <p>지역</p>
                                        </div>
                                        <div class="col-8">
                                            <input type="text" class="spiner-text" id="updateGoodsLocalCategory" name="goodsLocalCategory" value="">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4">
                                            <p>상품이름</p>
                                        </div>
                                        <div class="col-8">
                                            <input type="text" class="spiner-text" id="updateGoodsName" name="goodsName" value="">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4">
                                            <p>상품사진</p>
                                        </div>
                                        <div class="col-8">
                                            기존 사진: <input type="text" class="spiner-text" id="savedGoodsPhoto" value="" readonly>
                                            <input id="updateGoodsPhoto"  class="spiner-text" name="file" type="file" accept=".jpg, .jpeg, .png">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4">
                                            <p>상품가격</p>
                                        </div>
                                        <div class="col-8">
                                            <input type="text" class="spiner-text" id="updateGoodsPrice" name="goodsPrice" value="">
                                        </div>
                                    </div>

                                    <div class="modal-footer">
                                        <!-- <button type="button" class="btn btn-secondary btn-sm" onclick="goodsUpdate()">등록</button> -->
                                        <button id="update-bnt" class="btn btn-secondary btn-sm" >등록</button>
                                        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">취소</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
        </body>

        </html>