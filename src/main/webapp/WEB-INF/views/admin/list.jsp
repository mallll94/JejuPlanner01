<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>


<script type="text/javascript">
	$(function(){
		function selectAll(){
			$.ajax({
					url:"all", //서버요청주소
					type:"post", // 요청방식(get, post)
					dataType:"json",//서버가 응답해주는 데이터타입(text,html,xml,json)
					data: {json :$("#li").val() , nowPage : 1},//서버에게 보낼 parameter정보
					success: function(result){
						
						var doneLoop =false;
						var paging ="";
						var data = "<table border='1' cellpadding='5'>";
						data+="<tr>";
						data+="<td>ID</td>";
						data+="<td>명칭</td>";
						data+="<td>설명</td>";
						data+="<td>담은 개수</td>";
						data+="</tr>";
						
						$.each(result.pageList.content, function(index, item){
							
						 	data+="<tr>";
							data+="<td>"+item.placeId+"</td>";
							data+="<td>"+item.placeName+"</td>";
							data+="<td>"+item.placeContent+"</td>";
							data+="<td>"+item.placeSave+"</td>";
							data+="</tr>";
							 
						})
						

						//여기서 페이(startPage,blockCount  , TotalPages , nowPagg)
						
			
				 
						
						
						
						
						
						
						 data+="</table>";
						 

						//$("#paging").html(paging);
						$("#table").html(data);
						
					},
					error: function(err){
						alert("ddd");
					}	
			});//ajax
			$("#li").change(function(){	  
				  $.ajax({
					  url:"selectBy", //서버요청주소
					  type:"post", // 요청방식(get, post)
					  dataType:"json",//서버가 응답해주는 데이터타입(text,html,xml,json)
					  data: {filter :$("#li").val() ,name : "selectAll"},//서버에게 보낼 parameter정보
					  success: function(result){
						  
						  var data = "";
							
							$.each(result, function(index, item){
							 	data+="<tr>";
								data+="<td>"+item.placeId+"</td>";
								data+="<td>"+item.placeName+"</td>";
								data+="<td>"+item.placeContent+"</td>";
								data+="<td>"+item.placeSave+"</td>";
								data+="</tr>";
							 }) 
							 $("#table tr:gt(0)").remove();
					   		 $("#table tr:eq(0)").after(data);
							 
							 
					  },
					  error: function(err){
						alert("오류다");
					  }
				  });//ajax
			  });//click 
		};
		
		$("#place").click(function(){	  
			  $.ajax({
				  url:"place", //서버요청주소
				  type:"post", // 요청방식(get, post)
				  dataType:"json",//서버가 응답해주는 데이터타입(text,html,xml,json)
				  data: {filter :$("#li").val() ,name : "장소"},//서버에게 보낼 parameter정보
				  success: function(result){
					  var data = "";
						
						$.each(result, function(index, item){
						 	data+="<tr>";
							data+="<td>"+item.placeId+"</td>";
							data+="<td>"+item.placeName+"</td>";
							data+="<td>"+item.placeContent+"</td>";
							data+="<td>"+item.placeSave+"</td>";
							data+="</tr>";
						 }) 
						 $("#table tr:gt(0)").remove();
				   		 $("#table tr:eq(0)").after(data);
				  },
				  error: function(err){
					alert("오류다");
				  }
	  
			  });//ajax
			  
			  $("#li").change(function(){	  
				  $.ajax({
					  url:"selectBy", //서버요청주소
					  type:"post", // 요청방식(get, post)
					  dataType:"json",//서버가 응답해주는 데이터타입(text,html,xml,json)
					  data: {filter :$("#li").val(),name : "장소"},//서버에게 보낼 parameter정보
					  success: function(result){
						  var data = "";
							
							$.each(result, function(index, item){
							 	data+="<tr>";
								data+="<td>"+item.placeId+"</td>";
								data+="<td>"+item.placeName+"</td>";
								data+="<td>"+item.placeContent+"</td>";
								data+="<td>"+item.placeSave+"</td>";
								data+="</tr>";
							 }) 
							 $("#table tr:gt(0)").remove();
					   		 $("#table tr:eq(0)").after(data);
					  },
					  error: function(err){
						alert("오류다");
					  }
				  });//ajax
			  });//click   
		  });//click
		  
		  $("#home").click(function(){	  
			  $.ajax({
				  url:"home", //서버요청주소
				  type:"post", // 요청방식(get, post)
				  dataType:"json",//서버가 응답해주는 데이터타입(text,html,xml,json)
				  data: {filter :$("#li").val(),name : "숙소"},//서버에게 보낼 parameter정보
				  success: function(result){
					  var data = "";
						
						$.each(result, function(index, item){
						 	data+="<tr>";
							data+="<td>"+item.placeId+"</td>";
							data+="<td>"+item.placeName+"</td>";
							data+="<td>"+item.placeContent+"</td>";
							data+="<td>"+item.placeSave+"</td>";
							data+="</tr>";
						 }) 
						 $("#table tr:gt(0)").remove();
				   		 $("#table tr:eq(0)").after(data);
				  },
				  error: function(err){
					  alert("오류다");
				  }
			  });//ajax
			  
			  $("#li").change(function(){	  
				  $.ajax({
					  url:"selectBy", //서버요청주소
					  type:"post", // 요청방식(get, post)
					  dataType:"json",//서버가 응답해주는 데이터타입(text,html,xml,json)
					  data: {filter :$("#li").val(),name : "숙소"},//서버에게 보낼 parameter정보
					  success: function(result){
						  var data = "";
						  
							$.each(result, function(index, item){
							 	data+="<tr>";
								data+="<td>"+item.placeId+"</td>";
								data+="<td>"+item.placeName+"</td>";
								data+="<td>"+item.placeContent+"</td>";
								data+="<td>"+item.placeSave+"</td>";
								data+="</tr>";
							 }) 
							 $("#table tr:gt(0)").remove();
					   		 $("#table tr:eq(0)").after(data);
					  },
					  error: function(err){
						alert("오류다");
					  }
				  });//ajax
			  });//click   
		  });//click
		  selectAll();
	})
</script>
</head>
<body>
<a href="/admin/list">플래너 데이터 관리</a>


<input type="button" value="장소" id="place"><input type="button" value="숙소" id="home">

	<select id="li">
		<option value='none'>선택</option>
		<option value='placeSave'>인기순</option>
		<option value='placeId'>등록순</option>
		<option value='placeName'>가나다순</option>
	</select>

<div id="table"></div>
<div class="pagination" id="paging"></div>

<a href="/admin/insertForm">등록하기</a>

	 

</body>

</html>