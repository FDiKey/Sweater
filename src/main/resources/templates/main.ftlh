<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>

<@l.logout/>
<form method="post" enctype="multipart/form-data">
<div class="form-group">
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="4"  name="text"></textarea>

<!--    <input type="text" name="text" placeholder="Enter name"/>-->
    <input  class="form-control" type="text" name="tag" placeholder="Enter tag"/>
    <input  class="form-control" type="file" name="file"/>
    <div><input type="hidden" name="_csrf" value="${_csrf.token}"></div>
    <input  class="form-control" type="submit" value="add"/>
</div>
</form>
<form method="get" action="/main">
<div class="row ow align-items-start mb-3">
    <div class="col-11">
    <input type="text" class="form-control" id="filter"  name="filter" value=${filter?ifExists} >
    </div>
    <div class="col">
    <button type="submit" class="btn btn-primary" value="filter">filter</button>
    </div>
</div>
</form>
<div>List of messages</div>
        <#list messages as message>
<div>
           <i>${message.id}</i>
           <span> ${message.text} </span>
           <i> ${message.tag} </i>
           <i>${message.authorName}</i>
    <div>
       <#if message.fileName??>
            <img src="/img/${message.fileName}" >
        </#if>

    </div>
</div>
        </#list>
</@c.page>