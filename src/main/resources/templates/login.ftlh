<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
<div class="card" >
<div class="card-body">
    <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION?? >
        <div class="alert alert-danger" role="alert">
            ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
        </div>
    </#if>
    <#if messageType??>
        messageType
    </#if>
<#if message??>
    <div class="alert alert-${messageType}" role="alert">
        ${message}
    </div>
</#if>
<@l.login "/login" false />
</div>
</div>

</@c.page>