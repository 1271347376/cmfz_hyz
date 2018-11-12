<%@page isELIgnored="false" pageEncoding="UTF-8" %>

<div style="width:100%;text-align: center;">
    <form id="saveCourseInputForm" class="easyui-form" method="post">
        <div style="margin-top: 80px;">
            标<span style="opacity: 0">一一</span>题: <input type="text" name="title" class="easyui-textbox" data-options="width:165,height:26">
        </div>
        <div style="margin-top: 20px;">
            文章插图:<select class="easyui-combobox" name="marking" data-options="width:165,height:26">
            <option value="必修">必修</option>
            <option value="选修">选修</option>
        </select>
        </div>
    </form>
</div>