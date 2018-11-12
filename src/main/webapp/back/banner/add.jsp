<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<div style="width:100%;text-align: center;">
    <form id="addBannerInputForm" class="easyui-form" method="post" enctype="multipart/form-data">
        <div style="margin-top: 70px;">
            标<span style="opacity: 0">一</span>题: <input type="text" name="title" class="easyui-textbox" data-options="width:165,height:26">
        </div>
        <div style="margin-top: 20px;">
            路<span style="opacity: 0">一</span>径: <input  name="file"   class="easyui-filebox" data-options="width:165,height:26,required:true,">
        </div>
        <div style="margin-top: 20px;">
            描<span style="opacity: 0">一</span>述:
            <input type="text" name="description"  class="easyui-textbox" data-options="width:165,height:26">
        </div>
        <div style="margin-top: 20px;">
            状<span style="opacity: 0">一</span>态: <input type="text" name="status"  class="easyui-textbox" data-options="width:165,height:26">
        </div>

    </form>
</div>
