<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<script>
    $(function(){
        $("#showAlbumInputForm").form('load','${pageContext.request.contextPath}/album/showOneAlbum?id=${param.id}');
        $("#showAlbumInputForm").form({
            onLoadSuccess:function (data) {
                var attr = $("<img />").attr("src","${pageContext.request.contextPath}"+data.coverImg);
                $("#showImg").append(attr);
            }
        });

    })
</script>
<div style="width:100%;text-align: center;">
    <form id="showAlbumInputForm" class="easyui-form" method="post" enctype="multipart/form-data">
        <div style="margin-top: 50px;">
            标<span style="opacity: 0">一一</span>题: <input type="text" readonly="true" name="title" value="title" class="easyui-textbox" data-options="width:165,height:26">
        </div>
        <div style="margin-top: 20px;">
            发布日期: <input type="text" name="publishDate" readonly="true" value="publishDate" class="easyui-textbox" data-options="width:165,height:26">
        </div>
        <div style="margin-top: 20px;">
            集<span style="opacity: 0">一一</span>数: <input type="text" name="count" readonly="true" value="count"  class="easyui-textbox" data-options="width:165,height:26">
        </div>
        <div style="margin-top: 20px; letter-spacing: 1px;">
            <span style="display:inline-block;padding-top: 25px;margin-left: -3px;">专辑图片:</span><span  id="showImg" ></span>
        </div>
        <div style="margin-top: 20px;">
            星<span style="opacity: 0">一一</span>级: <input type="text" readonly="true" name="star" value="star" class="easyui-textbox" data-options="width:165,height:26">
        </div>
        <div style="margin-top: 20px;">
            作<span style="opacity: 0">一一</span>者: <input type="text" readonly="true" name="author" value="author" class="easyui-textbox" data-options="width:165,height:26">
        </div>
        <div style="margin-top: 20px;">
            播<span style="opacity: 0">一一</span>音: <input type="text" readonly="true" name="broadCast" value="broadCast" class="easyui-textbox" data-options="width:165,height:26">
        </div>
        <div style="margin-top: 20px;">
            内容简介: <input type="text" name="brief" value="brief" readonly="true" class="easyui-textbox" data-options="width:165,height:26">
        </div>
    </form>
</div>
<style>

    #showImg{
        display: inline-block;
        width:165px;
        height:60px;
        border:1px solid #ddd;
        border-radius: 5px;
        vertical-align: top;
        margin-left: 1px;
    }
    #showImg img{
        width:50px;
        height:60px;
    }
</style>