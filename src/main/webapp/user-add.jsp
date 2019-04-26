<%--
  Created by IntelliJ IDEA.
  User: 黄圣博
  Date: 2019/4/8
  Time: 14:51
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
<body>
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">id</label>
            <div class="layui-input-block">
                <input type="text" name="id" lay-verify="title" autocomplete="off" placeholder="请输入id" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">username</label>
            <div class="layui-input-block">
                <input type="text" name="username" lay-verify="required" placeholder="请输入username" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">单选框</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="男" title="男" checked="">
                <input type="radio" name="sex" value="女" title="女">
            </div>
        </div>
        <div>
            city
            <select name="city" lay-verify="">
                <option value="">请选择一个城市</option>
                <option value="010">北京</option>
                <option value="020">上海</option>
                <option value="030">杭州</option>
            </select>
        </div>
        <div>
            sign<textarea name="sign" required lay-verify="required" placeholder="请输入sign" class="layui-textarea"></textarea>
        </div>
        <div>
            职业 <select name="classify" lay-verify="">
                <option value="">请选择职业</option>
                <option value="010">职业1</option>
                <option value="020">职业2</option>
                <option value="030">职业3</option>
            </select>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">experience</label>
            <div class="layui-input-block">
                <input type="text" name="experience" lay-verify="title" autocomplete="off" placeholder="请输入experience" class="layui-input">
            </div>
        </div>
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend>评分</legend>
        </fieldset>
        <div id="number" name = "score"></div>
        <div class="layui-form-item">
            <label class="layui-form-label">wealth</label>
            <div class="layui-input-block">
                <input type="text" name="wealth" lay-verify="title" autocomplete="off" placeholder="请输入wealth" class="layui-input">
            </div>
        </div>
        <button class="layui-btn layui-btn-normal " lay-submit lay-filter="mmm">提交</button>
    </form>

    <script>
    layui.use(['rate'], function(){
        var rate = layui.rate;
        //半星效果
        rate.render({
            elem: '#number'
            ,value: 0 //初始值
            ,half: true //开启半星
        })
    });
    layui.use('form', function(){
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        form.render();
        form.on('submit(mmm)', function(data){
            $.ajax({
                url:"/msg/add.do",
                type:'post',
                data:data.field,
                beforeSend:function () {
                    this.layerIndex = layer.load(0, { shade: [0.5, '#393D49'] });
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
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });
    });
</script>
</body>
</html>
