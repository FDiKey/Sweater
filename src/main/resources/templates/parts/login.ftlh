<#macro login path isRegisterForm>

        ${message?ifExists}
<form action="${path}" method="post" >
<div class="form-group row">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />

    <label for="username" class="col-sm-2 col-form-label">Login</label>

    <div class="col-sm-6">
        <input type="text" class="form-control" id="username" name="username" placeholder="User name"/>
    </div>
</div>
<div class="form-group row">
    <label for="password" class="col-sm-2 col-form-label">Password</label>
    <div class="col-sm-6">
        <input type="password" class="form-control" id="password" name="password" placeholder="Password"/>
    </div>
</div>
<#if isRegisterForm>
<div class="form-group row">
    <label for="email" class="col-sm-2 col-form-label">Email</label>
    <div class="col-sm-6">
        <input type="email" class="form-control" id="email" name="email" placeholder="some@some.com"/>
    </div>
</div>
</#if>
<div class="form-group row">

    <div class="col-sm-6">
        <#if !isRegisterForm> <a  href="/registration">Sign up</a> </#if>
        <button type="submit" class="btn btn-primary "><#if !isRegisterForm>Sign In<#else>Sign up</#if></button>
    </div>

</div>
</form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <div><input type="hidden" name="_csrf" value="${_csrf.token}"></div>
        <input type="submit" value="Sign Out"/>
    </form>
</#macro>