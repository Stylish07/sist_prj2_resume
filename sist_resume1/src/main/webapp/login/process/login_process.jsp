<%@page import="valueObject.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="로그인 처리"
%>
<%@ include file="/common/jsp/common_code.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%= title %></title>
<link rel="stylesheet" type="text/css" href="http://localhost/jsp_prj/common/css/main_v20211012.css"/>

<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="lVO" class="valueObject.LoginVO" scope="page"/>
<jsp:setProperty property="*" name="lVO"/>

<c:catch var="e">
<%
String password=DataEncrypt.messageDigest( "SHA-1", request.getParameter("password"));

MemberDAO mDAO=new MemberDAO();
session.setAttribute("member", mDAO.selectAll(lVO.getId(), password));

/* List<String> listSub=mDAO.selectSub( mVO.getId() );
List<String> listUrl=mDAO.selectUrl( mVO.getId() );
session.setAttribute("listSub", listSub);
session.setAttribute("listUrl", listUrl); */
%>
<script type="text/javascript">
location.href="<%=protocol%><%=domain%><%=contextRoot%>/index.jsp";
</script>
</c:catch>

<c:if test="${ not empty e }">
<%-- ${ e } --%>
<script type="text/javascript">
alert("존재하지 않는 아이디, 비밀번호입니다.");
location.href="javascript:history.back()";
</script>
</c:if>

</body>
</html>