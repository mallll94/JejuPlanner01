<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<style type="text/css">



</style>


<script type="text/javascript">
	$(function(){
		//인기순/등록순관련
		  $(".typeName").click(function(){
				$("#name").val($(this).val());
			})
		
		
		
		function selectAll(paramNowPage){	
			if(paramNowPage == "undefined" || paramNowPage=="" || paramNowPage==null){
				paramNowPage=1;
			}
			
			$.ajax({
					url:"${pageContext.request.contextPath}/admin/all", //서버요청주소
					type:"post", // 요청방식(get, post)
					dataType:"json",//서버가 응답해주는 데이터타입(text,html,xml,json)
					data: {json :$("#li").val(), nowPage :paramNowPage},//서버에게 보낼 parameter정보
					success: function(result){
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
						data+="</table>";
						
						if((result.startPage-result.blockCount) > 0){	
							paging +=`<a class='pagination-newer' href='#' id='nowPage'>PREV</a>`
							paging +=`<input type='hidden' id='PrevPage' value=${'${result.startPage-1}'}>`;
						}	
						paging +=`<span class='pagination-inner'>`;
					    for(let i=result.startPage ; i<=(result.startPage-1)+result.blockCount ;i++ ){
					    	if((i-1) >= result.totalPages)break
					    	paging +=`<a class='${i==nowPage?"pagination-active":page}' href='#'  id='nowPage'>${"${i}"}</a>`;
					    	
					    }
						paging +=`</span>`;
						if((result.startPage+result.blockCount)<=result.totalPages){	
							paging +=`<a class='pagination-older' href='#' id='nowPage'>NEXT</a>`;
							paging +=`<input type='hidden' id='NextPage' value=${'${result.startPage+result.blockCount}'}>`;
						}	
						$("#paging").html(paging);
						$("#table").html(data);
					},
					error: function(err){
						alert(err);
					}	
			});//ajax
		};
		///////////////////////////////////	
		$(document).on("click","#nowPage", function(){
			if($(this).text() == "NEXT"){
				selectAll($("#NextPage").val())
			}else if($(this).text() == "PREV"){
				selectAll($("#PrevPage").val())
			}else{
				selectAll($(this).text())
			}
		});
		//////////////////////////////

		$(".typeName").click(function(){	  
			  $.ajax({
				  url:"typeName", //서버요청주소
				  type:"post", // 요청방식(get, post)
				  dataType:"json",//서버가 응답해주는 데이터타입(text,html,xml,json)
				  data: {filter :$("#li").val() ,name :  $("#name").val()},//서버에게 보낼 parameter정보
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
				   		//$("#paging").remove();
				  },
				  error: function(err){
					alert(err);
				  }
			  });//ajax  
		  });//click


			
			$("#li").change(function(){	  
				  $.ajax({
					  url:"selectBy",
					  type:"post",
					  dataType:"json",
					  data: {filter :$("#li").val() ,name : $("#name").val()},
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
						alert(err);
					  }
				  });//ajax
			  });//click 

		  selectAll();
	})
</script>
</head>
<body>
<a href="${pageContext.request.contextPath}/admin/list">플래너 데이터 관리</a>


<input type="button" value="장소" id="place" class="typeName"><input type="button" value="숙소" id="home" class="typeName">
<input type="hidden" value="selectAll" id="name">
	<select id="li">
		<option value='none'>선택</option>
		<option value='placeSave'>인기순</option>
		<option value='placeId'>등록순</option>
		<option value='placeName'>가나다순</option>
	</select>

<div id="table"></div>
<nav class="pagination-container">
<div class="pagination" id="paging"></div>
</nav>
<a href="/admin/insertForm" >등록하기1</a>
<div id="test"></div>
	 

</body>

</html>