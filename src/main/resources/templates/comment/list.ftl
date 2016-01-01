<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

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
        <#if currentPageNumber gt 0 >
            <li class="previous">
                <a href="/comments?page=${currentPageNumber - 1}">
                    <span aria-hidden="true">&larr;</span> Older
                </a>
            </li>
        </#if>
        <#if currentPageNumber != (totalPageNumber - 1)>
            <li class="next">
                <a href="/comments?page=${currentPageNumber + 1}">
                    Newer <span aria-hidden="true">&rarr;</span>
                </a>
            </li>
        </#if>
        </ul>
    </nav>
    <div class="pagable">


    </div>

    <script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
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
</body>
</html>