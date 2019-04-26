<%--
  Created by IntelliJ IDEA.
  User: 黄圣博
  Date: 2019/4/8
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="layui-v2.4.5/layui/css/layui.css"  media="all">
    <script src="layui-v2.4.5/layui/layui.js"></script>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>动态操作Tab</legend>
</fieldset>

<div class="layui-tab" lay-filter="demo" lay-allowclose="true">
    <ul class="layui-tab-title">
        <li class="layui-this" lay-id="11">网站设置</li>
        <li lay-id="22">用户管理</li>
        <li lay-id="33">权限分配</li>
        <li lay-id="44">商品管理</li>
        <li lay-id="55">订单管理</li>
    </ul>

</div>
<div class="site-demo-button" style="margin-bottom: 0;">
    <button class="layui-btn site-demo-active" data-type="tabAdd">新增Tab项</button>
    <button class="layui-btn site-demo-active" data-type="tabDelete">删除：商品管理</button>
    <button class="layui-btn site-demo-active" data-type="tabChange">切换到：用户管理</button>
</div>
<script>
    layui.use('element', function(){
        var $ = layui.jquery
            ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

        //触发事件
        var active = {
            tabAdd: function(){
                //新增一个Tab项
                element.tabAdd('demo', {
                    title: '新选项'+ (Math.random()*1000|0) //用于演示
                    ,content: '内容'+ (Math.random()*1000|0)
                    ,id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
                })
            }
            ,tabDelete: function(othis){
                //删除指定Tab项
                element.tabDelete('demo', '44'); //删除：“商品管理”


                othis.addClass('layui-btn-disabled');
            }
            ,tabChange: function(){
                //切换到指定Tab项
                element.tabChange('demo', '22'); //切换到：用户管理
            }
        };

        $('.site-demo-active').on('click', function(){
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });

        //Hash地址的定位
        var layid = location.hash.replace(/^#test=/, '');
        element.tabChange('test', layid);

        element.on('tab(test)', function(elem){
            location.hash = 'test='+ $(this).attr('lay-id');
        });

    });
</script>
</body>
</html>
