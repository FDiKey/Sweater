<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
<div class="row mb-5">
    Add new user
</div>
${message?ifExists}

<div class="card">
<div class="card-body">
<@l.login "/registration" true />
</div>
</div>

</@c.page>