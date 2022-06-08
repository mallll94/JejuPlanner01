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


            <script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>


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
                function fillUpdateModal(goodsId, goodsAddr, goodsCategory, goodsContent, goodsLocalCategory, goodsName, goodsPhoto, goodsPrice, placeFk) {

                    $('#updateGoodsId').text(goodsId)
                    $('#updateGoodAddr').val(goodsAddr)
                    $('#updateGoodsCategory').val(goodsCategory)
                    $('#updateContent').val(goodsContent)
                    $('#updateLocalCategory').val(goodsLocalCategory)
                    $('#updateGoodsName').val(goodsName)
                    $('#updateGoodsPhoto').val(goodsPhoto)
                    $('#updateGoodsPrice').val(goodsPrice)
                    $('#updatePlaceFk').val(placeFk)
                }
                function fillTable(result) {
                    let text = "";
                    $.each(result, function (index, item) {
                        text += "<tr>"
                        text += '<td>' + item.goodsId + '</td>';
                        text += '<td>' + item.goodsAddr + '</td>';
                        text += '<td>' + item.goodsCategory + '</td>';
                        text += '<td>' + item.goodsContent + '</td>';
                        text += '<td>' + item.goodsLocalCategory + '</td>';
                        text += '<td>' + item.goodsName + '</td>';
                        text += '<td><img src=\"' + item.goodsPhoto + '\"></td>';
                        text += '<td>' + item.goodsPrice + '</td>';
                        text += '<td>' + item.placeFk + '</td>';
                        text += "<td><button type=\"button\" class=\"btn btn-secondary btn-sm\" data-bs-toggle=\"modal\" data-bs-target=\"#updateGoodsModal\" onclick=\"fillUpdateModal(\'" + item.goodsId + "\', \'" + item.goodsAddr + "\', \'" + item.goodsCategory + "\', " + item.goodsContent + ", " + item.goodsLocalCategory + ", " + item.goodsName + ", " + item.goodsPhoto + ", " + item.goodsPrice + ", \'" + item.placeFk + "\')\">수정</button></td>";
                        text += '</tr>';
                    });
                    $("#goodsTable tr:gt(0)").remove();
                    $("#goodsTable tbody").append(text);
                }
                /*도시락 가져오기*/
                function goodsSelectAll() {
                    $.ajax({
                        url: "${path}/ajax",
                        type: "get",
                        dataType: "json",
                        data: { key: "goods", methodName: "getGoodsList" },
                        success: function (result) {
                            fillTable(result)
                        }
                    })
                }
                /* 상품추가 */
                function goodsInsert() {
                    // goodsId, goodsAddr, goodsCategory, goodsContent, goodsLocalCategory, goodsName, goodsPhoto, goodsPrice, placeFk
                    let goodsId = $("#goodsId").val()
                    goodsAddr = $("#goodsAddr").val()
                    goodsCategory = $("#goodsCategory").val()
                    goodsContent = $("#goodsContent").val()
                    goodsLocalCategory = $("#goodsLocalCategory").val()
                    goodsName = $("#goodsName").val()
                    goodsPhoto = $("#goodsPhoto").val()
                    goodsPrice = $("#goodsPrice").val()
                    place = $("#placeFk").val()
                    let data = {
                        goodsId: goodsId,
                        goodsAddr: goodsAddr,
                        goodsCategory: goodsCategory,
                        goodsContent: goodsContent,
                        goodsLocalCategory: goodsLocalCategory,
                        goodsName: goodsName,
                        goodsPhoto: goodsPhoto,
                        goodsPrice: goodsPrice,
                        place: place
                    }
                    $.ajax({
                        url: "${path}/goods",
                        type: "post",
                        data: data,
                        success: function (result) {
                            location.reload()
                        }
                    })
                }
                /*상품 수정하기*/
                function goodsUpdate() {
                    let goodsId = $("#updateGoodsIdHidden").val()
                    goodsAddr = $("#updateGoodsAddr").val()
                    goodsCategory = $("#updateGoodsCategory").val()
                    goodsContent = $("#updatGoodsContent").val()
                    goodsLocalCategory = $("#updateGoodsLocalCategory").val()
                    goodsName = $("#updateGoodsName").val()
                    goodsPhoto = $("#updateGoodsPhoto").val()
                    goodsPrice = $("#updateGoodsPrice").val()
                    placeFk = $("#updateGoodsplaceFk :selected").val()
                    $.ajax({
                        url: "${path}/ajax",
                        type: "post",
                        data: {
                            key: "goods",
                            methodName: "getGoodsUpdate",
                            goodsId: goodsId,
                            goodsAddr: goodsAddr,
                            goodsCategory: goodsCategory,
                            goodsContent: goodsContent,
                            goodsLocalCategory: goodsLocalCategory,
                            goodsName: goodsName,
                            goodsPhoto: goodsPhoto,
                            goodsPrice: goodsPrice

                        },
                        success: function (result) {
                            //console.log('들어오냐')
                            location.reload()
                        }
                    })
                }
                // /*판매중인것들만 조회*/
                // function mealSelectByForSale() {
                //     let sale = $("#mealSelectByForSale").val()
                //     let methodName = ''
                //     if (sale === '전체조회') {
                //         methodName = 'getMealList'
                //     } else {
                //         methodName = 'getMealSelectForSale'
                //     }
                //     $.ajax({
                //         url: "${path}/ajax",
                //         type: "get",
                //         dataType: "json",
                //         data: { key: "meal", methodName: methodName },
                //         success: function (result) {
                //             fillTable(result)
                //         }
                //     })
                // }
                /*상품이름으로 검색하기*/
                // function mealSelectByKeyword() {
                //     let keyword = $("#searchkeyword").val()
                //     $.ajax({
                //         url: "${path}/ajax",
                //         type: "get",
                //         dataType: "json",
                //         data: { key: "meal", methodName: "mealSelectByMealId", keyword: keyword },
                //         success: function (result) {
                //             fillTable(result)
                //         }
                //     })
                // }
                $(function () {
                })
            </script>

        </head>

        <body>
            <div style="width: 100%; padding: 100px 50px 100px 250px;">
                <div class="container-fluid overflow-scroll">
                    <div class="row">
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped table-sm" id="goodsTable">
                            <thead>
                                <tr>
                                    <th scope="col">상품후기ID</th>
                                    <th scope="col">상품후기 내용</th>
                                    <th scope="col">상품후기 사진</th>
                                    <th scope="col">작성 시간</th>
                                    <th scope="col">상품 별점</th>
                                    <th scope="col">Goods_Id</th>
                                    <th scope="col">User_Id</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.goodsReplyList}" var="goods">
                                    <tr>
                                        <td>${goodsReply.goodsReplyId}</td>
                                        <td>${goodsReply.goodsReplyContent}</td>
                                        <td>${goodsReply.goodsReplyPhoto}</td>
                                        <td>${goodsReply.goodReplyRegdate}</td>
                                        <td>${goodsReply.goodsReplyStart}</td>
                                        <td>${goodsReply.goods}</td>
                                        <td>${goodsReply.user}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-2 float-right">
                        <button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal"
                            data-bs-target="#addGoodsModal">+</button>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="addGoodsModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">상품 추가하기</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-4">
                                    <p>상품ID</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="goodsId" value="1">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>상품주소</p>
                                </div>
                                <div class="col-8">
                                    <!-- select box -->
                                    <input type="text" class="spiner-text" id="goodsAddr" value="1">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>카테고리</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="goodsCategory" value="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>상세설명</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="goodsContent" value="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>지역</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="goodsLocalCategory" value="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>상품이름</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="goodsName" value="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>상품사진</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="goodsPhoto" value="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>상품가격</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="goodsPrice" value="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>장소명</p>
                                </div>

                                <div class="container">
                                    <select id="placeSelectInput">
                                        <c:forEach items="${requestScope.placeList}" var="place">
                                            <option value="${place.placeId}">${place.placeName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal"
                                    id="goodsInsert" onclick="goodsInsert()">등록</button>
                                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">취소</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            </div>


            <!-- 수정 모달 -->
            <div id="updateGoodsModal" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">상품 수정하기</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-4">
                                    <p>상품ID</p>
                                </div>
                                <div class="col-8">
                                    <p id="updateGoodsId"></p>
                                    <input type="hidden" class="spiner-text" id="updateGoodsIdHidden" value="">
                                </div>
                            </div>
                            <input type="hidden" class="spiner-text" id="updateGoodsIdHidden" value="">
                            <div class="row">
                                <div class="col-4">
                                    <p>상품주소</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="updateGoodsAddr" value="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>카테고리</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="updateGoodsCategory" value="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>상세설명</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="updateGoodsContent" value="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>지역</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="updateGoodsLocalCategory" value="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>상품이름</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="updateGoodsName" value="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>상품사진</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="updateGoodsPhoto" value="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>상품가격</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="updateGoodsPrice" value="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>장소명</p>
                                </div>
                                <div class="container">
                                    <select id="placeFk">
                                        <c:forEach items="${requestScope.placeList}" var="place">
                                            <option value="${place.placeId}">${place.placeName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="updatePlaceFk" value="">
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary btn-sm"
                                    onclick="goodsUpdate()">등록</button>
                                <button type="button" class="btn btn-secondary btn-sm"
                                    data-bs-dismiss="modal">취소</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </body>

        </html>