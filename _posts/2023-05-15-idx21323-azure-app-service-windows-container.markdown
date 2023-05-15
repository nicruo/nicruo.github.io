---
layout: post
title:  "IDX21323 - Azure App Service Windows Container"
date:   2023-05-15 17:00:00 +0000
---

Recently, while doing an ASP.NET demo, I decided to publish the Web App in a Windows Container (because of .NET Framework) to Azure App Services.
It was a simple Authentication demo with the default template with Microsoft identity platform option. Worked perfectly in my local machine. But on Azure, I got the following error:

```
IDX21323: RequireNonce is '[PII is hidden. For more details, see https://aka.ms/IdentityModel/PII.]'.
OpenIdConnectProtocolValidationContext.Nonce was null, OpenIdConnectProtocol.ValidatedIdToken.Payload.Nonce was not null. The nonce cannot be validated. If you don't need to check the nonce, set OpenIdConnectProtocolValidator.
RequireNonce to 'false'. Note if a 'nonce' is found it will be evaluated.
```

On Firefox the Web App worked as expected, but on Chrome/Edge this error appeared. So looking at the Nonce cookie, there was a missing "secure" attribute.

So there is an issue with the Nonce cookie. The issue is TLS termination.

The problem is that, while using OWIN to handle the authentication, there is some validation if the request is http or https. But because we are inside a container, the framework always thinks that we are not using https (Every https request in Azure App Services is then redirected to http).

The solution was simple, adding a new middleware:

```csharp
app.Use((context, next) =>
{
    if (context.Request.Headers["X-Forwarded-Proto"] == "https")
    {
        context.Request.Scheme = "https";
    }
    return next();
});
```
