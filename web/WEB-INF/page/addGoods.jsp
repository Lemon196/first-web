<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <base href="<%=request.getContextPath() %>/" />
    <%@include file="layUI.jsp"%>
</head>
<script>
    function check(goodsName) {
        var url="/goods/queryGoodsName?goodsName="+goodsName;
        var result="";
        $.getJSON(url,function (data) {
            if (!data){
                document.getElementById("sub").disabled=false;
                $("#error").html("")
            }else {
                document.getElementById("sub").disabled=true;
                $("#error").html("该商品已存在不能添加！").css("color","red")
            }
        })
    }
</script>
<body>
<h3 id="error">${error}</h3>
   <form action="/goods/addGoods" method="post" enctype="multipart/form-data">
       <%--<input type="hidden" name="Customer" value="${Customer}"/>--%>
        <label>商品名称:</label>
        <input type="text" name="goodsName1" onblur="check(this.value)" required value=""/><br>
       <label>商品小分类:</label>
       <select name="goodsSmalId1">

       </select><br/>
        <label>商品价格:</label>
       <input type="text" name="goodsMoney" required value=""/><br>
        <label>商品数量:</label>
       <input type="text" name="goodsNumber" required value=""/><br>
       <label>商品图片:</label>
       <input type="file" name="goodsImages" required value=""/><br>
       <label>商品运费:</label>
       <input type="text" name="goodsCarriage" required value=""/><br>
       <label>商品类型(新品或二手):</label>
       <select name="goodsType">
           <option value="0">新品</option>
           <option value="1">二手</option>
       </select><br/>
       <label>商品折扣:</label>
       <select name="goodsDiscId">
       </select><br/>
       <label>商品所属商家:</label>
       <select name="goodsSellerId">
       </select><br/>
       <input type="submit" id="sub" disabled value="提交"/><br>
   </form>
</body>
<script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
<script>
    $(function () {
        var url="/goods/showSmallClass";
        $.getJSON(url,function (data) {
            $.each(data,function (ibdex,smallClass) {
                $("select[name='goodsSmalId1']").append("<option value='"+smallClass.id+"'>"+smallClass.smallName+"</option>")
            })
        })
    })
    $(function () {
        var url="/goods/showDisCount";
        $.getJSON(url,function (data) {
            $.each(data,function (index,discount) {
                $("select[name=goodsDiscId]").append("<option value='"+discount.id+"'>"+discount.discRate+"</option>")
            })
        })
    })
    $(function () {
        var url="/goods/showSeller";
        $.getJSON(url,function (data) {
            $.each(data,function (index,seller) {
                $("select[name=goodsSellerId]").append("<option value='"+seller.id+"'>"+seller.sellerName+"</option>")
            })
        })
    })
</script>
</html>
