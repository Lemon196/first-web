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
    function del(id) {
        var delStatus=window.confirm("是否删除？")
        if (delStatus){
            open("/goods/deleteGoods?GId="+id,"iframe_context");
        }
    }
</script>
<body>
    <c:choose>
        <c:when test="${not empty Map.pageData}">
            <div>
                <h1 style="color: red">${error}</h1>
                <h1 style="color: green">${result}</h1>
            </div>
            <form action="/goods/unionListGoods" method="post">
                <label>商品编号:</label>
                <input type="text" name="id" placeholder="请输入商品编号："/>
                <label>商品名称:</label>
                <input type="text" name="goodsName" placeholder="请输入商品名称："/>
                <label>商品小分类:</label>
                <select name="goodsSmalId">
                    <option value="0">请选择</option>
                        <%--<option value="1">液晶电视</option>
                        <option value="3">冰箱</option>--%>
                </select>
                <label>商品所属卖家:</label>
                <select name="goodsSellerId">
                    <option value="0">请选择</option>
                        <%--<option value="1">液晶电视</option>
                        <option value="3">冰箱</option>--%>
                </select>
                <input class="layui-btn " type="submit"  value="查询"/>
            </form>
            <table id="stu" width="90%" class="layui-table" lay-size="sm">
                <tr>
                    <th>商品编号</th>
                    <th>商品名称</th>
                    <th>商品对应的小分类</th>
                    <th>商品的价格</th>
                    <th>商品的数量</th>
                    <th>商品的图像</th>
                    <th>商品的运费</th>
                    <th>商品的类型</th>
                    <th>商品的折扣</th>
                    <th>商品所属卖家</th>
                    <th colspan="2">操作</th>
                </tr>
                <c:forEach items="${Map.pageData}" var="gs">
                    <tr>
                        <td>${gs.id}</td>
                        <td>${gs.goodsName}</td>
                        <td>${gs.smallClass.smallName}</td>
                        <td>${gs.goodsMoney}</td>
                        <td>${gs.goodsNumber}</td>
                        <td><img class="layui-nav-img" width="36px" src="static/back/Image/${gs.goodsImage}"></td>
                        <td>${gs.goodsCarriage}</td>
                        <td>${gs.goodsType}</td>
                        <td>${gs.discount.discRate}</td>
                        <td>${gs.seller.sellerName}</td>
                        <td><a class="layui-btn layui-btn-sm" onclick="del(${gs.id})">删除</a></td>
                        <td><a class="layui-btn layui-btn-sm" href="/goods/queryGoodsById?GId=${gs.id}">修改</a></td>
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
            <h3>暂无商品信息</h3>
        </c:otherwise>
    </c:choose>
</body>
<script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
<script>
    $(function () {
        var url="/goods/showSmallClass";
        $.getJSON(url,function (data) {
            $.each(data,function (ibdex,smallClass) {
                $("select[name='goodsSmalId']").append("<option value='"+smallClass.id+"'>"+smallClass.smallName+"</option>")
            })
        })
    })
    $(function () {
        var url="/goods/showSeller";
        $.getJSON(url,function (data) {
            $.each(data,function (ibdex,seller) {
                $("select[name='goodsSellerId']").append("<option value='"+seller.id+"'>"+seller.sellerName+"</option>")
            })
        })
    })
</script>
</html>
