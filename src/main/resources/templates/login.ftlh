<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
<div class="card" >
<div class="card-body">
<@l.login "/login" false />
</div>
</div>

</@c.page>