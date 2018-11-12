
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>


<script>
    $(function(){
        $("#courseDg").datagrid({
            url:'${pageContext.request.contextPath}/course/showAllCourse',
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
            toolbar:'#courseTb',
            columns:[[
                {title:'cks',field:'cks',checkbox:true},
                {title:'id',field:'id',width:120,align:'center'},
                {title:'课程名',field:'title',width:120,align:'center'},
                {title:'状态',field:'marking',width:120,align:'center'},
                {title:'创建时间',field:'recordDate',width:120,align:'center'},
                {title:'操作',field:'options',width:200,
                    formatter:function(value,row,index){
                        return  "<a href='#'  class='options' onclick=\"delCourse('"+row.id+"')\" data-options=\"iconCls:'icon-remove',plain:true\">删除</a>&nbsp;&nbsp;<a href='#' class='options' onclick=\"editCourse('"+row.id+"')\" class='options' data-options=\"iconCls:'icon-edit',plain:true\">修改</a>";
                    }
                },
            ]],
            onLoadSuccess:function(){
                $(".options").linkbutton();
            },

        });
    })

    function  addCourse() {
        $("#addCourseDg").dialog({
            href:'${pageContext.request.contextPath}/back/course/saveCourse.jsp',
            buttons:[{
                text:'添加',
                iconCls:'icon-add',
                handler:function(){
                    $("#saveCourseInputForm").form('submit',{
                        url:'${pageContext.request.contextPath}/course/addCourse',
                        success:function (result) {
                            var resultObj = $.parseJSON(result);
                            if(resultObj.success){
                                $.messager.show({title:'提示',msg:'课程添加成功'});
                            }else{
                                $.messager.show({title:'提示',msg:'课程添加失败'});
                            }
                            $("#addCourseDg").dialog('close');
                            $("#courseDg").datagrid('reload');
                        }
                    });
                }
            },{
                text:'取消',
                iconCls:'icon-cancel',
                handler:function(){
                    $("#addCourseDg").dialog('close');
                }
            }]

        });
    }

    function editCourse(id){
        $("#editCourseDialog").dialog({
            href:'${pageContext.request.contextPath}/back/course/editCourse.jsp?id='+id,
            buttons:[{
                text:'修改',
                iconCls:'icon-edit',
                handler:function(){
                    $("#editCourseInputForm").form('submit',{
                        url:'${pageContext.request.contextPath}/course/editCourse',
                        success:function (result) {
                            var resultObj = $.parseJSON(result);
                            if(resultObj.success){
                                $.messager.show({title:'提示',msg:'轮播图修改成功'});
                            }else{
                                $.messager.show({title:'提示',msg:'轮播图修改失败'});
                            }

                            $("#editCourseDialog").dialog('close');
                            $("#courseDg").datagrid('reload');
                        }
                    });
                }
            },{
                text:'取消',
                iconCls:'icon-cancel',
                handler:function(){
                    $("#editCourseDialog").dialog('close');
                }
            }]
        })
    }


    function delCourse(id){
        $.post("${pageContext.request.contextPath}/course/delOne",{"id":id},function (result) {
            $("#courseDg").datagrid('reload');
        });
    }


    function delMoreCourse(){
        var rows = $("#courseDg").datagrid('getSelections');
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
                url:"${pageContext.request.contextPath}/course/delMore",
                type:"POST",
                traditional:true,
                data:{ids:ids},
                success:function(){
                    $.messager.show({title:'提示',msg:'删除成功'});
                    $("#courseDg").datagrid('reload');
                },
                error:function(){
                    $.messager.show({title:'提示',msg:'删除失败'});
                    $("#courseDg").datagrid('reload');
                }
            });
        }

    }






</script>

<table id="courseDg" title="课程信息展示页面"></table>
<div id="courseTb">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="addCourse();" data-options="iconCls:'icon-add',plain:true">添加</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="delMoreCourse();" data-options="iconCls:'icon-cancel',plain:true">批量删除</a>
</div>

<div id="addCourseDg" data-options="width:600,height:350,title:'添加课程'"></div>
<div id="editCourseDialog" data-options="draggable:false,width:600,height:350,title:'修改课程'"></div>
