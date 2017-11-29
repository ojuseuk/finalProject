<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<jsp:include page="../../../top.jsp"/>
	<div class="w3-container">
		<form action="${root}/tchrBs/qzInsert">
			<table class="w3-table w3-bordered">
				<tr>
					<td>과목명</td>
					<td><input type="text" value="${requestScope.ttlqzDto.sbjtNm}"
						name="sbjtNm"></td>
				</tr>
				<tr>
					<td>강사 번호</td>
					<td><input type="text" value="${requestScope.ttlqzDto.tchrNo}"
						name="tchrNo"></td>
				</tr>
				<tr>
					<td>토픽명</td>
					<td><input type="text" value="${requestScope.ttlqzDto.tpcNm}"
						name="tpcNm"></td>
				</tr>
				<tr>
					<td>문제 제목</td>
					<td><textarea rows="3" cols="50" name="title">${requestScope.ttlqzDto.title}</textarea></td>
				</tr>
				<tr>
					<td>문제 내용</td>
					<td><textarea rows="10" cols="50" name="content">${requestScope.ttlqzDto.content}</textarea></td>
				</tr>
				<tr>
					<td>문제 답(골라야 함)</td>
					<td><textarea rows="10" cols="50" name="solution">${requestScope.ttlqzDto.solution}</textarea></td>
				</tr>
				<tr>
					<td>문제 난이도</td>
					<td><select name="degree">
							<option value="상">상</option>
							<option value="중">중</option>
							<option value="하">하</option>
					</select></td>
				</tr>
				<tr>
					<td>문제 정답</td>
					<td><input type="text" name="answer"
						value="${requestScope.ttlqzDto.answer}"></td>
				</tr>
				<tr>
					<td>첨부 파일</td>
					<td><input type="file" value="파일 첨부" name="imgFile"></td>
				</tr>
			</table>
			<input class="w3-button w3-border" style="background-color: #90909096" type="submit" value="문제 생성">
		</form>
	</div>
</body>
</html>