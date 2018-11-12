<%@page pageEncoding="UTF-8" isELIgnored="false" %>

<script>
    $(function(){
        $("#GuruDg").datagrid({
            url:'${pageContext.request.contextPath}/guru/showAllGuru',
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
            toolbar:'#guruTb',
            columns:[[
                {title:'cks',field:'cks',checkbox:true},
                {title:'id',field:'id',width:120,align:'center'},
                {title:'大师头像',field:'img',width:120,align:'center'},
                {title:'大师法名',field:'name',width:120,align:'center'},
                {title:'性别',field:'sex',width:120,align:'center'},
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
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}/' + rowData.img + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>Attribute: ' + rowData.name + '</p>' +
                    '<p>Status: ' + rowData.sex + '</p>' +
                    '</td>' +
                    '</tr></table>';
            }

        });
    });


    function  addGuru() {
        $("#addGuruDg").dialog({
            href:'${pageContext.request.contextPath}/back/guru/addGuru.jsp',
            buttons:[{
                text:'添加',
                iconCls:'icon-add',
                handler:function(){
                    $("#addGuruInputForm").form('submit',{
                        url:'${pageContext.request.contextPath}/guru/addGuru',
                        success:function (result) {
                            var resultObj = $.parseJSON(result);
                            if(resultObj.success){
                                $.messager.show({title:'提示',msg:'添加成功'});
                            }else{
                                $.messager.show({title:'提示',msg:'添加失败'});
                            }
                            $("#addGuruDg").dialog('close');
                            $("#GuruDg").datagrid('reload');
                        }
                    });
                }
            },{
                text:'取消',
                iconCls:'icon-cancel',
                handler:function(){
                    $("#addGuruDg").dialog('close');
                }
            }]

        });
    }




    function edit(id){
        $("#editGuruDialog").dialog({
            href:'${pageContext.request.contextPath}/back/guru/editGuru.jsp?id='+id,
            buttons:[{
                text:'修改',
                iconCls:'icon-edit',
                handler:function(){
                    $("#editGuruInputForm").form('submit',{
                        url:'${pageContext.request.contextPath}/guru/editGuru',
                        success:function (result) {
                            var resultObj = $.parseJSON(result);
                            if(resultObj.success){
                                $.messager.show({title:'提示',msg:'修改成功'});
                            }else{
                                $.messager.show({title:'提示',msg:'修改失败'});
                            }

                            $("#editGuruDialog").dialog('close');
                            $("#GuruDg").datagrid('reload');
                        }
                    });
                }
            },{
                text:'取消',
                iconCls:'icon-cancel',
                handler:function(){
                    $("#editGuruDialog").dialog('close');
                }
            }]
        })
    }


    function del(id){
        $.post("${pageContext.request.contextPath}/guru/delOne",{"id":id},function (result) {
            $("#GuruDg").datagrid('reload');
        });
    }

    function delMoreGuru(){
        var rows = $("#GuruDg").datagrid('getSelections');
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
                url:"${pageContext.request.contextPath}/guru/delMore",
                type:"POST",
                traditional:true,
                data:{ids:ids},
                success:function(){
                    $.messager.show({title:'提示',msg:'删除成功'});
                    $("#GuruDg").datagrid('reload');
                },
                error:function(){
                    $.messager.show({title:'提示',msg:'删除失败'});
                    $("#GuruDg").datagrid('reload');
                }
            });
        }

    }






</script>




<table id="GuruDg" title="上师信息展示页面"></table>
<div id="guruTb">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="addGuru();" data-options="iconCls:'icon-add',plain:true">添加</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="delMoreGuru();" data-options="iconCls:'icon-cancel',plain:true">批量删除</a>
</div>

<div id="addGuruDg" data-options="width:600,height:400,title:'添加大师'"></div>
<div id="editGuruDialog" data-options="draggable:false,width:600,height:420,title:'修改大师信息'"></div>
