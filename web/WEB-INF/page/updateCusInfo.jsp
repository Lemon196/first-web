<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
   <form action="/customer/updateCus" method="post">
       <%--<input type="hidden" name="Customer" value="${Customer}"/>--%>
       <label>编号</label>
       <input type="text" name="cusId" readonly value="${Customer.id}"/><br>
        <label>姓名</label>
       <input type="text" name="customerName"  value="${Customer.cusName}"/><br>
        <label>昵称</label>
       <input type="text" name="cusLoginName" value="${Customer.cusLoginName}"/><br>
        <label>密码</label>
       <input type="password" name="cusPassword" value="${Customer.cusPassword}"/><br>
       <input type="submit" readonly value="修改"/><br>
   </form>
</body>
</html>
