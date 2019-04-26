<%--
  Created by IntelliJ IDEA.
  User: 黄圣博
  Date: 2019/4/8
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="layui-v2.4.5/layui/css/layui.css"  media="all">
    <script src="layui-v2.4.5/layui/layui.js"></script>
    <script src="layui-v2.4.5/jquery-1.11.3.js"></script>
</head>
<style>
   /*设置表格复选框位置剧中*/
    .layui-table-cell .layui-form-checkbox[lay-skin="primary"]{
        top: 50%;
        transform: translateY(-50%);
    }
</style>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>操作</legend>
</fieldset>
<div class="layui-form-item">
    <div class="layui-inline">
        <label class="layui-form-label">username：</label>
        <div class="layui-input-block">
            <input type="text" name="username" id = "id" placeholder="请输入username" autocomplete="off" class="layui-input">
            <button class="layui-btn layui-btn-normal" data-type="reload">检索用户名</button>
        </div>
    </div>
</div>
<div class="layui-tab" lay-filter="demo" >
    <%--选项卡--%>
    <ul class="layui-tab-title">
        <li class="layui-this" lay-id="11">查询</li>
    </ul>
        <%--内容f's'v'f--%>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <table class="layui-hide" id="test" lay-filter="test"></table>
        </div>
    </div>
</div>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>
    layui.use('table', function(){
        var table = layui.table;
        table.render({
            elem: '#test'
            ,url:'<%= request.getContextPath()%>/msg/selectAll.do'
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,page:true
            ,toolbar: 'default'
            ,limits:[5,10,20]
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'id', title: 'ID', sort: true}
                ,{field:'username', title: '用户名',edit:"text"} //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1 新增
                ,{field:'sex', title: '性别', sort: true,edit:"text"}
                ,{field:'city', title: '城市',edit:"text"}
                ,{field:'sign', title: '签名',edit:"text"}
                ,{field:'classify', title: '职业', align: 'center',edit:"text"} //单元格内容水平居中
                ,{field:'experience', title: '积分', sort: true, align: 'right',edit:"text"} //单元格内容水平居中
                ,{field:'score', title: '评分', sort: true, align: 'right',edit:"text"}
                ,{field:'wealth', title: '财富', sort: true, align: 'right',edit:"text"}
                ,{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}/*右侧操作栏*/
            ]]
        });

        <!--条件查询-->
        var $ = layui.$,active={
            reload:function(){
                var ed = $("#id").val();
                table.reload('test',{
                    where:{username:$("#id").val()}
                })
            }
        }
        $('.layui-form-item .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        /*工具栏操作*/
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id)
                ,data = checkStatus.data; //获取选中的数据
            console.info(data);
            switch(obj.event){
                case 'add':
                    var $ = layui.jquery
                        ,element = layui.element;
                    element.tabAdd('demo', {
                        title: '增加'
                        ,content:'<iframe src="user-add.jsp" scrolling="no" frameborder="no" width="100%" height="100%">'
                        ,id: "zen" //实际使用一般是规定好的id，这里以时间戳模拟下

                    })
                    element.tabChange('demo',"zen");//跳转选项卡
                    break;
                case 'update':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else if(data.length > 1){
                        layer.msg('只能同时编辑一个');
                    } else {
                        /*var table = layui.table;
                        //监听单元格编辑
                        table.on('edit(test3)', function(obj){
                            var value = obj.value //得到修改后的值
                                ,data = obj.data //得到所在行所有键值
                                ,field = obj.field; //得到字段
                            layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
                        });*/
                    }
                    break;
                case 'delete':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else {
                        jQuery.ajax({
                            url:"/msg/del.do",
                            type:'post',
                            data:{"id":checkStatus.data[0].id},
                            beforeSend:function () {
                                this.layerIndex = layer.load(0, { shade: [0.5, '#67231'] });
                            },
                            success:function (msg) {
                                layer.msg(msg.msg, {
                                    icon: 6,//成功的表情
                                    time: 3000 //1秒关闭（如果不配置，默认是3秒）
                                }, function(){
                                    location.reload();
                                });
                            },
                            error:function () {
                                layer.alert('ERROR', {
                                    title: '提示'
                                })
                            }
                        });
                    }
                    break;
            };
        });
    });

    layui.use('element', function(){
        $('.site-demo-active').on('click', function(){
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });
    });
    /*单元格编辑修改*/
    layui.use('table', function(){
        var table = layui.table;
        //监听单元格编辑
        table.on('edit(test)', function(obj){
            var value = obj.value //得到修改后的值
                ,data = obj.data //得到所在行所有键值
                ,field = obj.field; //得到字段
            jQuery.ajax({
                url:"/msg/update.do",
                type:'post',
                data:data,
                beforeSend:function () {
                    this.layerIndex = layer.load(0, { shade: [0.5, '#67231'] });
                },
                success:function (msg) {
                    layer.msg(msg.msg, {
                        icon: 6,//成功的表情
                        time: 3000 //1秒关闭（如果不配置，默认是3秒）
                    }, function(){
                        location.reload();
                    });
                },
                error:function () {
                    layer.alert('ERROR', {
                        title: '提示'
                    })
                }
            });
        });
        /*右侧操作*/
        table.on('tool(test)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                layer.msg('ID：'+ data.id + ' 的查看操作');
            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    alert("删除"+index);
                });
            } else if(obj.event === 'edit'){
                layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }
        });
    });
</script>
</body>
</html>
