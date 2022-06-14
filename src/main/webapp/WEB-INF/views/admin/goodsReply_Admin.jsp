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
		        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		
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
			    function deleteGoodsReply() {
			    	$.ajax({
						url: "${path}/review/" + $("#goodsReplyId").val(),
						method: "DELETE",
						dataType: "text",
						success: function(result) {
							//console.log('들어오냐')
						},
						complete: function() {
							location.reload()
						}
					})
			    }
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
		                        <c:forEach items="${requestScope.goodsReplyList}" var="goodsReply">
		                            <tr>
		                                <td>${goodsReply.goodsReplyId}</td>
		                                <td>${goodsReply.goodsReplyContent}</td>
		                                <td>${goodsReply.goodsReplyPhoto}</td>
		                                <td>${goodsReply.goodsReplyRegdate}</td>
		                                <td>${goodsReply.goodsReplyStart}</td>
		                                <td>${goodsReply.goods.goodsId}</td>
		                                <td>${goodsReply.user.userId}</td>
		                            </tr>
		                        </c:forEach>
		                    </tbody>
		                </table>
		            </div>
		        </div>
		        <div class="row">
		            <div class="col-2 float-right">
		                <button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal"
		                    data-bs-target="#addGoodsModal">삭제하기</button>
		            </div>
		        </div>
		    </div>
		
		    <div class="modal fade" id="addGoodsModal" role="dialog">
		        <div class="modal-dialog">
		            <!-- Modal content-->
		                <div class="modal-content">
		                    <div class="modal-header">
		                        <h4 class="modal-title">후기 삭제하기</h4>
		                    </div>
		                    <div class="modal-body">
		                        <div class="row">
		                            <div class="col-4">
		                                <p>삭제할 상품후기ID</p>
		                            </div>
		                            <div class="col-8">
		                                <input type="text" class="spiner-text" id="goodsReplyId">
		                            </div>
		                        </div>
		
		                        <div class="modal-footer">
		                            <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal"
		                                id="deletegoodsReply" onclick="deleteGoodsReply()">삭제하기</button>
		                        </div>
		                    </div>
		                  </div>
		        </div>
		    </div>

		</body>
		
		</html>