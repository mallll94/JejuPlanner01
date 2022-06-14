<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- google font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
	
	
	<!-- bootstrap -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/planner2/bootstrap.min.css">
	<!-- owl carousel -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/planner2/owl.carousel.css">
	<!-- magnific popup -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/planner2/magnific-popup.css">
	<!-- animate css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/planner2/animate.css">
	<!-- mean menu css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/planner2/meanmenu.min.css">
	<!-- main style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/planner2/main.css">
	<!-- responsive -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/planner2/responsive.css">
	
	
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	<!-- bootstrap -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<!-- count down -->
	<script src="${pageContext.request.contextPath}/js/planner2/jquery.countdown.js"></script>
	<!-- isotope -->
	<script src="${pageContext.request.contextPath}/js/planner2/jquery.isotope-3.0.6.min.js"></script>
	<!-- waypoints -->

	<!-- owl carousel -->
	<script src="${pageContext.request.contextPath}/js/planner2/owl.carousel.min.js"></script>
	<!-- magnific popup -->
	<script src="${pageContext.request.contextPath}/js/planner2/jquery.magnific-popup.min.js"></script>
	<!-- mean menu -->
	<script src="${pageContext.request.contextPath}/js/planner2/jquery.meanmenu.min.js"></script>
	<!-- sticker js -->
	<script src="${pageContext.request.contextPath}/js/planner2/sticker.js"></script>
	<!-- main js -->
	<script src="${pageContext.request.contextPath}/js/planner2/main.js"></script>
	
	
	        <!-- owl carousel -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reply/owl.carousel.css">
        <!-- magnific popup -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reply/magnific-popup.css">
        <!-- animate css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reply/animate.css">
        <!-- mean menu css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reply/meanmenu.min.css">
        <!-- main style -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reply/main.css">
        <!-- responsive -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reply/responsive.css">


        
	
	
<script type = "text/javascript" src = "http://code.jquery.com/jquery-latest.min.js"></script>


<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDAQyf0XE4ptqpDNkKhiwyhT5MJpSrvpd8&callback=initMap&map_ids=a0f291588508440c&region=KR"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
	.col{height: 50px; margin-top: 10px; margin-bottom: 10px;}
	.planner-name{font-size: xx-large; font-weight: bold; color:  rgb(43, 42, 42); padding-right: 10px;}
	.planner-setting{
		color: rgb(214, 212, 212);
		width: 150px;
		outline: none;
		text-align: center;
		font-size: medium;
		font-weight: bold;
		border: 4px solid rgb(80, 80, 80);
		background-color: rgb(80, 80, 80);
		border-radius: 4px;
	}
	.planner-days{
		color: white;
		width: 100px;
		outline: none;
		text-align: center;
		font-size: medium;
		font-weight: bold;
		border: 4px solid cornflowerblue;
		background-color: cornflowerblue;
		border-radius: 4px;
	}
	.planner-type{
		color: white;
		width: 100px;
		outline: none;
		text-align: center;
		font-size: medium;
		font-weight: bold;
		border: 4px solid cornflowerblue;
		background-color: cornflowerblue;
		border-radius: 4px;
	}
	.custom-bnt{
		font-size: large;
		font-weight: bold;
		color: cornflowerblue;
		padding-bottom: 12px;
	}
	.custom-bnt:hover {
		font-size: large;
		font-weight: bold;
		color: rgb(80, 80, 80);
		text-decoration-line: none;
		padding-bottom: 12px;
	}
</style>

<script type="text/javascript">
var mymap;
var markers=[];
var line;
var targets=[];

$(function(){
	//alert("${param.plannerId}")
	$(document).on("change","#days", function(){
		
		selectAll($(this).val());
	});
	
	//날짜더하기
	function dateAdd(date, addDays) {

 		var datetmp = date.replace(/-/g,'');			
 
 		var y = parseInt(datetmp.substr(0, 4));
 		var m = parseInt(datetmp.substr(4, 2));
 		var d = parseInt(datetmp.substr(6,2));

 		d = new Date(y, m - 1, d + addDays);

			y = d.getFullYear();
 		m = d.getMonth() + 1; m = (m < 10) ? '0' + m : m;
 		d = d.getDate(); d = (d < 10) ? '0' + d : d;

		return '' + y + '-' +  m  + '-' + d;		
		}

	function selectAll(no){//1
		
		$.ajax({
			url: "${pageContext.request.contextPath}/planner/select",
			type: "post",
			dataType: "json",
			data: { '${_csrf.parameterName}' : '${_csrf.token}' ,plannerId: $("#plannerId").val() ,DayPlanner : no},
			success: function(result){
				
				let card = "";
				var name = result.planner.plannerName;
				var dayNo = result.dayNo;			
				var dayNoLi = "<option value='0'>✏️일정</option>";

				var saveDayNo= result.dayNo;

				if(no!=0){
					dayNo=no;
				}

				for(let i=0; i <saveDayNo ;i++){
					dayNoLi+=`<option value=${'${i+1}'}>${'${i+1}'}day</option>`;
				}

				deleteMarkers();
				removeRoute();
				getLineColor();
			
				//deleteLine();
				targets =[];
				linestargets =[];
				////////////////////
				for(let v =0;v<result.place.length;v++){
					
					targets.push(new google.maps.LatLng(result.place[v].placeLatitude, result.place[v].placeLongitude))
				}
				
				addMarker(targets);		
				addLine(targets,getLineColor(dayNo))

				let index=0;
				for(let j=1; j<=dayNo;j++){ //dayNo = 1 , 2 ,3 , 4 ,    no=0일때 모두 , no=1 1day, no=2 ,2day	
						
					card+=`<div class='row row-cols-10' class='list'>`;
					if(no==0){
					  card+=`<h1>${'${j}'}Day</h1>`;
					}else{
						if(index==0){
						 card+=`<h1>${'${no}'}Day</h1>`;
						 index++;
						}
					}
					$.each(result.place, function(index, item){
						
						if(item.day==j){
							
							var now =dateAdd(result.planner.plannerStart,j-1);
							
							card+=`<div class='col-lg-3 col-md-3'>`;
							card+=`<div class='single-latest-news'>`;
							card+=`<div class='latest-news-bg news-bg-1' style='background-image: url(/images/place/${"${item.placePhoto}"})'></div>`;
							card+=`<div class='news-text-box'>`;
							card+=`<h3><a href=''>${'${item.placeName}'}</a></h3><p class='blog-meta'>`;
							card+=`<span class='author'><i class='fas fa-user'></i> ${'${result.planner.plannerType}'}</span>`;
							card+=`<span class='date'><i class='fas fa-calendar'></i> ${'${now}'}</span>`;
							card+=`</p><p class='excerpt'>${'${item.placeAddr}'}</p>`;
							card+=`<a href='${"${item.placeUrl}"}' target='_blank' class='read-more-btn'>자세히 보기<i class='fas fa-angle-right'></i></a>`;
							card+=`</div></div></div>`;
						}
						
						
					})
					card+=`</div>`;
					
				}

				
				$("#days").empty();
				$("#days").append(dayNoLi);
				$("#days").val(no);
				
				$("#name").html(name);
				$("#card").empty();
				$("#card").html(card);
				
				$("#countPlan").html(result.planner.plannerCount+"명");
				
			},
			error: function(error){
				alert("장소 정보를 불러오지 못했습니다.")
			}
		})
	}
	
	selectAll(0);
})
//////////////////////////////////////////

function getColor(place,plannerPlace){
	if(place.placeCategory =='장소'){
		if(plannerPlace.plannerPlaceDate==1){
			return 'skyblue';
		}else if(plannerPlace.plannerPlaceDate==2){
			return 'pink'
		}else if(plannerPlace.plannerPlaceDate==3){
			return 'yellow'
		}else if(plannerPlace.plannerPlaceDate==4){
			return 'red'
		}else if(plannerPlace.plannerPlaceDate==5){
			return 'green'
		}	
	}else{
		return 'black';
	}
	
}

function getLineColor(day){	
		if(day==1){
			return "#00C3FF";
		}else if(day==2){
			return "#FFDD00";
		}else if(day==3){
			return "#7C8C91";
		}else if(day==4){
			return "#FF0000";
		}else if(day==5){
			return "#5100FF";
		}else if(day==6){
			return "#FF841F";
		}else if(day==7){
			return "#E9F086";
		}
}
//지도생성
function initMap(){
	const mapDiv= document.getElementById("googleMap");
	mymap = new google.maps.Map(mapDiv,{
		center:new google.maps.LatLng(33.3893, 126.5362),
		zoom:10,
		mapId: "a0f291588508440c",
		streetViewControl: false
	})	
};


//마커표시
function addMarker(targets){
	for(let i=0;i<targets.length;i++){
		var position = targets[i];
		//alert(position)
		let marker = new google.maps.Marker({
		position: position,
		map: mymap,
		//animation: google.maps.Animation.Drop
		})
		//마커 배열 저장
		markers.push(marker);
	}
}
//선 폴리선 생성
function addLine(targets,lineColor){ 
	
    line = new google.maps.Polyline({
      path : targets,
      geodesic:true,
      
      strokeColor: lineColor,
      strokeOpacity:1.0,
      strokeWeight:3
    })
    
    line.setMap(mymap); 
}

//마커삭제
function deleteMarkers() {
	   for (var i = 0; i < markers.length; i++) {
	     markers[i].setMap(null);
	   }
}

function removeRoute(){
	 if(typeof line !== 'undefined'){
	  line.setMap(null);
	 }
}

$(function(){

    var target ='${planBoard.pboardId}'
    var loginUser='${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.userId}' //세션으로 확인한 현재 로그인한 유저
    //var loginManager='${sessionScope.loginManager.managerId}'
    //var loginUser='aaa'
    //alert("로그인 유저 아이디:"+loginUser)
    console.log(target);
    //전체 댓글 검색
	function selectAllReply(){
        $.ajax({
		url: "${pageContext.request.contextPath}/reply/Planboard_Detail" , //서버요청주소
		type: "post" , //요청방식 (get,post...)
		dataType: "json" , //서버가 보내온 데이터(응답)type(text | html | xml | json)
		data: {pboardId: target} , //서버에게 보낼 데이터정보(parameter정보)
		
		success: function(result){

			console.log("검색성공~");
			let str="";
			count = 0;
			if(result=="") {

				str += "<div class='reply-each'>" 
                str+=`<span class="reply-content-text">댓글이 없습니다</span>`;
                str+=`</div>`;
			} else {
				$.each(result,function(index,reply){
				
					str+= `<div class="single-comment-body">`
				    str+= `<div class="comment-user-avater">`	                
	                str+=`<img src="/img/face2.png" alt="face">`
	                str+=`<div class="comment-text-body">`
	                str+=`<h6>\${reply.userId}님<span class="comment-date"></span></h6>&nbsp;`
                   
                    
                    str+=`<p>\${reply.pboardReplyContent}</p>`
                    str+=`<span class="badge rounded-pill text-dark"><a href="javascript:void(0);" id="reply-delete-bnt" name=${'${reply.userId}'} pboardReplyId="${'${reply.pboardReplyId}'}">삭제</a></span>`
                    str+=`</div>`;
          
    				count++;
				})
            }
            $(".comment-list").html();
           	$(".comment-list").append(str);
           	$(".reply-num-count").text(count);
		},

		error: function(err){//실패했을 때 콜백함수
		  alert(err+"오류가 발생했습니다.")
		} 

	    })
    }
    
    $("#reply-insert-btn").click(function(){
        let status =true;
        let replyContent = $('textarea[name=replyContent]').val()
        //댓글 유효성체크
        if(!loginUser){
            alert("댓글 기능은 회원만 가능합니다.")
            status=false;
            return;
        }

        if($("#exampleFormControlTextarea1").val()==""){
            alert("댓글을 입력해 주십시오.")
            $(this).focus();
            status=false;
            return;
        }
        //댓글 달기
        if(status){
            $.ajax({
                url: "${pageContext.request.contextPath}/reply/planinsert" , //서버요청주소
                type: "post" , //요청방식 (get,post...)
                datatype: "text",
                data: {replyContent : replyContent , pboardId : target} , //서버에게 보낼 데이터정보(parameter정보)
                
                success: function(){
                    
        
                        //textarea부분 지우고 
                        $("textarea.form-control").val("")
                        //화면갱신한다
                        selectAllReply();
                    
                },

                error: function(err){//실패했을 때 콜백함수
                alert("오류가 발생했습니다.")
                } 

	        })
        }
    })
    
    $(document).on("click","#reply-delete-bnt",function(){
        
        var replyId = $(this).attr("name")
        //alert("댓글유저아이디~~"+replyId)
        var pboardReplyId =$(this).attr("pboardReplyId")
        //alert(replyNo)

        //세션에서 로그인한 유저와 댓글 작성자 id가 일치하는지 확인
        if(loginUser==replyId||loginManager==replyId){
            $.ajax({
                url: "${pageContext.request.contextPath}/reply/delete" , //서버요청주소
                type: "post" , //요청방식 (get,post...)
              
                data: {pboardReplyId: pboardReplyId } , //서버에게 보낼 데이터정보(parameter정보)
                
                success: function(){
                 
                        selectAllReply(); //화면갱신
                    
                
                },

                error: function(){//실패했을 때 콜백함수
                alert("오류가 발생했습니다.")
                } 

	        })
        }else{
            alert("댓글은 자신이 단 댓글만 삭제 가능합니다.")
        }
    })
    

  selectAllReply();

})

 $(function(){
	$("button[value=수정]").click(function() {
    	$("#requestForm").attr("action", "${pageContext.request.contextPath}/board/pupdateForm");
		$("#requestForm").submit();
	})
	
     $("button[value=삭제]").click(function() {
    	$("#requestForm").attr("action", "${pageContext.request.contextPath}/board/pdelete");
		$("#requestForm").submit();
	}) 
 }) 
 
$(document).ready(function(){

	const pboardId = "${planBoard.pboardId}";
	const userId = "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.userId}";
	
	//var isChecked = ${isChecked};
	//console.log(isChecked);
	if (isChecked) {
		console.log("이미 좋아요 함");
		$("#liked-heart").attr('class','bi-heart-fill');
	}else{
		$("#liked-heart").attr('class','bi-heart');
	}
	
	
	//좋아요 버튼 클릭시 실행 
	$("#liked-heart").on("click", function(){
		$.ajax({
			url: "${pageContext.request.contextPath}/like",
			type: "post",
			data:{pboardId : pboardId , userId : userId},
			dataType: "text",
			success: function(result){
				var oResult = JSON.parse(result);
				console.log(oResult);
				if(oResult.checked){
					$("#liked-heart").attr('class','bi-heart-fill');
				}else{
					$("#liked-heart").attr('class','bi-heart');
				}
				document.getElementById("likes-count").innerHTML = oResult.likesCount;
			}, error : function(err){
				alert("오류가 났습니다.")
			}
			
		})
		
	})
	
	
}) 
 
</script>
</head>
<body>


	<div class="container-fluid pt-5">
  	   <div class="text-center mb-4" style="position: relative; top: -30px">
      	  <h3 class="section-title px-5"><span class="px-2">플래너공유 게시판</span></h3> 
  	   </div>
  
  	<div align="center">
      <div class="col-lg-7 mb-5">
          <div class="contact-form">
              <div id="success"></div>
              <select id="days" class="planner-days"></select>
			  <select id="plannerType" class="planner-type">
					<option value='연인' >❤️연인</option>
					<option value='나홀로'>🧘나홀로</option>
					<option value='가족/부모님'>🏠가족</option>
				<option value='친구'>🧑‍🤝‍🧑친구</option>
			    </select>
			

              <!-- 하트 -->
              <div align="right">
                <i id="liked-heart" class="bi bi-heart" style="font-size:1.5rem; color: red; cursor: pointer;"></i>
                좋아요 <span id="likes-count">${planBoard.likesCount}</span>       
			 </div>	
			   

 		<div class="control-group" style="text-align: left;">
         	카테고리 <input type="text" readonly class="form-control" id="pboardCategory" name="pboardCategory" value="${planBoard.pboardCategory}"/>
         <p class="help-block text-danger"></p>
 		</div>
 
 		<div class="control-group" style="text-align: left;">
         	제목 <input type="text" readonly class="form-control" id="pboardTitle" name="pboardTitle" value="${planBoard.pboardTitle}"/>
         <p class="help-block text-danger"></p>
 		</div>
 		<div class="control-group" style="text-align: left;">
        	내용 <textarea readonly class="form-control" rows="6" id="pboardContent" name="pboardContent" style="resize: none">${planBoard.pboardContent}</textarea>
         <p class="help-block text-danger"></p>
 		</div>
   
  		<h5 class="card-header" style="text-align: left;">첨부파일</h5>
			<div class="card-body" align="left">
 				<div class="mb-3">
   				   <img alt = "첨부된 이미지" src="/images/planboard/${planBoard.pboardAttach}" width="300" height="300">
  				</div>
			</div>
  
       <div align="right">
       <form name="requestForm" method="post" id="requestForm">
       <input type="hidden" name="pboardId" value="${planBoard.pboardId}">
	      <button type="button" class="btn btn-primary" value="수정">수정</button>
	      <button type="button" class="btn btn-primary" value="삭제">삭제</button>
       </form>  
      </div>
     	 
     </div>            
  </div>
</div>
<!--댓글 등록하기-->
<div class="card">
    <div class="card-body">
    	<form name="reply-loginUser-insert" method="post" id="reply-loginUser-insert">
            <div class="form-inline mb-2" style="font-size:1.5rem">
              <i class="bi bi-file-person" style="font-size:1.8rem"></i>         
                <span><strong>${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.userId}님</strong></span>
                <input type="hidden" name="reply_id" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.userId}"><!-- 나중에 세션으로 아이디 받기 -->
            </div>
            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="replyContent" style="resize: none" placeholder="댓글을 입력해주세요"></textarea>
            <input type="hidden" name="planBoardId" value="${planBoard.pboardId}">
            <button type="button" class="btn btn-dark mt-3" id="reply-insert-btn" style="float: right;">댓글 등록하기</button>
    	</form>
    </div>
</div>


<div class="reply-num" >
<i class="bi bi-chat-right-text-fill" style="font-size:1.7rem"></i>
   Comments : <span class="reply-num-count"></span>개
   
</div>
<div class="comment-list"></div>
</div>


  <!-- <div class="review_reply_wrap" style="margin-left: 320px">  
     <div id="review_reply_output">

  </div>
</div> -->





   
<input type="hidden" value="${planBoard.userPlan.plannerId }" id="plannerId">




<!-- jquery -->
        <script src="${pageContext.request.contextPath}/js/reply/jquery-1.11.3.min.js"></script>
        <!-- bootstrap -->
        <script src="${pageContext.request.contextPath}/js/reply/bootstrap.min.js"></script>
        <!-- count down -->
        <script src="${pageContext.request.contextPath}/js/reply/jquery.countdown.js"></script>
        <!-- isotope -->
        <script src="${pageContext.request.contextPath}/js/reply/jquery.isotope-3.0.6.min.js"></script>
        <!-- waypoints -->
        <script src="${pageContext.request.contextPath}/js/reply/waypoints.js"></script>
        <!-- owl carousel -->
        <script src="${pageContext.request.contextPath}/js/reply/owl.carousel.min.js"></script>
        <!-- magnific popup -->
        <script src="${pageContext.request.contextPath}/js/reply/jquery.magnific-popup.min.js"></script>
        <!-- mean menu -->
        <script src="${pageContext.request.contextPath}/js/reply/jquery.meanmenu.min.js"></script>
        <!-- sticker js -->
        <script src="${pageContext.request.contextPath}/js/reply/sticker.js"></script>
        <!-- main js -->
        <script src="${pageContext.request.contextPath}/js/reply/main.js"></script>


</body>
</html>