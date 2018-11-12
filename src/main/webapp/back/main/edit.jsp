<%@page pageEncoding="UTF-8" isELIgnored="false" %>

<div style="width:100%;text-align: center;">
    <form id="editAdminInputForm" class="easyui-form" method="post">
        <input type="hidden" name="id" value="${sessionScope.admin.id}">
        <div style="margin-top: 70px;">
            姓<span style="opacity: 0">一</span>名: <input type="text" name="name"  value="${sessionScope.admin.name}" class="easyui-textbox" data-options="width:165,height:26,iconCls:'icon-man'">
        </div>
        <div style="margin-top: 20px;">
            账<span style="opacity: 0">一</span>号: <input type="text" name="telphone"  value="${sessionScope.admin.telphone}"  class="easyui-textbox" data-options="width:165,height:26,iconCls:'icon-man'">
        </div>
        <div style="margin-top: 20px;">
            旧密码:
            <input type="text" name="password2"  class="easyui-passwordbox" data-options="width:165,height:26">
        </div>
        <div style="margin-top: 20px;">
            新密码: <input type="text" name="password"  class="easyui-passwordbox" data-options="width:165,height:26">
        </div>

    </form>
</div>

