<%--
  Created by IntelliJ IDEA.
  User: 黄圣博
  Date: 2019/4/4
  Time: 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="layui-v2.4.5/layui/css/layui.css"  media="all">
    <script src="layui-v2.4.5/layui/layui.js"></script>
    <title>Title</title>
</head>
<body class="layui-layout-body">[
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">layui 后台布局</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="table.jsp">控制台</a></li>
            <li class="layui-nav-item"><a href="from.jsp">商品管理</a></li>
            <li class="layui-nav-item"><a href="index.jsp">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="png.jsp">邮件管理</a></dd>
                    <dd><a href="tab.jsp">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    贤心
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">所有商品</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">列表一</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="javascript:;">列表三</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">解决方案</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">列表一</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="">云市场</a></li>
                <li class="layui-nav-item"><a href="">发布商品</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="layui-inline">
            <label class="layui-form-label">中文版</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="test2" placeholder="yyyy-MM-dd">
            </div>
        </div>
        <button class="layui-btn layui-btn-primary layui-btn-radius">原始按钮</button>
        <button class="layui-btn layui-btn-radius">默认按钮</button>
        <button class="layui-btn layui-btn-normal layui-btn-radius">百搭按钮</button>
        <button class="layui-btn layui-btn-warm layui-btn-radius">暖色按钮</button>
        <button class="layui-btn layui-btn-danger layui-btn-radius">警告按钮</button>
        <button class="layui-btn layui-btn-disabled layui-btn-radius">禁用按钮</button>
        <legend>按钮组</legend>
        <div class="layui-btn-group">
            <button class="layui-btn">增加</button>
            <button class="layui-btn ">编辑</button>
            <button class="layui-btn">删除</button>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">日期时间范围</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="test111" placeholder=" - ">
            </div>
        </div>
        <pre class="layui-code">//在里面存放任意的代码
Lay.fn.event = function(modName, events, params){
  var that = this, result = null, filter = events.match(/\(.*\)$/)||[];
  var set = (events = modName + '.'+ events).replace(filter, '');
};
      </pre>
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                <legend>常规轮播</legend>
            </fieldset>

            <div class="layui-carousel" id="test1" lay-filter="test1">
                <div carousel-item="">
                    <div >
                        <img src="123.PNG"/>
                        <img src="123.PNG"/>
                        <img src="123.PNG"/>
                    </div>
                    <div>
                        <img src="234.PNG"/>
                        <img src="234.PNG"/>
                        <img src="234.PNG"/>
                    </div>
                    <div>
                        <img src="345.PNG"/>
                        <img src="345.PNG"/>
                        <img src="345.PNG"/>
                    </div>
                    <div class="layui-bg-blue">条目4</div>
                    <div class="layui-bg-red">条目5</div>
                </div>
            </div>
            <select name="quiz1">
                <option value="">请选择省</option>
                <option value="浙江" selected="">浙江省</option>
                <option value="你的工号">江西省</option>
                <option value="你最喜欢的老师">福建省</option>
            </select>
            <ul>
                <li><div id="test10"></div></li>
                <li><div id="test11"></div></li>
                <li><div id="test12"></div></li>
                <li><div id="test13"></div></li>
                <li><div id="test14"></div></li>
            </ul>
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                <legend>定义初始值</legend>
            </fieldset>
            <div id="slideTest2" class="demo-slider"></div>
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                <legend>开启输入框</legend>
            </fieldset>
            <div id="slideTest8" class="demo-slider"></div>
        </div>
        </div>
</div>
<script src="../src/layui.js"></script>
<script>
    layui.use('slider', function(){
        var $ = layui.$
            ,slider = layui.slider;
        //默认滑块
        slider.render({
            elem: '#slideTest1'
        });
        slider.render({
            elem: '#slideTest8'
            ,input: true //输入框
        });
        //定义初始值
        slider.render({
            elem: '#slideTest2'
            ,value: 0 //初始值
        });
    });
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
    layui.use(['carousel', 'form'], function(){
        var carousel = layui.carousel
            ,form = layui.form;

        //常规轮播
        carousel.render({
            elem: '#test1'
            ,arrow: 'always'
        });
    });
    layui.use(['rate'], function(){
        var rate = layui.rate;

        //主题色
        rate.render({
            elem: '#test10'
            ,value: 3
            ,theme: '#FF8000'
            ,half: true //开启半星//自定义主题色
        });
        rate.render({
            elem: '#test11'
            ,value: 3
            ,theme: '#009688'
            ,half: true
        });

        rate.render({
            elem: '#test12'
            ,value: 2.5
            ,half: true
            ,theme: '#1E9FFF'
        })
        rate.render({
            elem: '#test13'
            ,value: 2.5
            ,half: true
            ,theme: '#2F4056'
        });
        rate.render({
            elem: '#test14'
            ,value: 2.5
            ,half: true
            ,theme: '#FE0000'
        })
    });
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //常规用法
        laydate.render({
            elem: '#test2'
         });
        //日期时间范围
        laydate.render({
            elem: '#test111'
            ,type: 'datetime'
            ,range: true
        });
    });
</script>
</body>
</html>
