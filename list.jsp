<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, mvc.domain.Board, board.mvc.vo.ListResult"%>


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
</head>
<body>
<CENTER>
		<font color='gray' size='4' face='휴먼편지체'/>
			<hr width='600' size='2' color='gray' noshade>
			<h3> BOARD in Model 2 </h3>
			<font color='gray' size='4' face='휴먼편지체'>
			<a href='../'>인덱스</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href='board.do?m=input'>글쓰기</a><br/>
		</font>
		<hr width='600' size='2' color='gray' noshade>
		<TABLE border='2' width='600' align='center' noshade>
		<TR size='2' align='center' noshade bgcolor='AliceBlue'>
			<th bgcolor='AliceBlue'>번호</th>
			<th align='center' width='10%'>작성자</th>
			<th align='center' width='30%'>이메일</th>
			<th align='center' width='30%'>글제목</th>
			<th align='center' width='15%'>작성일</th>
		</TR>
<%
	ListResult listResult = (ListResult)request.getAttribute("listResult");
	int cp = listResult.getCurrentPage();
	int ps = listResult.getPageSize();
	long tpc = listResult.getTotalPageCount();
	ArrayList<Board> list = (ArrayList)listResult.getList();
	
	if(list.size()!=0){
		for(Board dto : list){
%>
				<TR>
					<TD align='center'><%=dto.getSeq()%></TD>
					<TD align='center'><%=dto.getWriter()%></TD>
					<TD align='center'><%=dto.getEmail()%></TD>
					<TD align='center'><a href='board.do?m=content&seq=<%=dto.getSeq()%>'><%=dto.getSubject()%></a></TD>
					<TD align='center'><%=dto.getRdate()%></TD>
				</TR>
		<%
		}
	}else{
		%>
				<TR>
					<td align='center' colspan='5'>데이터가 없습니다.</td>
				</TR>
		<%
	}
		%>
		</TABLE>
		<hr width='600' size='2' color='gray' noshade>
		<font color='gray' size='3' face='휴먼편지체'>
	    (총페이지수 : <%=tpc%> )
	    &nbsp;&nbsp;&nbsp;    
<%

		for(int i=1; i<=tpc; i++){
%>
<a href="board.do?m=list&cp=<%=i%>&ps=<%=ps%>">
<%
			if(i==cp){
%>
<strong><%=i%></strong></a>&nbsp;
<%
			} else {
%>
<%=i%></a>&nbsp;
<%
			}
		}
%>
	                
	               
	    ( TOTAL : <%=listResult.getTotalCount()%> )
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	       페이지 싸이즈 : 
	    <select id="psId" name="ps" onchange="f(this)">
	    		   <option value="3" selected>3</option>
			       <option value="5">5</option>
			       <option value="10">10</option>    	
	    </select>
	    <script language="javascript">
	       function f(select){
	           var el = document.getElementById("psId");
	           var ps = select.value;
	           alert("ps : " + ps);
	           location.href="board.do?m=list&ps="+ps;
	       }
	    </script>
	</font>
	<hr width='600' size='2' color='gray' noshade>
	</center>
	</body>
</html>
