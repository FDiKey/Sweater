<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>

<div class="form-group md-6">
    <form method="get" action="/main" class="row g-3">
            <div class="col-4">
                <input type="text" name="filter" class="form-control col-4" value="${filter?ifExists}" placeholder="Search by tag"/>
            </div>
            <div class="col-4">
            <button type="submit" class="btn btn-primary">Search</button>
            </div>
    </form>
</div>

<p>
<a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="true" aria-controls="collapseExample" >
    add message
</a>
</p>
<div class="row">
<div class="col">
    <div class="collapse multi-collapse" id="collapseExample">

        <form method="post" enctype="multipart/form-data">
            <div class="form-group mb-2">
                <input type="text" class="form-control" name="text" placeholder="Введите сообщение" />
            </div>
            <div class="form-group mb-2">
                <input type="text" class="form-control" name="tag" placeholder="Тэг"/>
            </div>
            <div class="form-group mb-2">
                <div class="custom-file">
                    <input type="file" name="file" id="customFile"/>
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Add</button>
            </div>
        </form>
<!--        </div>-->
    </div>
</div>
</div>

<div>List of messages</div>



<div class="row row-cols-1 row-cols-md-3 g-4">
        <#list messages as message>

    <div class="col">
        <div class="card h-100 border-secondary">
        <#if message.fileName??>
            <img class="card-img-fluid img-thumbnail" src="/img/${message.fileName}" >
        </#if>
            <div class="card-body">
                <p class="card-text"> ${message.text} </p>
                <i> ${message.tag} </i>
            </div>
            <div class="card-footer text-muted">
              @${message.authorName}
            </div>
        </div>

    </div>
    </#list>
</div>

</@c.page>