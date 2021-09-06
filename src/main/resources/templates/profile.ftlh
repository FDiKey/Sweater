<#import "parts/common.ftlh" as c>


<@c.page>
<h4>${username} </h4>
<form method="post" >
<div class="form-group row">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
</div>
<div class="form-group row">
    <label for="password" class="col-sm-2 col-form-label">Password</label>
    <div class="col-sm-6">
        <input type="password" class="form-control"
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
<div class="form-group row">
    <label for="password" class="col-sm-2 col-form-label">Password</label>
    <div class="col-sm-6">
        <input type="password"
               class="form-control"
               id="password2"
               name="password2"
               placeholder="Confirmation"/>
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
        <input type="email" class="form-control" id="email" name="email" value="${email!''}" placeholder="some@some.com"/>
    </div>
</div>
<div class="form-group row">

<div class="col-sm-6">
    <button type="submit" class="btn btn-primary ">Save</button>
    <button type="submit" class="btn btn-primary ">Reset</button>
</div>


        </div>
        </form>
</@c.page>