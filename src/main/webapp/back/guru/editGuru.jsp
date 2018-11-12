<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<script>
    $(function(){
        $("#editGuruInputForm").form('load','${pageContext.request.contextPath}/guru/showOneGuru?id=${param.id}');
    })
</script>
<div style="width:100%;text-align: center;">
    <form id="editGuruInputForm" class="easyui-form" method="post" enctype="multipart/form-data">

        <input type="hidden" name="id" value="${param.id}">

        <div style="margin-top: 85px;">
            法<span style="opacity: 0">一</span>名: <input type="text" name="name" value="name" class="easyui-textbox" data-options="width:165,height:26,iconCls:'icon-man'">
        </div>
        <div style="margin-top: 20px;">
            头<span style="opacity: 0">一</span>像: <input  name="file"   class="easyui-filebox" data-options="required:true,width:165,height:26,">
        </div>
        <div style="margin-top: 20px;">
            性<span style="opacity: 0">一</span>别:<select class="easyui-combobox" name="sex" data-options="width:165,height:26">
            <option value="男">男</option>
            <option value="女">女</option>
        </select>
        </div>

    </form>
</div>
