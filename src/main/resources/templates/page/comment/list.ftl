<#import "/layout/defaultLayout.ftl" as layout>

<#assign contents>
<div class="container">
    <div clsss="comments">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>이름</th>
                <th>본문</th>
                <th>작성일자</th>
                <th>#</th>
            </tr>
            </thead>
            <tbody>
                <#list comments as comment>
                <tr data-comment-id="${comment.id}">
                    <td>${comment.name}</td>
                    <td>${comment.body}</td>
                    <td>${comment.date}</td>
                    <td>
                        <a class="btn btn-default comment-modify" data-url="/comments/${comment.id}/modify">수정</a>
                        <button class="btn btn-default comment-delete">삭제</button>
                    </td>
                </tr>
                <#else>
                <tr>
                    <td colspan="4">데이터가 없습니다.</td>
                </tr>
                </#list>
            </tbody>
        </table>
    </div>
    <div>
        <div>
            <span>현재페이지 : ${currentPageNumber}</span>
        </div>

        <div class="text-right">
            <a class="btn btn-default" href="/comment/add">추가</a>
        </div>
    </div>

    <nav>
        <ul class="pager">
            <#if currentPageNumber gt 1 >
                <li class="previous">
                    <a href="/comments?page=${currentPageNumber - 1}">
                        <span aria-hidden="true">&larr;</span> Older
                    </a>
                </li>
            </#if>
            <#if currentPageNumber lt totalPageNumber>
                <li class="next">
                    <a href="/comments?page=${currentPageNumber + 1}">
                        Newer <span aria-hidden="true">&rarr;</span>
                    </a>
                </li>
            </#if>
        </ul>
    </nav>
</div>
</#assign>

<#assign script>
<script>
    $(".comment-modify").on("click", function () {
        location.href = $(this).attr("data-url");
    });

    $(".comment-delete").on("click", function () {
        var commentId = $(this).parents("li").attr("data-comment-id");

        $.ajax({
            url: "/comments/" + commentId,
            type: 'DELETE',
            dataType: 'json',
            success: function (data) {
                alert("삭제완료");
                location.reload();
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.status + ' ' + jqXHR.responseText);
            }
        });
    });
</script>
</#assign>
<@layout.default title="리스트" contents=contents script=script/>
