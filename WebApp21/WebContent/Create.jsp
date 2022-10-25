<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/created.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<script type="text/javascript" src="<%=cp %>/js/util.js"></script>
<script type="text/javascript">
	
	function sendIt()
	{
		//alert("함수호출확인");
		
		f = document.myForm;
	
		// 제목 입력 확인 --------------------------------------------
		str = f.subject.value;
		str = str.trim();
		
		// ※ javascript 에는 trim() 이 존재하지 않음.
		//    외부에서 참조한 util.js 에 만들어두었음.
		
		// 테스트
		//alert("|" + str + "|");
		
		if(!str)
		{
			alert("\n제목을 입력하세요~!!!");
			f.subject.focus();
			return;
		}	
		// -------------------------------------------- 제목 입력 확인 
		
		// 이름 입력 확인 --------------------------------------------
		str = f.name.value;
		str = str.trim();
		
		if(!str)
		{
			alert("\n작성자 이름을 입력하세요~!!");
			f.name.focus();
			return;
		}
		// -------------------------------------------- 이름 입력 확인 
		
		// 이메일 검사 -----------------------------------------------
		if (f.email.value)
		{
			if (!isValidEmail(f.email.value))
			{
				alert("\이메일 형식이 올바르지 않습니다~!!");
				f.email.focus();
				return;
			}			
		}
		// ----------------------------------------------- 이메일 검사
		
		// 패스워드 입력 확인 --------------------------------------------
		str = f.pwd.value;
		str = str.trim();
		
		if (!str)
		{
			alert("\n패스워드를 입력하세요~!!!");
			f.pwd.focus();
			return;
		}
		// -------------------------------------------- 패스워드 입력 확인
		
		
		f.action = "<%=cp%>/Create_ok.jsp";
		
		f.submit();
	}

</script>
</head>
<body>

<div id="bbs">
	<div id="bbs_title">
		게 시 판 (JDBC 연동 버전)
	</div><!-- #bbs_title -->
	
	<!-- action 태그 값은 javascript 영역에 작성했음 (Line 78) -->
	<form action ="" method="post" name="myForm">
		<div id="bbsCreated">
		
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
					<dd>
						<input type="text" name="subject" size="74" maxlength="100" class="boxTF">
					</dd>
				</dl>
			</div><!-- #bbsCreated_bottomLine -->
			
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>작 성 자</dt>
					<dd>
						<input type="text" name="name" size="35" maxlength="20" class="boxTF">
					</dd>
				</dl>
			</div><!-- #bbsCreated_bottomLine -->
			
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>이 메 일</dt>
					<dd>
						<input type="email" name="email" size="35" maxlength="50" class="boxTF">
					</dd>
				</dl>
			</div><!-- #bbsCreated_bottomLine -->
			
			<div id="bbsCreated_content">
				<dl>
					<dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
					<dd>
						<textarea rows="12" cols="63" name="content" class="boxTA"></textarea>
					</dd>
				</dl>
			</div><!-- #bbsCreated_content -->
			
			<div id="bbsCreated_noLine">
				<dl>
					<dt>패스워드</dt>
					<dd>
						<input type="password" name="pwd" size="35" maxlength="10" class="boxTF">
						&nbsp;<span style="font-size: 7pt">(게시물 수정 및 삭제 시 필요~!!!)</span>
					</dd>
				</dl>
			</div><!-- #bbsCreated_noLine -->
			
			<div id="bbsCreated_footer">
				<input type="button" value="등록하기" class="btn2" onclick="sendIt()">
				<input type="reset" value="다시입력" class="btn2" onclick="document.myForm.subject.focus();">
				<input type="button" value="작성취소" class="btn2" onclick="javascript:location.href='<%=cp %>/List.jsp'">
			</div><!-- #bbsCreated_footer -->
			
		</div><!-- #bbsCreated -->
	</form>
	
</div><!-- #bbs -->

</body>
</html>