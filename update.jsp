<%@page contentType="text/html; charset=utf-8"
 import="java.util.*,mvc.domain.Board" %>

<%
		ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("update");
		for(Board dtos : list){
%>
<style>
table, th, td {
border: 1px solid black;
border-collapse: collapse;
}
th, td {
padding: 5px;
}
a { text-decoration:none }
</style>
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
	<script>
	function f(){
	input.email.value = '';
	input.subject.value = '';
	$('#ta').text('');
	input.email.focus();
	}
	</script>
</head>
<body>
<center>
	<font color='gray' size='4' face='휴먼편지체'>
	<hr width='600' size='2' noshade>
	<h2>Simple Board in Model 1</h2>
	&nbsp;&nbsp;&nbsp;
	<a href='list.jsp'>글목록</a>
	<hr width='600' size='2' noshade>
	<form name='f' method='post' action='board.do?m=DBupdate&seq=<%=dtos.getSeq()%>'>
	<input type='hidden' name='seq' value='<%=dtos.getSeq()%>'>
	<input type='hidden' name='writer' value='<%=dtos.getWriter()%>'>
	<table border='1' width='600' align='center' cellpadding='3' cellspacing='1'>
	<tr>
	<td width='30%' align='center'>글쓴이</td>
	<td align='center'><input type='text' name='aa' size='60' value='<%=dtos.getWriter()%>' disabled></td>
	</tr>
	<tr>
	<td width='30%' align='center'>이메일</td>
	<td align='center'><input type='text' name='email' size='60' value='<%=dtos.getEmail()%>'></td>
	</tr>
	<tr>
	<td width='30%' align='center'>글제목</td>
	<td align='center'><input type='text' name='subject' size='60' value='<%=dtos.getSubject()%>'></td>
	</tr>
	<tr>
	<td width='30%' align='center'>글내용</td>
	<td align='center'><textarea name='content' rows='5' cols='53'><%=dtos.getContent()%></textarea></td>
	</tr>
	<tr>
	<td colspan='2' align='center'>
	<input type='submit' value='수정'>
	</td>
	</tr>
	</table>
	</form>
	<hr width='600' size='2' noshade>
	<b>
	<a href='board.do?m=DBupdate&seq=<%=dtos.getSeq()%>'>수정</a>
	<a href='board.do?m=del&seq=<%=dtos.getSeq()%>'>삭제</a>
	<a href='board.do'>목록</a>
	</b>
	<hr width='600' size='2' noshade>
	</center>
	<%
	}
	%>