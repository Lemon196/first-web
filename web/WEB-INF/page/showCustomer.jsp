<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <base href="<%=request.getContextPath() %>/" />
    <%@include file="layUI.jsp"%>
    <style>
        input{
            border-radius: 5px;
            height: 30px;
            font-size: 15px;
            padding-left: 5px;
        }
    </style>
</head>
<script>
    function check() {
        var reg=/^\d{0,}$/;
        var id=$("#customerId").val();
        if (reg.test(id)==false){
            $("#error").html("顾客号只能是数字！")
            alert("顾客号只能是数字！")
        }
    }
    function del(id) {
        var delStatus=window.confirm("是否删除此用户？")
        if(delStatus){
            open("/customer/deleteCus?CusId="+id,"iframe_context");
        }
    }
</script>
<body>
    <c:choose>
        <c:when test="${not empty Map.customerList}">
            <div>
                <h1 style="color: red"id="error">${error}</h1>
                <h1 style="color: green">${result}</h1>
            </div>
            <form action="/customer/customerWhereList" method="post">
                <label>顾客号:</label>
                <input type="text" name="id" id="customerId" placeholder="请输入顾客号"  onblur="check()"/>
                <label>顾客姓名:</label>
                <input type="text" name="cusName" placeholder="请输入顾客姓名"  />
                <label>顾客性别:</label>
                <select name="cusSex">
                    <option value="">请选择</option>
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
                <input class="layui-btn " type="submit"  value="查询"/>
            </form>
            <table id="stu" width="90%" class="layui-table" lay-size="sm">
                <tr>
                    <th>编号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>昵称</th>
                    <th>生日</th>
                    <th>爱好</th>
                    <th>邮箱</th>
                    <th>身份证</th>
                    <th>头像</th>
                    <th colspan="2">操作</th>
                </tr>
                <c:forEach items="${Map.customerList}" var="cus">
                    <tr>
                        <td>${cus.id}</td>
                        <td>${cus.cusName}</td>
                        <td>${cus.cusSex}</td>
                        <td>${cus.cusLoginName}</td>
                        <td>${cus.cusBirthday}</td>
                        <td>${cus.cusHobby}</td>
                        <td>${cus.cusEmail}</td>
                        <td>${cus.cusCode}</td>
                        <td><img class="layui-nav-img" width="36px" src="static/back/Image/${cus.cusPhoto}"></td>
                        <td><a class="layui-btn layui-btn-sm" onclick="del(${cus.id})" >删除</a></td>
                        <td><a class="layui-btn layui-btn-sm" href="/customer/queryCusById?id=${cus.id}">修改</a></td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="9">
                        <%@include file="PageUtil.jsp"%>
                    </td>
                </tr>
            </table>
        </c:when>
        <c:otherwise>
            <h3>暂无顾客信息</h3>
        </c:otherwise>
    </c:choose>
</body>
</html>
