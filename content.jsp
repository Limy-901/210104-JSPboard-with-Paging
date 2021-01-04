<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, mvc.domain.Board"%>


<meta charset='utf-8'>
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
<center>
<hr width='600' size='2' noshade>
<h2>Simple Board in Model 2 </h2>
&nbsp;&nbsp;&nbsp;
<a href='board.do?m=insert'>글쓰기</a>
<hr width='600' size='2' noshade>
<table border='1' width='600' align='center' cellpadding='3'>

<%	
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("content");
	for(Board dto : list){
%>
			<tr>
				<td width='100' align='center'>글번호</td>
				<td><%=dto.getSeq()%></td>
			</tr>
			<tr>
				<td align='center'>글쓴이</td>
				<td><%=dto.getWriter()%></td>
			</tr>
			<tr>
				<td align='center'>이메일</td>
				<td><%=dto.getEmail()%></td>
			</tr>
			<tr>
				<td align='center'>글제목</td>
				<td><%=dto.getSubject()%></td>
			</tr>
			<tr>
				<td align='center'>글내용</td>
				<td><%=dto.getContent()%></td>
			</tr>
		</table>
		<hr width='600' size='2' noshade>
		<b>
		<a href='board.do?m=update&seq=<%=dto.getSeq()%>'>수정</a>
		<a href='board.do?m=del&seq=<%=dto.getSeq()%>'>삭제</a>
		<a href='board.do'>목록</a>
		</b>
		<hr width='600' size='2' noshade>
		</center>
<%
	}
%>
