<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	boolean flag = (Boolean)request.getAttribute("flag");

%>
<script language="javascript">
	if(<%=flag%>){
		alert("삭제 완료!");
	}else {
		alert("삭제 실패!");
	}
	
	location.href="board.do";
</script>