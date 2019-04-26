<%--
  Created by IntelliJ IDEA.
  User: 黄圣博
  Date: 2019/4/2
  Time: 20:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="layui-v2.4.5/layui/css/layui.css">
    <script src="layui-v2.4.5/layui/layui.js"></script>
    <title>Title</title>
</head>
<body>
<form action="/redisController/addredis.do">
    编号<input type="text" name="sid"/>
    姓名<input type="test" name="sname"/>
    年龄<input type="test" name="sage"/>
    联系<input type="test" name="sphone"/>
    地址<input type="test" name="saddr"/>
<input type="submit" value="增加"/>
    <hr/>
</form>
<br/>
<form action="/redisController/del.do">
    <h4>删除</h4>
    key<input type="text" name="key"/>
    <input type="submit" value="删除"/>
</form>
<br/>
<form action="/redisController/select.do">
    <h4>查询</h4>
    key<input type="text" name="key"/>
    <input type="submit" value="查询"/>
</form>
<br/>
<form action="/redisController/selectAll.do">
    <input type="submit" value = "查询所有key">
</form>
</body>
</html>
