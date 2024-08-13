<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <style>
    	@font-face {
    		font-family: 'GmarketSansMedium';
    		src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
   			 font-weight: normal;
    		font-style: normal;
}
		
        /* 전체적인 스타일 설정 */
        
        * {
        	font-family: 'GmarketSansMedium';
        
        }
        body {
            background-color: #fff; /* 전체 배경색 */
            font-family: 'GmarketSansMedium';
        }

        /* 메인 컨테이너 스타일 */
        .main-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        /* 폼 컨테이너 스타일 */
        .form-container {
            width: 1280px;
            padding: 30px 40px;
            background-color: #FFFFFF;
            border-radius: 15px;
            margin-top: 10px; /* 위쪽 마진 추가 */
            color: #767676;
        }
        
        
        
        /* 폼 로고 스타일 */
        .form-header-logo {
        	width: 1280px;
        }
        
        
        .form-header-logo h1{
        	position : relative;
        	left: 55px;
        	color: #00256C;
        	text-align: left;
        		
        }	

        /* 폼 헤더 스타일 */
        .form-header {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
            margin: 50px auto;
        }
        /* 폼 헤더 텍스트 스타일 */
        .form-header div{
        	font-size: 12px;
        	margin: 0 50px;
        }
        
        .form-header .user-input-icon{
        	color: #00256C;
        	font-weight: 700;

        }

        .form-header h1 {
            font-size: 21px; /* 크기 증가 */
            color: #333;
            text-align: left;
            flex-grow: 1;
        }

		
        /* 입력 행 스타일 */
        .input-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        /* 입력 그룹 스타일 */
        .input-group {
            flex: 1;
            margin-right: 20px; /* 간격 조정 */
            position: relative;
            margin: 60px 30px;
        }

        .input-group:last-child {
            margin-right: 0;
        }

        /* 입력 라벨 스타일 */
        .input-label {
            font-size: 14px;
            margin-bottom: 30px;
            display: block;
        }

        /* 입력 필드 스타일 */
        .input-group input, .input-group select {
            width: 100%;
            padding: 8px;
            border: none;
            border-bottom: 1px solid #00256c; /* 기본 선 */
            border-radius: 5px;
            outline: none;
            transition: all 0.2s ease-in-out;
        }

        /* 호버 효과 */
        .input-group input:hover, .input-group input:focus {
            border: 1px solid #246fff; /* 파란색으로 변경 */
            padding-bottom: 6px; /* 패딩 조정 */
            
        }

        /* 버튼 스타일 */
        .buttons {
            display: flex;
            justify-content: center;
            
          
        }

        .button {
            padding: 15px 150px;
            border-radius: 5px;
            border:none;
            cursor: pointer;
            font-size: 16px;
            color: white;
            margin: auto 40px;
             
        }

        .primary {
            background-color: #00256C;
        }

        .primary:hover {
          
        }

        .secondary {
            background-color: #ffff;
            border : 1px solid #00256C;
            color: #00256C;
            
        }

        .secondary:hover {
          
        }
    </style>
</head>
<body>
    <div class="main-container">
        <!-- 폼 헤더 -->
        <div class="form-header-logo">
        <h1>회원가입</h1> <!-- 크기 및 위치 변경 -->
        </div>
        <div class="form-header">
        <img src="<%=request.getContextPath()%>/img/Register/register.svg" style="width:2%; position:relative; left: 40px;
    top: 3px;">
            <div class="user-input-icon">회원정보 입력</div>
             <img src="<%=request.getContextPath()%>/img/Register/Check.svg" style="width:2%; position:relative; left: 40px;
    top: 3px;">
            <div class="com-input-icon">완료</div>
        </div>
        <div class="header-sub-text">
        <div class="form-sub" style="width:1280px;">
              <h2 style="color:#00256C; font-size:20px; text-align:left; margin-left:60px;">회원정보 입력</h2>
        </div>
  

        </div>
        <!-- 폼 본문 -->
        <form class="form-container" action="joinPro" method="POST">
            <div class="input-row">
            	
                <div class="input-group">
                	
                    <label class="input-label">아이디</label>
                    <input type="text" class="id" name="userId" placeholder="아이디 *">
                </div>
               
                <div class="input-group">
                	
                    <label class="input-label">이름</label>
                    <input type="text" class="name" name="userName" placeholder="이름 *">
                </div>
            </div>
            <div class="input-row">
                <div class="input-group">
                    <label class="input-label">비밀번호</label>
                    <input type="password" class="pw" name="userPass" placeholder="비밀번호 *">
                   
                </div>
                <div class="input-group">
                    <label class="input-label">비밀번호 확인</label>
                    <input type="password" class="pw" name="userPassConfirm" placeholder="비밀번호 확인 *">
                </div>
            </div>
            <div class="input-row">
                <div class="input-group">
                    <label class="input-label">전화번호</label>
                    <input type="text" class="cellphoneNo" name="userTel" placeholder="전화번호">
                </div>
                <div class="input-group">
                    <label class="input-label">나이</label>
                    <input type="number" class="birthdate" name="userAge" placeholder="나이">
                </div>
            </div>
            <div class="input-group">
                <label class="input-label">성별</label>
                <select class="gender" name="userGen">
                    <option value="" disabled selected>성별</option>
                    <option value="1">남</option>
                    <option value="0">여</option>
                </select>
            </div>
            <!-- 버튼 그룹 -->
            <div class="buttons">
                <button type="button" class="button secondary">이전</button>
                <button type="submit" class="button primary">확인</button>
            </div>
        </form>
    </div>
</body>
</html>
