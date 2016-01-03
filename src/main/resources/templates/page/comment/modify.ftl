<#import "/layout/defaultLayout.ftl" as layout>

<#assign contents>
<div class="container">
    <form action="/comments/${comment.id}/modify" method="post">
        <input type="hidden" name="id" value="${comment.id}">
        <div class="form-group">
            <label id="name">이름</label>
            <input type="text" name="name" class="form-control" id="name">
        </div>
        <div class="form-group">

            <label id="body">본문</label>
            <input type="text" name="body" class="form-control" id="body" value="${comment.name}">

        </div>

        <input class="btn btn-default" type="submit" value="${comment.body}">
    </form>
</div>
</#assign>

<@layout.default title="수정" contents=contents script=script/>
