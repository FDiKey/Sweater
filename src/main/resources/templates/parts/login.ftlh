<#macro login path isRegisterForm>
<form action="${path}" method="post" >
<div class="form-group row">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />

    <label for="username" class="col-sm-2 col-form-label">Login</label>

    <div class="col-sm-6">
        <input type="text" class="form-control ${(usernameError??)?string('is-invalid', '')}" id="username" name="username" placeholder="User name" value="<#if user??> ${user.username} </#if>"/>
        <#if usernameError??>
        <div class="invalid-feedback">
            ${usernameError}
        </div>
    </#if>
    </div>
</div>
<div class="form-group row">
    <label for="password" class="col-sm-2 col-form-label">Password</label>
    <div class="col-sm-6">
        <input type="password" class="form-control ${(passwordError??)?string('is-invalid', '')}"
               id="password"
               name="password"
               placeholder="Password"/>
        <#if passwordError??>
        <div class="invalid-feedback">
            ${passwordError}
        </div>
    </#if>
    </div>
</div>
<#if isRegisterForm>
<div class="form-group row">
<label for="password2" class="col-sm-2 col-form-label">Confirm Password</label>
<div class="col-sm-6">
    <input type="password" class="form-control ${(password2Error??)?string('is-invalid', '')}"
           id="password2"
           name="password2"
           placeholder="Password"/>
    <#if password2Error??>
        <div class="invalid-feedback">
            ${password2Error}
        </div>
    </#if>
</div>
        </div>
<div class="form-group row">
    <label for="email" class="col-sm-2 col-form-label">Email</label>
    <div class="col-sm-6">
        <input type="email"
               class="form-control ${(emailError??)?string('is-invalid', '')}"
               id="email"
               name="email"
               value="<#if user??> ${user.email} </#if>"
               placeholder="some@some.com"/>
        <#if emailError??>
             <div class="invalid-feedback">
                ${emailError}
            </div>
        </#if>
    </div>
</div>
</#if>
<div class="form-group row">

    <div class="col-sm-6">
        <#if !isRegisterForm> <a  href="/registration">Sign up</a> </#if>
            <button type="submit" class="btn btn-primary ">
                    <#if !isRegisterForm>
                            Sign In
                    <#else>
                            Sign up
                    </#if>
            </button>
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