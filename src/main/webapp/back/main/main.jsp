<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>持名法州主页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/form.validator.rules.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/datagrid-detailview.js"></script>
    <style>
        #menu{
            background: #FFF5FA;
        }
        #menu:hover{
            background:#95B8E7;
        }

        .accordion {
            background: #ffffff;
            border-color: #ccc;
        }

        .accordion .accordion-header {
            background: #fcfcfc;
            filter: none;
        }

        .accordion .accordion-header-selected  {
            background: #FFDBE0;

        }


    </style>
    <script type="text/javascript">

        if("${sessionScope.admin}"==""){
            location.href="${pageContext.request.contextPath}/back/login.jsp";
        }
	<!--菜单处理-->
    $(function(){
        $.post(
            "${pageContext.request.contextPath}/menu/showAll",
            function(menus){
                $.each(menus,function(index,m){
                    var content="";
                    $.each(m.menu,function(idx,child){
                        content += "<div id='menu' onclick=\"addTabs('"+child.title+"','"+child.iconCls+"','"+child.href+"')\" style='margin:5px auto;width:98%;border-radius:5px'><a style='width:100%;' class='easyui-linkbutton' data-options=\"plain:true,iconCls:'"+child.iconCls+"'\" >"+child.title+"</a></div>";
                    });
                    $("#aa").accordion('add',{
                        title:m.title,
                        iconCls:m.iconCls,
                        content:content
                    });
                });
            }
        );
        setInterval("document.getElementById('time1').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());", 1000);
    });

	function editPwd(){
	    $("#editDg").dialog({
            href:"${pageContext.request.contextPath}/back/main/edit.jsp",
            buttons:[{
                text:'修改',
                iconCls:'icon-edit',
                handler:function(){
                    $("#editAdminInputForm").form('submit',{
                        url:'${pageContext.request.contextPath}/admin/updatePwd',
                        success:function (result) {
                            var resultObj = $.parseJSON(result);
                            if(resultObj.success){
                                $.messager.show({title:'提示',msg:"密码修改成功"});

                            }else{
                                $.messager.show({title:'提示',msg:resultObj.message});
                            }

                            $("#editDg").dialog('close');

                        }
                    });
                }
            },{
                text:'取消',
                iconCls:'icon-cancel',
                handler:function(){
                    $("#editDg").dialog('close');
                }
            }]
        });
    }

    function addTabs(name,iconCls,href){
        if(!$("#tt").tabs('exists',name)){
            $("#tt").tabs('add',{
                title:name,
                iconCls:iconCls,
                closable:true,
                fit:true,
                href:"${pageContext.request.contextPath}"+href,
            });
        }else{
            $("#tt").tabs('select',name);
        }
    }

</script>

</head>
<body class="easyui-layout">

    <div data-options="region:'north',split:true" style="height:60px;background-color:  #5C160C">
        <div style="font-size: 24px;color: #FAF7F7;font-family: 楷体;font-weight: 900;width: 300px;float:left;padding-left: 20px;padding-top: 12px" >持名法州后台管理系统</div>
        <div id="time1" style="font-size: 14px;color: #FAF7F7;font-family: 楷体;width: 260px;float:left;padding-top: 18px;"></div>
        <div style="font-size: 16px;color: #FAF7F7;font-family: 楷体;width: 300px;float:right;padding-top:15px">欢迎您${sessionScope.admin.name} &nbsp;<a href="#" onclick="editPwd()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改密码</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/admin/quit" class="easyui-linkbutton" data-options="iconCls:'icon-clear'">退出系统</a></div>
    </div>   
    <div data-options="region:'south',split:true" style="height: 40px;background: #5C160C">
    	<div style="text-align: center;font-size:15px; color: #FAF7F7;font-family: 楷体" >&copy;百知教育 htf@zparkhr.com.cn</div>
    </div>   
       
    <div data-options="region:'west',title:'导航菜单',split:true" style="width:220px;">
    	<div id="aa" class="easyui-accordion" data-options="fit:true">
    		
		</div>  
    </div>   
    <div data-options="region:'center'">
    	<div id="tt" class="easyui-tabs" data-options="fit:true,narrow:true,pill:true">   
		    <div title="主页" data-options="iconCls:'icon-neighbourhood',"  style="background-image:url(${pageContext.request.contextPath}/back/main/image/shouye.jpg);background-repeat: no-repeat;background-size:100% 100%;"></div>

        </div>
    </div>

<div id="editDg" data-options="width:600,height:400,title:'修改密码'"></div>
</body> 
</html>