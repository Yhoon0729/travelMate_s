<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">



    <meta charset="UTF-8">
    <title>로그인</title>
    <style>
    
    	@font-face {
    		font-family: 'GmarketSansMedium';
    		src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
   			 font-weight: normal;
    		font-style: normal;
    	}
		
        
        
        * {
        	font-family: 'GmarketSansMedium';
     	
    
    
    	  /* 전체적인 스타일 설정 */
        body {
            font-family: sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

		 /* 로그인 배너 스타일 */
        .login-banner {
             position: absolute;
       		 background: linear-gradient(to right, #00256C, #0056b3);
        	 color: white;
        /* padding: 0px 100%; */
        	 width: 100%;
       		 border-radius: 0 0 35px 0;
        font-weight: bold;
       		 display: inline-block;
        	 height: 400px;
        	 z-index: -1000;
        	 top: 0;
        	 left: 0;
        /* margin: 10px 0; */
    }
        }
        
        
        main {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 50px;
        }

        .content-container {
            display: flex;
            width: 1200px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 35px;
            margin-top: 40px;
        }

        .left-section, .right-section {
        	width:1200px;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
            padding: 20px;
        
        }

        .right-section {
            border-left: 1px solid #ddd;
            align-items: center;
           
        }

        .loginForm {
            width: 100%;
            max-width: 400px;
            text-align: center;
            
        }

        .loginForm h2, .loginForm .textForm label {
            margin-bottom: 20px;
            color: #767676;
            text-align: left;
            width: 100%;
        }

        .textForm {
            width: 100%;
            border-bottom: 1px solid #00256C;
            margin: 20px 0;
            padding: 10px 0;
        }

        .id, .pw {
            width: 100%;
            border: none;
            outline: none;
            color: #636e72;
            font-size: 10px;
            height: 25px;
            background: none;
            border-radius: 5px;
             transition: all 0.2s ease-in-out;
        }
        
        .id:hover, .pw:hover {
        	  border: 1px solid #246fff; /* 파란색으로 변경 */
        	
        }

        .btn {
        	margin: 30px auto;
            width: 100%;
            height: 60px;
            background-color: #00256C;
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }

        .additional-links {
            display: flex;
            justify-content: center;
            width: 100%;
            margin-top: 20px;
           
       
        }

        .additional-links a {
        	font-size: 12px;
            color: #007BFF;
            margin: auto 30px;
            
        }

        .additional-links a:hover {
            text-decoration: underline;
        }

        .social-login {
            text-align: center;
            width: 100%;
            margin: 30px auto;
        }

        .social-icons {
            display: flex;
            justify-content: space-around;
            margin-top: 10px;
        }

        .social-icons img {
            width: 40px; /* 예시 크기, 수정 필요 */
        }
        
        .register-link {
   		    height: auto;
    		width: 250px;
    		text-align: center;
   		 /* vertical-align: unset; */
   		    padding: 15px;
   			border: 1px solid #00256C;
    		border-radius: 10px;
   			color: #00256C;
   			font-weight: 600;
   			cursor: pointer;
   			text-decoration: none;
   			margin: 55px 0;
		}
		
		input::placeholder {
		font-size:12px;
		}
		
    </style>
</head>
<body>
 <div class="login-banner">
           
        </div>
    <main>
        <div class="content-container">
            <div class="left-section">
                <h2 style="font-weight:600; color:#00256C; font-size:40px; margin-bottom:10px;">아직,</h2>
                <h2 style="font-weight:600; color:#00256C; font-size:40px; margin-bottom:10px;">트레블메이트 회원이</h2>
                <h2 style="font-weight:600; color:#00256C; font-size:40px; margin-bottom:10px;">아니세요?</h2>
                
                <div class="sub-text" style="margin-top:30px;">
                <p style="color:#00256C; font-size:24px; font-weight:100; margin: 0; margin-top:20px; padding-top:-30px;">회원으로 가입하시고</p>
                <p style="color:#00256C; font-size:24px; font-weight:100;">다양한 혜택을 누려주세요.</p>
               </div>
                <a href="${pageContext.request.contextPath}/user/join" class="register-link">회원가입</a>
          
                
            </div>
            <div class="right-section">
                <form action="loginPro" method="POST" class="loginForm">
                    <h2 style="color:#000; text-align:center;">로그인</h2>
                    <div class="textForm">
                        <label for="userId">아이디</label>
                        <input name="userId" type="text" class="id" placeholder="id를 입력해주세요.">
                    </div>
                    <div class="textForm">
                        <label for="userPass">비밀번호</label>	
                        <input name="userPass" type="password" class="pw" placeholder="비밀번호를 입력해주세요.">
                    </div>
                    <input type="submit" class="btn" value="로그인"/>
                    <div class="additional-links">
                        <a href="/findId">아이디 찾기</a>
                        <a href="/findPassword">비밀번호 찾기</a>
                    </div>
                    <div class="social-login">
                        <p style="color:#555555; font-size:14px;">다른 계정으로 로그인</p>
                        <div class="social-icons">
                           <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="30" height="30"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z"/></svg>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 488 512" width="30" height="30"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M488 261.8C488 403.3 391.1 504 248 504 110.8 504 0 393.2 0 256S110.8 8 248 8c66.8 0 123 24.5 166.3 64.9l-67.5 64.9C258.5 52.6 94.3 116.6 94.3 256c0 86.5 69.1 156.6 153.7 156.6 98.2 0 135-70.4 140.8-106.9H248v-85.3h236.1c2.3 12.7 3.9 24.9 3.9 41.4z"/></svg>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="30" height="30">
                            ><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M311 196.8v81.3c0 2.1-1.6 3.7-3.7 3.7h-13c-1.3 0-2.4-.7-3-1.5l-37.3-50.3v48.2c0 2.1-1.6 3.7-3.7 3.7h-13c-2.1 0-3.7-1.6-3.7-3.7V196.9c0-2.1 1.6-3.7 3.7-3.7h12.9c1.1 0 2.4 .6 3 1.6l37.3 50.3V196.9c0-2.1 1.6-3.7 3.7-3.7h13c2.1-.1 3.8 1.6 3.8 3.5zm-93.7-3.7h-13c-2.1 0-3.7 1.6-3.7 3.7v81.3c0 2.1 1.6 3.7 3.7 3.7h13c2.1 0 3.7-1.6 3.7-3.7V196.8c0-1.9-1.6-3.7-3.7-3.7zm-31.4 68.1H150.3V196.8c0-2.1-1.6-3.7-3.7-3.7h-13c-2.1 0-3.7 1.6-3.7 3.7v81.3c0 1 .3 1.8 1 2.5c.7 .6 1.5 1 2.5 1h52.2c2.1 0 3.7-1.6 3.7-3.7v-13c0-1.9-1.6-3.7-3.5-3.7zm193.7-68.1H327.3c-1.9 0-3.7 1.6-3.7 3.7v81.3c0 1.9 1.6 3.7 3.7 3.7h52.2c2.1 0 3.7-1.6 3.7-3.7V265c0-2.1-1.6-3.7-3.7-3.7H344V247.7h35.5c2.1 0 3.7-1.6 3.7-3.7V230.9c0-2.1-1.6-3.7-3.7-3.7H344V213.5h35.5c2.1 0 3.7-1.6 3.7-3.7v-13c-.1-1.9-1.7-3.7-3.7-3.7zM512 93.4V419.4c-.1 51.2-42.1 92.7-93.4 92.6H92.6C41.4 511.9-.1 469.8 0 418.6V92.6C.1 41.4 42.2-.1 93.4 0H419.4c51.2 .1 92.7 42.1 92.6 93.4zM441.6 233.5c0-83.4-83.7-151.3-186.4-151.3s-186.4 67.9-186.4 151.3c0 74.7 66.3 137.4 155.9 149.3c21.8 4.7 19.3 12.7 14.4 42.1c-.8 4.7-3.8 18.4 16.1 10.1s107.3-63.2 146.5-108.2c27-29.7 39.9-59.8 39.9-93.1z"/></svg>
                           <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" width="40" height="40">
                           <path d="M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5q0 39.3 14.4 81.2c12.8 36.7 59 126.7 107.2 125.2 25.2-.6 43-17.9 75.8-17.9 31.8 0 48.3 17.9 76.4 17.9 48.6-.7 90.4-82.5 102.6-119.3-65.2-30.7-61.7-90-61.7-91.9zm-56.6-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z"/></svg>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </main>
</body>
</html>
