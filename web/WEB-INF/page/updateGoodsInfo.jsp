<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
                $("#error").html("该商品已存在不能添加！").css("color","red")
                document.getElementById("sub").disabled=true;
            }
        })
    }
</script>
<body>
    <h3 id="error">${error}</h3>
   <form action="/goods/updateGoods" method="post" >
       <label>商品编号</label>
       <input type="text" name="GId" readonly value="${Goods.id}"/><br>
       <label>商品名称</label>
       <input type="text" name="GName" onblur="check(this.value)" value="${Goods.goodsName}"/><br>
       <label>商品小分类:</label>
       <select name="GSmallId">
           <%--${Goods.goodsSmalId}--%>
       </select><br/>
       <label>商品价格:</label>
       <input type="text" name="goodsMoney" required value="${Goods.goodsMoney}"/><br>
       <label>商品数量:</label>
       <input type="text" name="goodsNumber" required value="${Goods.goodsNumber}"/><br>
       <label>商品图片:</label>
       <input type="text" name="goodsImage" required value="${Goods.goodsImage}"/><br>
       <label>商品运费:</label>
       <input type="text" name="goodsCarriage" required value="${Goods.goodsCarriage}"/><br>
       <label>商品类型(新品或二手):</label>
       <select name="goodsType">
           <option value="0"<c:if test="${Goods.goodsType==0}">selected</c:if>>新品</option>
           <option value="1"<c:if test="${Goods.goodsType==1}">selected</c:if>>二手</option>
       </select><br/>
       <label>商品折扣:</label>
       <select name="goodsDiscId">
       </select><br/>
       <label>商品所属商家:</label>
       <select name="SeId">
           <option value="${Goods.goodsSellerId}" selected>${Goods.Seller.sellerName}</option>
       </select><br/>
       <input type="submit" id="sub" disabled value="修改"/><br>
   </form>
<script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
<script>
    $(function () {
        var url="/goods/showSmallClass";
        $.getJSON(url,function (data) {
            $.each(data,function (ibdex,smallClass) {
                $("select[name='GSmallId']").append("<option value='"+smallClass.id+"'>"+smallClass.smallName+"</option>")
            })
                $("option[value='${Goods.goodsSmalId}']").attr("selected",true);

        })
    })
    $(function () {
        var url="/goods/showDisCount";
        $.getJSON(url,function (data) {
            $.each(data,function (index,discount) {
                $("select[name='goodsDiscId']").append("<option value='"+discount.id+"'>"+discount.discRate+"</option>")
            })
            $("option[value='${Goods.goodsDiscId}']").attr("selected",true);
        })
    })
    $(function () {
        var url="/goods/showSeller";
        $.getJSON(url,function (data) {
            $.each(data,function (index,seller) {
                $("select[name='SeId']").append("<option value='"+seller.id+"'>"+seller.sellerName+"</option>")
            })
                <%--$("option[value='${Goods.goodsSellerId}']").attr("selected",true);--%>
        })
    })
</script>
</body>
</html>
