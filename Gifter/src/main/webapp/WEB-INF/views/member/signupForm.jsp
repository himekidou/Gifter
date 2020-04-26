<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
   <meta charset="UTF-8">
   <title>회원가입</title>   
   <script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
   <link href="https://fonts.googleapis.com/css2?family=Bangers&family=Open+Sans:ital,wght@1,800&display=swap" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@1,600&display=swap" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<script type="text/javascript">

   function formCheck(){
      var member_id = document.getElementById("member_id").value;
      var member_pw = document.getElementById("member_pw").value;
      var member_email = document.getElementById("member_email").value;

      if(member_id.length < 3 || member_id.length > 10){
         alert("아이디는 3~10 글자를 입력하세요");
         return false; 
      }
         
      if(member_pw.length < 3 || member_pw.length > 10){
         alert("비밀번호는 3~10 글자를 입력하세요");
         return false; 
      }

      if(member_email == '' || member_email.length == 0){
         alert("이메일을 입력해주세요");
         return false;
      }
      return true; 
   }
</script>
<style type="text/css">
   
   .box1 {
        background: #FB8963;
        grid-row : 1/3;
         
   }
   .box2 {
        background: #DEDEDE;
   }
   .box3 {
        background: #554FFB;
   }
   .box4 {
        background: #225034;
   }
   .box5 {
        background: #EBE6C0;
   }
   * {
        color: white;
        font-weight: normal;
        margin: 0;
        padding: 0;
   }
    .main {
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        grid-template-rows: 70% 30%;         
        height: 100%; 
        width: 100%;    
        font-family: 'Open Sans', sans-serif;      
   } 
   html{
      height: 100%;
   }
   #setting{
       box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25); 
      
   }
   .form-control{
      font-family: 'Montserrat', sans-serif;
   }
   *, *:after, *::before { box-sizing: border-box; }

@font-face {
   font-weight: normal;
   font-style: normal;
   font-family: 'icomoon';
   src:url('../fonts/icomoon/icomoon.eot');
   src:url('../fonts/icomoon/icomoon.eot?#iefix') format('embedded-opentype'),
      url('../fonts/icomoon/icomoon.ttf') format('truetype'),
      url('../fonts/icomoon/icomoon.woff') format('woff'),
      url('../fonts/icomoon/icomoon.svg#icomoon') format('svg');
}

.progress-button {
   position: relative;
   display: inline-block;
   padding: 0 60px;
   outline: none;
   border: none;
   background: #1d9650;
   color: #fff;
   text-transform: uppercase;
   letter-spacing: 1px;
   font-size: 1em;
   line-height: 4;
}

.progress-button[disabled],
.progress-button[disabled].state-loading {
   cursor: default;
}

.progress-button .content {
   position: relative;
   display: block;
}

.progress-button .content::before,
.progress-button .content::after  {
   position: absolute;
   right: 20px;
   color: #0e7138;
   font-family: "icomoon";
   opacity: 0;
   transition: opacity 0.3s 0.3s;
}

.progress-button .content::before {
   content: "e600"; /* Checkmark for success */
}

.progress-button .content::after {
   content: "e601"; /* Cross for error */
}

.progress-button.state-success .content::before,
.progress-button.state-error .content::after {
   opacity: 1;
}

.notransition {
   transition: none !important;
}

.progress-button .progress {
   background: #148544;
}

.progress-button .progress-inner {
   position: absolute;
   left: 0;
   background: #0e7138;
}

.progress-button[data-horizontal] .progress-inner {
   top: 0;
   width: 0;
   height: 100%;
   transition: width 0.3s, opacity 0.3s;
}

.progress-button[data-vertical] .progress-inner {
   bottom: 0;
   width: 100%;
   height: 0;
   transition: height 0.3s, opacity 0.3s;
}

/* Necessary styles for buttons with 3D transforms */

.progress-button[data-perspective] {
   position: relative;
   display: inline-block;
   padding: 0;
   background: transparent;
   perspective: 900px;
}

.progress-button[data-perspective] .content {
   padding: 0 60px;
   background: #1d9650;
}

.progress-button[data-perspective] .progress-wrap {
   display: block;
   transition: transform 0.2s;
   transform-style: preserve-3d;
}

.progress-button[data-perspective] .content,
.progress-button[data-perspective] .progress {
   outline: 1px solid rgba(0,0,0,0); /* Smoothen jagged edges in FF */
}
/* Rotate bottom 3d */
/* ====================== */

.progress-button[data-style="rotate-angle-bottom"] .progress {
   position: absolute;
   top: 100%;
   left: 0;
   width: 100%;
   height: 20px;
   box-shadow: 0 -1px 0 #148544; /* fix the blurriness that causes a gap */
   transform: rotateX(-90deg);
   transform-origin: 50% 0%;
}

.progress-button[data-style="rotate-angle-bottom"].state-loading .progress-wrap {
   transform: rotateX(45deg);
}
</style>

</head>
<body> 
   <div class="main">
       <div class="box1">
           
         </div>
         
         <div class="box2">  
            <br/>  
           <div class="container">
            <ul class="nav justify-content-end">
                <li class="nav-item">
                     <a class="nav-link text-body" href="<c:url value="/"/>" style = "font-size: 1.5vw;">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-body" href="/member/loginForm" style="padding-right: 0; font-size: 1.5vw;">Login</a>
                </li>
              </ul>      
         </div>
         
         <div id="setting" class="container border border-dark align-self-center align-items-center mx-auto m-5 pb-5"  style="width:320px; height:320px; background-color: white; background: rgba(255, 255, 255, 0.25); ">
         <div class="text-center">
            <h2 style="color: black;">Sign Up</h2>   
         </div>
         <div  class="d-flex justify-content-center align-items-center ">
              <form action="signup" method="post" id = "sign_up_box">
                 <div class="form-group">          
                     <label for="id" style="color: black;">ID</label>          
                     <input type="text" class="form-control" placeholder="Please enter 3 to 10 characters" id="member_id" name="member_id" style="width:250px; height:25px; font-size:13px;">      
                </div>         
             <div class="form-group">
                  <label for="pwd" style="color: black;">Password</label>
                  <input type="password" class="form-control" placeholder="Please enter 3 to 10 characters" id="member_pw" name="member_pw" style="width:250px; height:25px; font-size:13px;">
             </div>
             <div class="form-group">          
                  <label for="email" style="color: black;">Email</label>          
                  <input type="email" class="form-control" placeholder="Email to be authenticated" id="member_email" name="member_email" style="width:250px; height:25px; font-size:13px;">      
             </div>   
             <div class="form-group text-center">
                <!-- <input type="submit" class="btn btn-primary" id="btn1 "value="가입" onclick="return formCheck();">           
                &emsp;  -->
                <button 
                      type="submit"
                      id="btn1" value="submit"
                      onclick="return formCheck();"
                      class="progress-button" 
                      data-style="rotate-angle-bottom" 
                      data-perspective data-horizontal>
               <span class="progress-wrap">
                  <span class="content">Submit</span>
                  <span class="progress">
                     <span class="progress-inner"></span>
                  </span>
               </span>
            </button>
                <a href="<c:url value="/"/>"><input type="button" class="btn btn-danger" id="btn2" value="취소"></a>                   
             </div>
              </form>
         </div>
      </div>
                  
       </div>   
       <div class="box3">
             <br/>
             <div class="container">
            <ul class="nav justify-content-start">
                <li class="nav-item">
                     <a class="nav-link text-body" href="/category/bestForm" style="padding-left: 0; font-size: 1.5vw;">Best</a>
                </li>
                <li class="nav-item">
                     <a class="nav-link text-body" href="/category/viewCategory" style = "font-size: 1.5vw;">viewCategory</a>
                </li>
              </ul>   
         </div>
         
         
         </div>
         <div class="box4">
           
         </div>
         <div class="box5">
           
       </div>   
   </div>
</body>
</html>