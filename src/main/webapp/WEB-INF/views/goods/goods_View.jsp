<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
		<html lang="zxx">
		
		<head>
		    <meta charset="UTF-8">
		    <meta name="description" content="Azenta Template">
		    <meta name="keywords" content="Azenta, unica, creative, html">
		    <meta name="viewport" content="width=device-width, initial-scale=1.0">
		    <meta http-equiv="X-UA-Compatible" content="ie=edge">
		    <title>Azenta | Template</title>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/datepicker.css">
		    <!-- CSS only -->
		    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		    <!-- jQuery -->
		    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
		    <!-- JavaScript Bundle with Popper -->
		    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		        crossorigin="anonymous"></script>
		    <!-- <%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css"> --%> -->
		    <!-- jQuery ui -->
		    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
		        integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
		        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		    <!-- jQuery ui -->
		    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"
		        integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ=="
		        crossorigin="anonymous" referrerpolicy="no-referrer" />
		    <!-- <style type="text/css" src=""></style>
		            <%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/datepicker.css"> --%> -->
		    <!-- Google Font -->
		    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900&display=swap"
		        rel="stylesheet">
		
		    <!-- Css Styles -->
		    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/bootstrap.min.css"
                type="text/css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/font-awesome.min.css"
                type="text/css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/elegant-icons.css"
                type="text/css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/themify-icons.css"
                type="text/css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/nice-select.css" type="text/css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/jquery-ui.min.css"
                type="text/css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/owl.carousel.min.css"
                type="text/css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/magnific-popup.css"
                type="text/css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/slicknav.min.css" type="text/css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/style.css" type="text/css">
		
		    <style>
		        .search-btn {
		            margin-bottom: 20px;
		        }
		
		        .goodsId {
		            margin-top: 20px;
		            margin-bottom: 20px;
		        }
		
		        .property-sidebar {
		            margin-top: 135px;
		
			
				
		        }
		        
		    </style>
		    <script type="text/javascript">
		        $(function () {
		            function calcTotalPrice() {
		                price = $("#goodsprice").text();
		                quantity = $("input[name=cartQty]").val();
		                cartPeriod = parseInt($("select[name=cartPeriod]").val());
		                cartWeekday = 0;
		                if ($("select[name=cartWeekDay]").val() == "T") {
		                    cartWeekday = 3 / 5;
		                } else {
		                    cartWeekday = 1;
		                }
		
		                $("#goodstotalprice").text(price * quantity * cartWeekday * cartPeriod);
		            }
		
		
		            // datepicker 설정
		            $.datepicker.setDefaults({
		                dateFormat: 'yy-mm-dd',
		                prevText: '이전 달',
		                nextText: '다음 달',
		                monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		                monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		                dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		                dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		                showMonthAfterYear: true,
		                yearSuffix: '년'
		            });
		
		            $("#datePicker").datepicker();
		
		            // 수량 감소 시 DB 업데이트
		            $(document).on("click", "button[name=minus]", function () {
		                let updateNum = parseInt($(this).next().val()) - 1;
		                if (updateNum <= 0) {
		                    alert("수량을 하나 이상 입력해주세요.");
		                    updateNum = 1;
		                }
		                $(this).next().val(updateNum);
		                calcTotalPrice();
		            }); // 수량 감소 업데이트 종료
		
		            // 수량 증가 시 DB 업데이트
		            $(document).on("click", "button[name=plus]", function () {
		                let updateNum = parseInt($(this).prev().val()) + 1;
		                $(this).prev().val(updateNum);
		                calcTotalPrice();
		            }); // 수량 증가 업데이트 종료
		
		
		            $(".selectpicker").click(function () {
		                calcTotalPrice();
		            });
		
		            $("#cart").click(function () {
		                $("#goodsViewForm").attr("action", "${pageContext.request.contextPath}/cart/cartInsert");
		                $("#goodsViewForm").submit();
		            })
		
		
		        })
		
		
		
		
		
		    </script>
		</head>
		
		<body>
		
		    <!-- Property Details Section Begin -->
		
    <section class="property-details-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="pd-details-text">
                        <div class="pd-details-social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-send"></i></a>
                            <a href="#"><i class="fa fa-star"></i></a>
                            <a href="#"><i class="fa fa-print"></i></a>
                            <a href="#"><i class="fa fa-cloud-download"></i></a>
                        </div>
                        <div class="goodsId">
                            <h2><strong>${goods.goodsName}</strong></h2>
                        </div>

                        <table class="left-table">
                            <tbody>
                                <tr>
                                    <td class="pt-name">${goods.goodsLocalCategory}</td>
                                </tr>
                                <tr>
                                    <td class="p-value">${goods.goodsCategory}</td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="property-more-pic">
                            <div class="product-pic-zoom">
                                <img class="product-big-img" src="img/properties/property-details-b1.jpg" alt="">
                            </div>
                            <div class="product-thumbs">
                                <div class="product-thumbs-track ps-slider owl-carousel">
                                    <div class="pt" data-imgbigurl="img/properties/property-details-b2.jpg"><img
                                            src="img/properties/thumb-1.jpg" alt=""></div>
                                    <div class="pt active" data-imgbigurl="img/properties/property-details-b1.jpg"><img
                                            src="img/properties/thumb-2.jpg" alt=""></div>
                                    <div class="pt" data-imgbigurl="img/properties/property-details-b3.jpg"><img
                                            src="img/properties/thumb-3.jpg" alt=""></div>
                                    <div class="pt" data-imgbigurl="img/properties/property-details-b4.jpg"><img
                                            src="img/properties/thumb-4.jpg" alt=""></div>
                                    <div class="pt" data-imgbigurl="img/properties/property-details-b5.jpg"><img
                                            src="img/properties/thumb-5.jpg" alt=""></div>
                                </div>
                            </div>
                        </div>
                        <div class="pd-desc">
                            <h4>상품상세</h4>
                            <p>${goods.goodsContent}</p>
                        </div>
                        <div class="pd-details-tab">
                            <div class="tab-item">
                                <ul class="nav" role="tablist">
                                    <li>
                                        <a class="active" data-toggle="tab" href="#tab-1" role="tab">상품후기</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="tab-item-content">
                                <div class="tab-content">
                                    <div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
                                        <div class="property-more-table">
                                            <table class="left-table">
                                                <tbody>
                                                    <tr>
                                                        <td class="pt-name">Price</td>
                                                        <td class="p-value">$ 138,000</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="pt-name">Property Type</td>
                                                        <td class="p-value">Villa</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="pt-name">Year Built</td>
                                                        <td class="p-value">2016</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="pt-name">Bathrooms</td>
                                                        <td class="p-value">3</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="pt-name">Rooms</td>
                                                        <td class="p-value">12</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="pt-name">Parking lots</td>
                                                        <td class="p-value">3</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="pt-name">Lot area</td>
                                                        <td class="p-value">200 spft</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <table class="right-table">
                                                <tbody>
                                                    <tr>
                                                        <td class="pt-name">Agent</td>
                                                        <td class="p-value">Adam Smith</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="pt-name">Reference</td>
                                                        <td class="p-value">#2019</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="pt-name">Contract type</td>
                                                        <td class="p-value">Sale</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="pt-name">Beds</td>
                                                        <td class="p-value">4</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="pt-name">Garages</td>
                                                        <td class="p-value">2</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="pt-name">Home area</td>
                                                        <td class="p-value">1200 sqft</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="pt-name">Gara Size</td>
                                                        <td class="p-value">200 sqft</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="property-sidebar">
                        <!-- <h4>Search Property</h4> -->
                        <div class="sidebar-search">
                            <table class="table option-table table-borderless">
                                <tbody>
                                    <tr>
                                        <td>
                                            <p>상품 금액</p>
                                        </td>
                                        <td>
                                            ${goods.goodsPrice}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p>티켓 날짜 선택</p>
                                        </td>
                                        </td>
                                        <td>
                                            <input type="text" id="datePicker" name="goodsLineDate"
                                                class="datepicker set-datepicker" placeholder="날짜를 선택하세요"
                                                readonly="readonly" required>
                                        </td>
                                        </td>
                                    </tr>
                                </tbody>
                                <tr>
                                    <td>
                                        <p>수량 선택</p>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-outline-dark shadow-none btn-sm"
                                            name="minus"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                fill="currentColor" class="bi bi-dash" viewBox="0 0 16 16">
                                                <path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z" />
                                            </svg></button>
                                        <input type="number" class="form-control-plaintext num" name="cartQty" min="1"
                                            max="9999" step="1" value="1" readonly="readonly">
                                        <button type="button" class="btn btn-outline-dark shadow-none btn-sm"
                                            name="plus"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
                                                <path
                                                    d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                                            </svg></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>총 상품 금액</p>
                                    </td>
                                    <td>
                                        <h5><span class="goodstotalprice" id="goodstotalprice"></span></h5>
                                    </td>
                                </tr>
                            </table>
                            <button type="submit" class="search-btn">1:1 문의</button>
                            <div class="sidebar-btn">
                                <div class="bt-item">
                                    <button type="button" class="form-control btn btn-dark shadow-none btn-lg"
                                        id="order" checked>예약하기</button>
                                </div>
                                <div class="bt-item">
                                    <button type="submit" class="form-control btn btn-outline-dark shadow-none btn-lg"
                                        id="cart">위시리스트</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
		
		
		
		    <!-- Js Plugins -->
	    <script src="${pageContext.request.contextPath}/js/goods/jquery-3.3.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/goods/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/goods/jquery.magnific-popup.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/goods/jquery.nice-select.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/goods/jquery.slicknav.js"></script>
        <script src="${pageContext.request.contextPath}/js/goods/jquery-ui.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/goods/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/goods/main.js"></script>
		</body>

		</html>