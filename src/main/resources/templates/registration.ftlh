<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
Add new user
${message?ifExists}
<@l.login "/registration" "Regist"/>
<a href="/login">Sign in</a>
</@c.page>