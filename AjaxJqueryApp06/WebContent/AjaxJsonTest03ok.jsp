<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// AjaxJsonTest03ok.jsp - lib
	
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	String result = "";
	
	//테스트
	//System.out.println(name + " / " + content);
	
	// ※ JSON 데이터 구성
	//    {"키1" : "값1", "키2" : "값2", ... }
	/*
	StringBuffer sb = new StringBuffer();
	
	// 따옴표 구성에 유의할 것~!!!
	// 		먼저 문자열 구성해놓고 → "" 큰 따옴표로 감싼다.
	// 		그리고 그 안에있는 따옴표들 앞에 \ escape 문자 붙이고,
	// 		사이에 변수 있으면 + +로 연결 후, 또 " 붙여준다.
	// +) " 입력할 때, 2개 입력되면 ctrl+z 누르면 하나만 삭제됨
	sb.append("{\"num\":\"" + 1 + "\"");
	sb.append(",\"name\":\"" + name + "\"");
	sb.append(",\"content\":\"" + content + "\"}");
	
	// {"num":"1", "name":"민찬우","content":"내용"} //
	
	// ↓ //
	
	// "{\"num\":\"1\", "name":"민찬우","content":"내용"} //
	
	result = sb.toString();
	
	out.println(result);
	*/
	
	JSONObject jobj = new JSONObject();
	jobj.put("num", 100);
	jobj.put("name", name);
	jobj.put("content", content);
	
	out.println(jobj.toString());
	
	
	
	
	
	/*
	■■■ JSON 라이브러리 ■■■
	
	① 핵심 기본 라이브러리
	1. http://www.json.org/json-ko.html
	2. 페이지 하단 java카테고리의 Json-lib
	3. 페이지 왼쪽 Download
	4. json-lib-2.4-jdk15.jar 파일 다운로드
	   - https://sourceforge.net/projects/json-lib/files/

	
	② 의존관계 필수 라이브러리
	1. http://www.json.org/json-ko.html
	2. 페이지 하단 java카테고리의 Json-lib
	3. 페이지 중간 Dependencies report 클릭
	4. 페이지 중간 Dependency Tree 항목에서
	   commons-beanutils:commons-beanutils:jar 클릭
	5. http://commons.apache.org/beanutils/
	6. 페이지 왼쪽 Download
	7. commons-beanutils-1.9.4-bin.zip 파일 다운로드
	   - https://commons.apache.org/proper/commons-beanutils/download_beanutils.cgi

	   
	③ 의존관계 필수 라이브러리
	1. http://www.json.org/json-ko.html
	2. 페이지 하단 java카테고리의 Json-lib
	3. 페이지 중간 Dependencies report 클릭
	4. 페이지 중간 Dependency Tree 항목에서
	   commons-logging:commons-logging:jar 클릭
	   Commons Logging의 http://commons.apache.org/logging 클릭
	5. 페이지 왼쪽 Download
	6. commons-logging-1.2-bin.zip 파일 다운로드
	
	
	④ 의존관계 필수 라이브러리
	1. http://www.json.org/json-ko.html
	2. 페이지 하단 java카테고리의 Json-lib
	3. 페이지 중간 Dependencies report 클릭
	4. 페이지 중간 Dependency Tree 항목에서
	   commons-collections:commons-collections:jar 클릭
	   Commons Collections의 http://commons.apache.org/collections/ 클릭
	5. 페이지 왼쪽 Download
	6. commons-collections-3.2.2-bin.zip 파일 다운로드
	
	
	⑤ 의존관계 필수 라이브러리
	1. http://www.json.org/json-ko.html
	2. 페이지 하단 java카테고리의 Json-lib
	3. 페이지 중간 Dependencies report 클릭
	4. 페이지 중간 Dependency Tree 항목에서
	   commons-lang:commons-lang:jar 클릭
	   Commons Lang의 http://commons.apache.org/lang/ 클릭
	5. 페이지 왼쪽 Download
	6. commons-lang-2.6-bin.zip 파일 다운로드
	
	
	⑥ 의존관계 필수 라이브러리
	1. http://www.json.org/json-ko.html
	2. 페이지 하단 java카테고리의 Json-lib
	3. 페이지 중간 Dependencies report 클릭
	4. 페이지 중간 Dependency Tree 항목에서
	   net.sf.ezmorph:ezmorph:jar 클릭
	   ezmorph의 http://ezmorph.sourceforge.net 클릭
	5. 페이지 왼쪽 Download
	6. ezmorph-1.0.6.jar 파일 다운로드
	
	*/

%>