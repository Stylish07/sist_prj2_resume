<%@page import="org.springframework.dao.DataAccessException"%>
<%@page import="kr.co.sist.resume.ResumeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="eduVO" class="kr.co.sist.resume.EducationVO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="eduVO"/>
<script type="text/javascript">
<%
ResumeDAO rDAO = new ResumeDAO();

try {
	rDAO.updateEdu(eduVO);
%>
alert("저장되었습니다.");
<%
} catch(DataAccessException e) {
	System.out.println("데이터 액세스 익셉션 발생");
%>
alert("저장에 실패하였습니다.");
<%
}
%>
location.href = "http://localhost/temp1_proj/new_resume/new_resume.jsp";
</script>