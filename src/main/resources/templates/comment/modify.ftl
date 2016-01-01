<html>
<body>
<form action="/comments/${comment.id}/modify" method="post">
    <input type="hidden" name="id" value="${comment.id}">
    <div>
        <label id="name">이름 : </label>
        <input type="text" name="name" id="name" value="${comment.name}">
    </div>
    <div>
        <label id="body">본문 : </label>
        <input type="text" name="body" id="body" value="${comment.body}">
    </div>
    <div>
        <input type="submit">
    </div>
</form>
</body>
</html>