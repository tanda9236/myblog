<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tanda.myblog.model.User"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
section {
  width: 300px;
  padding: 1.5rem 1.6rem;
  box-shadow: 0 0 1rem rgba(0, 0, 0, .05);  
  border-radius: 5px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  background: #fff;
  margin-top: 2rem;
}
.autocomplete > div {
  background: #f1f3f499;
  padding: .2rem .6rem;
}
.autocomplete > div.active {
  background: #e0e5f6;
  color: #000;
}
</style>
</head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<body>
	<section>
		<input type="text" id="search" placeholder="검색어를 입력해주세요." autocomplete="off" />
		<div class="autocomplete"></div>
	</section>
<%
List<User> userListAll = (List<User>) request.getAttribute("users");
List<String> userListNickname = new ArrayList<>();
List<String> userListId = new ArrayList<>();
for (User user : userListAll) {
	String nickname = user.getNickname();
	userListNickname.add(nickname);
}
for (User user : userListAll) {
	Integer id = user.getId();
	userListId.add(String.valueOf(id));
}
out.println(userListNickname);
out.println(userListId);
%>
<script type="text/javascript">
 const userListNickname = <%= new Gson().toJson(userListNickname) %>;
 const userListId = <%= new Gson().toJson(userListId) %>;
</script>
<script src="/js/search.js"></script>
</body>
</html>