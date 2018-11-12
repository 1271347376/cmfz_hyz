<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>


    <script>
        $(function(){
            $("#bannerDg").datagrid({
                url:'${pageContext.request.contextPath}/banner/showBanner',
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
                toolbar:'#tb',
                columns:[[
                    {title:'cks',field:'cks',checkbox:true},
                    {title:'id',field:'id',width:120,align:'center'},
                    {title:'标题',field:'title',width:120,align:'center'},
                    {title:'图片路径',field:'imgPath',width:120,align:'center'},
                    {title:'图片描述',field:'description',width:120,align:'center'},
                    {title:'图片状态',field:'status',width:120,align:'center'},
                    {title:'添加时间',field:'createDate',width:200,align:'center'},
                    {title:'操作',field:'options',width:200,
                        formatter:function(value,row,index){
                            return  "<a href='#'  class='options' onclick=\"del('"+row.id+"')\" data-options=\"iconCls:'icon-remove',plain:true\">删除</a>&nbsp;&nbsp;<a href='#' class='options' onclick=\"edit('"+row.id+"')\" class='options' data-options=\"iconCls:'icon-edit',plain:true\">修改</a>";
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
                        '<p>标题: ' + rowData.description + '</p>' +
                        '<p>状态: ' + rowData.status + '</p>' +
                        '</td>' +
                        '</tr></table>';
                }

            });
        });

        function  add() {
            $("#addDg").dialog({
                href:'${pageContext.request.contextPath}/back/banner/add.jsp',
                buttons:[{
                    text:'添加',
                    iconCls:'icon-add',
                    handler:function(){
                        $("#addBannerInputForm").form('submit',{
                            url:'${pageContext.request.contextPath}/banner/addBanner',
                            success:function (result) {
                                var resultObj = $.parseJSON(result);
                                if(resultObj.success){
                                    $.messager.show({title:'提示',msg:'图片添加成功'});
                                }else{
                                    $.messager.show({title:'提示',msg:'图片添加失败'});
                                }
                                $("#addDg").dialog('close');
                                $("#bannerDg").datagrid('reload');
                            }
                        });
                    }
                },{
                    text:'取消',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $("#addDg").dialog('close');
                    }
                }]

            });
        }


        function edit(id){
            $("#editDialog").dialog({
                href:'${pageContext.request.contextPath}/back/banner/edit.jsp?id='+id,
                buttons:[{
                    text:'修改',
                    iconCls:'icon-edit',
                    handler:function(){
                        $("#editBannerInputForm").form('submit',{
                            url:'${pageContext.request.contextPath}/banner/editBanner',
                            success:function (result) {
                                var resultObj = $.parseJSON(result);
                                if(resultObj.success){
                                    $.messager.show({title:'提示',msg:'轮播图修改成功'});
                                }else{
                                    $.messager.show({title:'提示',msg:'轮播图修改失败'});
                                }

                                $("#editDialog").dialog('close');
                                $("#bannerDg").datagrid('reload');
                            }
                        });
                    }
                },{
                    text:'取消',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $("#editDialog").dialog('close');
                    }
                }]
            })
        }

        function del(id){
            $.post("${pageContext.request.contextPath}/banner/delOne",{"id":id},function (result) {
                $("#bannerDg").datagrid('reload');
            });
        }


        function delMore(){
            var rows = $("#bannerDg").datagrid('getSelections');
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
                    url:"${pageContext.request.contextPath}/banner/delMore",
                    type:"POST",
                    traditional:true,
                    data:{ids:ids},
                    success:function(){
                        $.messager.show({title:'提示',msg:'删除成功'});
                        $("#bannerDg").datagrid('reload');
                    },
                    error:function(){
                        $.messager.show({title:'提示',msg:'删除失败'});
                        $("#bannerDg").datagrid('reload');
                    }
                });
            }

        }






    </script>

    <table id="bannerDg" title="轮播图展示页面"></table>
    <div id="tb">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="add();" data-options="iconCls:'icon-add',plain:true">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="delMore();" data-options="iconCls:'icon-cancel',plain:true">批量删除</a>
    </div>

    <div id="addDg" data-options="width:600,height:400,title:'添加轮播图'"></div>
    <div id="editDialog" data-options="draggable:false,width:600,height:420,title:'修改轮播图'"></div>

