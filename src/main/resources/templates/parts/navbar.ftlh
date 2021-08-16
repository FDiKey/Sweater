<#include "security.ftlh">


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
        </ul>
    </div>
<!--        <ul class="navbar-nav me-auto">-->
<!--        <li  class="nav-item">-->
<!--            <a class="nav-link active" href="/login?logout">logout</a>-->
<!--        </li>-->
<!--        </ul>-->
<!--        -->
        <div class="navbar-text">${name}</div>
    </div>
</nav>
