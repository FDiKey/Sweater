<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>

<@l.logout/>
<div>
<form method="post" action="/add">
    <input type="text" name="text" placeholder="Enter name"/>
    <input type="text" name="tag" placeholder="Enter tag"/>
    <div><input type="hidden" name="_csrf" value="${_csrf.token}"></div>
    <input type="submit" value="add"/>
</form>
<form method="get" action="/main">
    <input type="text" name="filter" placeholder="Enter tag" value=${filter} />
    <input type="submit" value="filter"/>
</form>
</div>
<div>List of messages</div>
        <#list messages as message>
<div>
<p>${message.id} ${message.text} ${message.tag}</p> <i>${message.authorName}</i>
</div>
        </#list>
</@c.page>