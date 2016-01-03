<#import "/layout/defaultLayout.ftl" as layout>

<#assign contents>
<div class="container">
    <form action="/comment/add" method="post">
        <div class="form-group">
            <label id="name">이름</label>
            <input type="text" name="name" class="form-control" id="name">
        </div>
        <div class="form-group">

            <label id="body">본문</label>
            <input type="text" name="body" class="form-control" id="body">

        </div>

        <input class="btn btn-default" type="submit">
    </form>
</div>
</#assign>
<@layout.default title="작성" contents=contents/>
