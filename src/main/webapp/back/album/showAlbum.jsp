<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

	<script type="text/javascript">
        $(function () {

            $('#albumTB').treegrid({
                url: '${pageContext.request.contextPath}/album/showAllAlbum',
                //fitColumns:true, <%-- 自适应行 --%>
                striped:true, <%-- 斑马线 --%>
                rownumbers: true,<%-- 如果为true，则显示一个行号列。 --%>
                idField: 'id',	<%--定义关键字段来标识树节点。（必须的）--%>
                treeField: 'title',<%-- 定义树节点字段。（必须的） --%>
                animate:true,  <%-- 定义在节点展开或折叠的时候是否显示动画效果。 --%>
                loadMsg:'正在加载中,请等待。。。', //远程加载时显示信息
                pagination:true, //显示分页工具栏
                onlyLeafCheck:true,//定义是否仅在叶子节点前显示复选框
                toggle:true,
				fit:true,
                fitColumns:true,
                columns: [[
                    {title: 'cks', field: 'cks', checkbox: true},
                    {field: 'id', title: 'id', width: 80,align:'center'},
                    {field: 'title', title: '标题', width: 160,align:'center'},
                    {field: 'duration', title: '章节时长', width: 80,align:'center'},
                    {field: 'fileSize', title: '章节大小', width: 80,align:'center'},
                    {field: 'uploadTime', title: '修改时间', width: 160,align:'center'},
                ]],
                toolbar: [
                    {
                        text: '添加专辑',
                        iconCls: 'icon-add',
                        handler: openAlbumDialog,
                    },
                    {
                        text: '添加章节',
                        iconCls: 'icon-remove',
                        handler: openChapterDialog,
                    },
                    {
                        text: '专辑详情',
                        iconCls: 'icon-tip',
                        handler: showAlbumDialog,
                    },
					{
                        text: "下载音频",
						iconCls: 'icon-undo',
						handler: function () {
                                var row = $("#albumTB").treegrid("getSelected");
                             	if(row==null){
                                    $.messager.show({title:'提示',msg:'至少选中一个音频'});
								}else{
                             	    if(row.downPath!=null){
                                        location.href = "${pageContext.request.contextPath}/chapter/download?fileName=" + row.downPath + "&openStyle=attachment";
                             	    }else{
                                        $.messager.show({title:'提示',msg:'请选择您要了解的音频'});
                                    }

								}

                            }
                        }
                ],
                onDblClickRow:function (row){
                    if (row == null) {
                        $.messager.show({title:'提示',msg:'请先选中行！！！'});
                    } else {
                        if (row.downPath != null) {
                            $("#album_paly").dialog("open");
                            $("#audio").prop("src", "${pageContext.request.contextPath}"+row.downPath)
                        } else {
                            $.messager.show({title:'提示',msg:'请选择音频！！！'});
                        }
                    }

                },
            });
        });

        //添加
        function openAlbumDialog() {
            $("#saveAlbumDialog").dialog({
                href: '${pageContext.request.contextPath}/back/album/saveAlbum.jsp',
                buttons: [
                    {
                        text: '保存',
                        iconCls: "icon-save",
                        handler: function () {
                            //保存用户信息
                            $("#saveAlbumInputForm").form('submit', {
                                url: '${pageContext.request.contextPath}/album/addAlbum',
                                success: function (result) {//响应的一定是json格式字符串 使用应该先转为js对象
                                    //提示信息
                                    var resultObj = $.parseJSON(result);
                                    if(resultObj.success){
                                        $.messager.show({title:'提示',msg:'添加成功'});
                                    }else{
                                        $.messager.show({title:'提示',msg:'添加失败'});
                                    }
                                    //关闭对话框
                                    $("#saveAlbumDialog").dialog('close');
                                    //刷新datagrid
                                    $("#albumTB").treegrid('reload');
                                }
                            });
                        }
                    },
                    {
                        text: '关闭',
                        iconCls: "icon-cancel",
                        handler: function () {
                            $("#saveAlbumDialog").dialog('close');
                        }
                    },
                ]
            });
        }
        
        function  openChapterDialog() {
            var row = $("#albumTB").treegrid("getSelected");
            if(row==null){
                $.messager.show({title:'提示',msg:'至少选中一个专辑'});
            }else {
                if(row.publishDate!=null){
                    $("#saveChapterDialog").dialog({
                        href: '${pageContext.request.contextPath}/back/album/saveChapter.jsp?id='+row.id,
                        buttons: [
                            {
                                text: '保存',
                                iconCls: "icon-save",
                                handler: function () {
                                    //保存用户信息
                                    $("#saveChapterInputForm").form('submit', {
                                        url: '${pageContext.request.contextPath}/chapter/addChapter',
                                        success: function (result) {//响应的一定是json格式字符串 使用应该先转为js对象
                                            //提示信息
                                            var resultObj = $.parseJSON(result);
                                            if(resultObj.success){
                                                $.messager.show({title:'提示',msg:'添加成功'});
                                            }else{
                                                $.messager.show({title:'提示',msg:'添加失败'});
                                            }
                                            //关闭对话框
                                            $("#saveChapterDialog").dialog('close');
                                            //刷新datagrid
                                            $("#albumTB").treegrid('reload');
                                        }
                                    });
                                }
                            },
                            {
                                text: '关闭',
                                iconCls: "icon-cancel",
                                handler: function () {
                                    $("#saveChapterDialog").dialog('close');
                                }
                            },
                        ]
                    });
				}else{
                    $.messager.show({title:'提示',msg:'请选择您要的专辑'});
				}
            }

        }
        
function showAlbumDialog() {
    var row = $("#albumTB").treegrid("getSelected");
    if(row==null){
        $.messager.show({title:'提示',msg:'至少选中一个专辑'});
    }else{
        if(row.count!=null){
            $("#showAlbumDialog").dialog({
                href:'${pageContext.request.contextPath}/back/album/showOneAlbum.jsp?id='+row.id
            });
        }else{
            $.messager.show({title:'提示',msg:'请选择您要了解的专辑'});
        }

	}
}


	</script>

	<%-- 章节树形结构图 --%>
	<table id="albumTB" title="专辑信息展示页面" class="easyui-treegrid" data-options="fit:true"></table>
	<div id="saveAlbumDialog" data-options="width:650,height:500,iconCls:'icon-add',title:'添加专辑'"></div>
	<div id="saveChapterDialog" data-options="width:600,height:400,iconCls:'icon-add',title:'添加文章'"></div>
	<div id="showAlbumDialog" data-options="width:650,height:550,iconCls:'icon-save',title:'专辑详情'"></div>

<%--双击播放--%>
<div id="album_paly" class="easyui-dialog" title="播放音频" style="width:400px;height:200px;"
	 data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
	<audio id="audio" src="" controls="controls" autoplay="autoplay" style="margin-top: 55px;margin-left: 50px "></audio>
</div>