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
                                    <th scope="col">상품ID</th>
                                    <th scope="col">상품주소</th>
                                    <th scope="col">카테고리</th>
                                    <th scope="col">상세설명</th>
                                    <th scope="col">지역</th>
                                    <th scope="col">상품이름</th>
                                    <th scope="col">상품사진</th>
                                    <th scope="col">상품가격</th>
                                    <th scope="col">Place_Fk</th>
                                    <th scope="col"></th>
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
                                        <td>${goods.place}</td>
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