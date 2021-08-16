<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
<div class="row mb-5">
    Add new user
</div>
${message?ifExists}


<@l.login "/registration" true />


</@c.page>