<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<script>
    $(function(){
        $.get(
            "${pageContext.request.contextPath}/guru/showAll",
            function(result){
                $.each(result,function(index,value){
                    var options=$("<option></option>").attr("value",value.id).text(value.name);
                    $("#gg").append(options);
                });
            },"json"
        );
    });
</script>
<div style="width:100%;text-align: center;">
    <form id="saveArticleInputForm" class="easyui-form" method="post" enctype="multipart/form-data">
        <div style="margin-top: 60px;">
            标<span style="opacity: 0">一一</span>题: <input type="text" name="title" class="easyui-textbox" data-options="width:165,height:26">
        </div>
        <div style="margin-top: 20px;">
            文章插图:<input  name="file"   class="easyui-filebox" data-options="width:165,height:26,required:true,">
        </div>
        <div style="margin-top: 20px;">
            文章内容: <input type="text" name="content" class="easyui-textbox" data-options="width:165,height:26">
        </div>
        <div style="margin-top: 20px;">
            所属大师: <select id="gg" name="guru_id" style="width:165px;height:26px;">
                         <option value="aa">---------请选择---------</option>
                    </select>
        </div>

    </form>
</div>