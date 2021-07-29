<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
Login page
<@l.login "/login" "Signin"/>
<a href="/registration">Sign up</a>

</@c.page>