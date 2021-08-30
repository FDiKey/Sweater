<#assign
        know = Session.SPRING_SECURITY_CONTEXT??
        >

<#if know>
    <#assign
        isActive = true
        user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
        name = user.getUsername()
        password = user.getPassword()
        isAdmin = user.isAdmin()
    >
<#else>
    <#assign
    isActive = false
    name = "unknown"
    isAdmin = false
>
</#if>