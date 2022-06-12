<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chat/bootstrap.min.css" />
      <!-- site css -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chat/style.css" />

      <!-- select bootstrap -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chat/bootstrap-select.css" />

    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
    
    $(function(){
    	function selectAll(){
			$.ajax({
				url:"${pageContext.request.contextPath}/chat/select", //서버요청주소
				type:"post", // 요청방식(get, post)
				traditional: true,
				dataType:"json",//서버가 응답해주는 데이터타입(text,html,xml,json)
				//data:"${_csrf.parameterName}=${_csrf.token}",//서버에게 보낼 parameter정보
				data: { '${_csrf.parameterName}' : '${_csrf.token}'},
	   			success :function(result){
					
	   					var data ="";

	   				},error : function(err){  
	   					alert(err+"에러 발생했어요.");
	   				}  //실팽했을때 실행할 함수 
	   			});
		}
    	
    	
    	
    	
    })
    
    
    
    </script>
    
</head>
<body class="inner_page widgets">
      <div class="full_container">
         <div class="inner_container">
            <!-- Sidebar  -->
            
            <!-- end sidebar -->
            <!-- right content -->
            <div id="content">
               <!-- topbar -->
               
               <!-- end topbar -->
               <!-- dashboard inner -->
               <div class="midde_cont">
                  <div class="container-fluid">
                     <div class="row column4 graph">
                        <div class="col-md-4">
                           <div class="white_shd full margin_bottom_30">
                              <div class="full graph_head">
                                 <div class="heading1 margin_0">
                                    <h2>Message List</h2>
                                 </div>
                              </div>
                              <div class="full progress_bar_inner">
                                 <div class="row">
                                    <div class="col-md-12">
                                       <div class="msg_section">
                                          <div class="msg_list_main">
                                             <ul class="msg_list">
                                                <li>
                                                   <span><img src="" class="img-responsive" alt="#" /></span>
                                                   <span>
                                                   <span class="name_user">John Smith</span>
                                                   <span class="msg_user">Sed ut perspiciatis unde omnis.</span>
                                                   <span class="time_ago">12 min ago</span>
                                                   </span>
                                                </li>
                                                <li>
                                                   <span><img src="" class="img-responsive" alt="#" /></span>
                                                   <span>
                                                   <span class="name_user">John Smith</span>
                                                   <span class="msg_user">On the other hand, we denounce.</span>
                                                   <span class="time_ago">12 min ago</span>
                                                   </span>
                                                </li>
                                                <li>
                                                   <span><img src="" class="img-responsive" alt="#" /></span>
                                                   <span>
                                                   <span class="name_user">John Smith</span>
                                                   <span class="msg_user">Sed ut perspiciatis unde omnis.</span>
                                                   <span class="time_ago">12 min ago</span>
                                                   </span>
                                                </li>
                                                <li>
                                                   <span><img src="" class="img-responsive" alt="#" /></span>
                                                   <span>
                                                   <span class="name_user">John Smith</span>
                                                   <span class="msg_user">On the other hand, we denounce.</span>
                                                   <span class="time_ago">12 min ago</span>
                                                   </span>
                                                </li>
                                             </ul>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-8">
                           <div class="white_shd full margin_bottom_30">
                              <div class="full graph_head">
                                 <div class="heading1 margin_0">
                                    <h2>Update</h2>
                                 </div>
                              </div>
                              <div class="full progress_bar_inner" style="display: table-">
                                 <div class="row">
                                    <div class="col-md-12">
                                       <div class="msg_list_main">
                                          <ul class="msg_list">
                                             <li>
                                                <span>
                                                <span class="name_user">Herman Beck</span>
                                                <span class="msg_user">Sed ut perspiciatis unde omnis.</span>
                                                <span class="time_ago">12 min ago</span>
                                                </span>
                                             </li>
                                             <li>
                                                <span>
                                                <span class="name_user">John Smith</span>
                                                <span class="msg_user">On the other hand, we denounce.</span>
                                                <span class="time_ago">12 min ago</span>
                                                </span>
                                             </li>
                                             <li>
                                                <span>
                                                <span class="name_user">John Smith</span>
                                                <span class="msg_user">Sed ut perspiciatis unde omnis.</span>
                                                <span class="time_ago">12 min ago</span>
                                                </span>
                                             </li>
                                             <li>
                                                <span>
                                                <span class="name_user">John Smith</span>
                                                <span class="msg_user">On the other hand, we denounce.</span>
                                                <span class="time_ago">12 min ago</span>
                                                </span>
                                             </li>
                                             <li>
                                                <span>
                                                <span class="name_user">John Smith</span>
                                                <span class="msg_user">On the other hand, we denounce.</span>
                                                <span class="time_ago">12 min ago</span>
                                                </span>
                                             </li>
                                             <li>
                                                <span>
                                                <span class="name_user">John Smith</span>
                                                <span class="msg_user">On the other hand, we denounce.</span>
                                                <span class="time_ago">12 min ago</span>
                                                </span>
                                             </li>
                                             <li>
                                                <span>
                                                <span class="name_user">John Smith</span>
                                                <span class="msg_user">On the other hand, we denounce.</span>
                                                <span class="time_ago">12 min ago</span>
                                                </span>
                                             </li>
                                          </ul>
                                          <input type="text" id="enter"><input type="submit" id="enter">
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>

               </div>
            </div>
         </div>
      </div>
      <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

   </body>
</html>