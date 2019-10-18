<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js
"></script>
<script type="text/javascript">
$(function(){

	$("#btnSearch").click(function(){
		$("#list").empty();
		var data = $("#searchForm").serialize();
		$.ajax({url:"listStudent",data:data,success:function(r){
			var arr = eval("("+r+")");
			$.each(arr, function(idx, item){
				var tr = $("<tr></tr>");
				var td1 = $("<td></td>").html(item.name);
				var td2 = $("<td></td>").html(item.kor);
				var td3 = $("<td></td>").html(item.eng);
				var td4 = $("<td></td>").html(item.math);

				$(tr).append(td1,td2,td3,td4);
				$("#list").append(tr);
			});
		}});
		
	});
	
	
	$("#btnList").click(function(){		
		$.ajax({url:"listStudent",success:function(r){
			var arr = eval("("+r+")");
			$.each(arr, function(idx, item){
				var tr = $("<tr></tr>");
				var td1 = $("<td></td>").html(item.name);
				var td2 = $("<td></td>").html(item.kor);
				var td3 = $("<td></td>").html(item.eng);
				var td4 = $("<td></td>").html(item.math);

				$(tr).append(td1,td2,td3,td4);
				$("#list").append(tr);
			});
		}});
	});

	
	$("#btnAdd").click(function(){

		var data = $("#f").serialize();
		
		$.ajax({url:"insertStudent",data:data,success:function(data){
			alert(data);
		}});
	});	
});
</script>
</head>
<body>
	<h2>비트캠프</h2>
	<form id="f" name="f">
		이름 : <input type="text" name="name"><br>
		국어 : <input type="number" name="kor"><br>
		영어 : <input type="number" name="eng"><br>
		수학 : <input type="number" name="math"><br>	
	</form>	
	<button id="btnAdd">새로운 학생 추가</button>
	<button id="btnList">학생목록</button><br>
	<form id="searchForm">
		이름 : <input type="text" name="name">
	</form>
	<button id="btnSearch">검색</button>
	
	
	<table border="1" width="80%">
		<thead>
			<tr>
				<td>이름</td>
				<td>국어</td>
				<td>영어</td>
				<td>수학</td>
			</tr>
		</thead>
		<tbody id="list"></tbody>
	</table>
</body>
</html>





