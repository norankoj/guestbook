<%@page import="java.util.ArrayList"%>
<%@page import="com.javaex.vo.GuestbookVO"%>
<%

ArrayList<GuestbookVO> list = (ArrayList<GuestbookVO>)request.getAttribute("list");

 list = list==null? null:list;

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>
	<form action="/guestbook/controller" method="get">
	<input type="hidden" name="a" value="insert"><br>
	<table border=1 width=500>
		<tr>
			<td>이름</td><td><input type="text" name="name"></td>
			<td>비밀번호</td><td><input type="password" name="pass"></td>
		</tr>
		<tr>
			<td colspan=4><textarea name="content" cols=60 rows=5></textarea></td>
		</tr>
		<tr>
			<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
		</tr>
	</table>
	</form>
	<br/>

    <%
    if(list==null){
    	list=null;
    }else{
	for(GuestbookVO vo:list){
	%>
	<table width=510 border=1>
		<tr>
			<td><%=vo.getNo() %></td>
			<td><%=vo.getName() %></td>
			<td><%=vo.getPw() %></td>
			<td><%=vo.getReg_date() %></td>
			<td><a href="/guestbook/controller?a=deleteform&no=<%=vo.getNo()%>">삭제</a></td>
		</tr>
		<tr>
			<td colspan=4><%=vo.getContent() %></td>
		</tr>
	</table>
        <br/>
        
        <%
	}
    }
        %>
	
</body>
</html>