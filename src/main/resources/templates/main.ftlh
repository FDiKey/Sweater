<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>

<@l.logout/>
<span> <a href="/user"> List of users </a> </span>
<div>
<form method="post" enctype="multipart/form-data">
    <input type="text" name="text" placeholder="Enter name"/>
    <input type="text" name="tag" placeholder="Enter tag"/>
    <input type="file" name="file"/>
    <div><input type="hidden" name="_csrf" value="${_csrf.token}"></div>
    <input type="submit" value="add"/>
</form>
<form method="get" action="/main">
    <input type="text" name="filter" placeholder="Enter tag" value=${filter?ifExists} />
    <input type="submit" value="filter"/>
</form>
</div>
<div>List of messages</div>
        <#list messages as message>
<div>
           <i>${message.id}</i>
           <span> ${message.text} </span>
           <i> ${message.tag} </i>
           <i>${message.authorName}</i>
    <div>
       <#if message.fileName??>
            <img src="${message.fileName}" >
        </#if>

    </div>
</div>
        </#list>
</@c.page>