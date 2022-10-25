<%@page import="com.test.BoardDTO"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	// 이전 페이지(List.jsp)로부터 데이터 수신
	// 게시물번호, 페이지번호
	String pageNum = request.getParameter("pageNum");	// 페이지 번호
	
	String strNum = request.getParameter("num");		// 게시물 번호
	int num = Integer.parseInt(strNum);
	
	// 해당 게시물의 조회수 증가
	dao.updateHitCount(num);
	
	// 게시물 상세 내용 가져오기
	BoardDTO dto = dao.getReadData(num);
	
	// 이전, 다음 게시물 번호 확인
	int beforeNum = dao.getBeforeNum(num);
	int nextNum = dao.getNextNum(num);
	
	BoardDTO dtoBefore = null;
	BoardDTO dtoNext = null;
	
	if (beforeNum != -1)
		dtoBefore = dao.getReadData(beforeNum);
	if (nextNum != -1)
		dtoNext = dao.getReadData(nextNum);
	
	if (dto==null)
		response.sendRedirect("List.jsp");
	
	// 게시물 본문의 라인 수 확인
	int lineSu = dto.getContent().split("\n").length;
	//			 ----------------
	//			 String(문자열)
	//			 ----------------------------
	//			 			배  열
	
	// 게시물 내용 처리
	dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
	
	DBConn.close();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/article.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
</head>
<body>
	<div id="bbs">
		<div id="bbs_title">
			게 시 판 (JDBC 연동 버전)
		</div><!-- #bbs_title -->
		
		<div id="bbsArticle">
			<div id="bbsArticle_header">
				<%=dto.getSubject() %>
			</div><!-- #bbsArticle_header -->
			
			<div class="bbsArticle_bottomLine">
				<dl>
					<dt>작성자</dt>
					<!-- <dd>홍길동</dd> -->
					<dd><%=dto.getName() %></dd>
					<dt>라인수</dt>
					<!-- <dd>1</dd> -->
					<dd><%=lineSu %></dd>
				</dl>
			</div><!-- .bbsArticle_bottomLine -->
			
			<div class="bbsArticle_bottomLine">
				<dl>
					<dt>등록일</dt>
					<!-- <dd>2022-10-25</dd> -->
					<dd><%=dto.getCreated() %></dd>
					<dt>조회수</dt>
					<!-- <dd>234</dd> -->
					<dd><%=dto.getHitCount() %></dd>
				</dl>
			</div><!-- .bbsArticle_bottomLine -->
			
			<div id="bbsArticle_content">
				<table style="width: 600;">
					<tr>
						<td style="padding: 10px 40px 10px 10px; vertical-align: top; height: 150;">
							<!-- 어쩌구 저쩌구 게시물 내용입니다. -->
							<%=dto.getContent() %>
						</td>
					</tr>
				</table>
			</div><!-- #bbsArticle_content -->
			
			<div class="bbsArticle_bottomLine">
			<!-- 이전글 :  <a href="test.com">(771) 취미 분야 게시물</a> -->
			<%
			if (beforeNum != -1)
			{
			%>
				이전글 :
				<a href="<%=cp %>/Article.jsp?pageNum=<%=pageNum %>&num=<%=beforeNum %>">
					(<%=beforeNum %>) <%=dtoBefore.getSubject() %>
				</a>
			<%
			}
			else
			{
			%>
				이전글 : 없음
			<%
			}
			%>
			</div><!-- .bbsArticle_bottomLine -->
			
			<div class="bbsArticle_noLine">
			<!-- 다음글 :  <a href="test.com">(773) 여가 분야 게시물</a> -->
			<%
			if (nextNum != -1)
			{
			%>
			 	다음글 :
			 	<a href="<%=cp %>/Article.jsp?pageNum=<%=pageNum %>&num=<%=nextNum %>">
			 		(<%=nextNum %>) <%=dtoNext.getSubject() %>
			 	</a>
			<%
			}
			else
			{
			%>
				다음글 : 없음
			<%
			}
			%>
			</div><!-- .bbsArticle_noLine -->
			
		</div><!-- #bbsArticle -->
		
		<div class="bbsArticle_noLine" style="text-align: right;">
			<!-- From : 211.238.142.55 -->
			From : <%=dto.getIpAddr() %>
		</div><!-- .bbsArticle_noLine -->
		
		<div id="bbsArticle_footer">
			<div id="leftFooter">
				<input type="button" value="수정" class="btn2"
				onclick="javascript:location.href='<%=cp %>/Update.jsp?num=<%=dto.getNum() %>&pageNum=<%=pageNum %>'">
				<input type="button" value="삭제" class="btn2"
				onclick="javascript:location.href='<%=cp %>/Delete.jsp?num=<%=dto.getNum() %>&pageNum=<%=pageNum%>'">
			</div><!-- #leftFooter -->
			
			<div id="rightFooter">
				<input type="button" value="리스트" class="btn2"
				onclick="javascript:location.href='<%=cp %>/List.jsp?pageNum=<%=pageNum %>'">
			</div><!-- #rightFooter -->
		</div><!-- #bbsArticle_footer -->
		
	</div><!-- #bbs -->
</body>
</html>