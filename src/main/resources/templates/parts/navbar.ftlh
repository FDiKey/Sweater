<#include "security.ftlh">
<#import "login.ftlh" as l>

<nav class="navbar navbar-expand navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">Sweater</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto">
            <li class="nav-item">
                <a class="nav-link active"  href="/">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active"  href="/main">Messages</a>
            </li>
            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link active"  href="/user">Userlist</a>
                </li>
            </#if>
            <#if user??>
                <li class="nav-item">
                    <a class="nav-link active"  href="/user/profile">Profile</a>
                </li>
            </#if>
        </ul>
    </div>

    <div class="navbar-text"><#if isActive> <a href="/profile/${user.getUsername()}"> ${name} </a> <#else> ${name} </#if></div>
        <div class="mx-3"><@l.logout/></div>
    </div>
</nav>
