<%@page isELIgnored="false" pageEncoding="UTF-8" %>

<script>
    $(function(){
        $("#ArticleDg").datagrid({
            url:'${pageContext.request.contextPath}/article/showAllArticle',
            draggable:false,
            pagination:true,
            pageNumber:1,//当前页
            pageSize:3,//每页显示记录数
            pageList:[3,5,8,10,12],
            striped:true,
            fitColumns:true,
            fit:true,
            singleSelect:false,
            ctrlSelect:true,
            toolbar:'#articleTb',
            columns:[[
                {title:'cks',field:'cks',checkbox:true},
                {title:'id',field:'id',width:120,align:'center'},
                {title:'标题',field:'title',width:120,align:'center'},
                {title:'上师名称',field:'name',width:120,align:'center',
                    formatter:function (value,row,index) {
                        if(row.guru){
                            return row.guru.name;
                        }
                        else{
                            return value;
                        }
                    }
                },
                {title:'图片路径',field:'imgPath',width:120,align:'center'},
                {title:'发布日期',field:'publishDate',width:120,align:'center'},
                {title:'文章内容',field:'content',width:120,align:'center'},
                {title:'操作',field:'options',width:200,
                    formatter:function(value,row,index){
                        return  "<a href='#'  class='options' onclick=\"delArticle('"+row.id+"')\" data-options=\"iconCls:'icon-remove',plain:true\">删除</a>&nbsp;&nbsp;<a href='#' class='options' onclick=\"editArticle('"+row.id+"')\" class='options' data-options=\"iconCls:'icon-edit',plain:true\">修改</a>";
                    }
                },
            ]],
            onLoadSuccess:function(){
                $(".options").linkbutton();
            },
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}' + rowData.imgPath + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>标题: ' + rowData.title + '</p>' +
                    '<p>时间: ' + rowData.publishDate + '</p>' +
                    '</td>' +
                    '</tr></table>';
            }

        });
    });

    function addArticle() {
        $("#addArticleDg").dialog({
            href: '${pageContext.request.contextPath}/back/article/saveArticle.jsp',
            buttons: [
                {
                    text: '保存',
                    iconCls: "icon-save",
                    handler: function () {
                        //保存用户信息
                        $("#saveArticleInputForm").form('submit', {
                            url: '${pageContext.request.contextPath}/article/addArticle',
                            success: function (result) {//响应的一定是json格式字符串 使用应该先转为js对象
                                //提示信息
                                var resultObj = $.parseJSON(result);
                                if(resultObj.success){
                                    $.messager.show({title:'提示',msg:'添加成功'});
                                }else{
                                    $.messager.show({title:'提示',msg:'添加失败'});
                                }
                                //关闭对话框
                                $("#addArticleDg").dialog('close');
                                //刷新datagrid
                                $("#ArticleDg").datagrid('reload');
                            }
                        });
                    }
                },
                {
                    text: '关闭',
                    iconCls: "icon-cancel",
                    handler: function () {
                        $("#addArticleDg").dialog('close');
                    }
                },
            ]
        });
    }
    
    
    function editArticle(id) {
        $("#editArticlelog").dialog({
            href: '${pageContext.request.contextPath}/back/article/editArticle.jsp?id='+id,
            buttons: [
                {
                    text: '保存',
                    iconCls: "icon-save",
                    handler: function () {
                        //保存用户信息
                        $("#editArticleInputForm").form('submit', {
                            url: '${pageContext.request.contextPath}/article/editArticle',
                            success: function (result) {//响应的一定是json格式字符串 使用应该先转为js对象
                                //提示信息
                                var resultObj = $.parseJSON(result);
                                if(resultObj.success){
                                    $.messager.show({title:'提示',msg:'修改成功'});
                                }else{
                                    $.messager.show({title:'提示',msg:'修改失败'});
                                }
                                //关闭对话框
                                $("#editArticlelog").dialog('close');
                                //刷新datagrid
                                $("#ArticleDg").datagrid('reload');
                            }
                        });
                    }
                },
                {
                    text: '关闭',
                    iconCls: "icon-cancel",
                    handler: function () {
                        $("#editArticlelog").dialog('close');
                    }
                },
            ]
        });
    }

    function delArticle(id){
        $.post("${pageContext.request.contextPath}/article/delOne",{"id":id},function (result) {
            $("#ArticleDg").datagrid('reload');
        });
    }


    function delMoreArticle(){
        var rows = $("#ArticleDg").datagrid('getSelections');
        if(rows.length<=0){
            $.messager.show({title:'提示',msg:'至少选中一行'});
        }else{
            var ids = [];
            for (var i = 0; i < rows.length; i++) {
                console.log(rows[i]);
                ids.push(rows[i].id);
            }
            console.log(ids);
            $.ajax({
                url:"${pageContext.request.contextPath}/article/delMore",
                type:"POST",
                traditional:true,
                data:{ids:ids},
                success:function(){
                    $.messager.show({title:'提示',msg:'删除成功'});
                    $("#ArticleDg").datagrid('reload');
                },
                error:function(){
                    $.messager.show({title:'提示',msg:'删除失败'});
                    $("#ArticleDg").datagrid('reload');
                }
            });
        }

    }




</script>
<table id="ArticleDg" title="文章展示页面"></table>
<div id="articleTb">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="addArticle();" data-options="iconCls:'icon-add',plain:true">添加</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="delMoreArticle();" data-options="iconCls:'icon-cancel',plain:true">批量删除</a>
</div>

<div id="addArticleDg" data-options="width:600,height:400,title:'添加文章'"></div>
<div id="editArticlelog" data-options="draggable:false,width:600,height:420,title:'修改文章信息'"></div>
