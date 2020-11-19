<!DOCTYPE html>
<#import "/spring.ftl" as spring/>
<html>
    <head>
        <meta charset="utf-8"/>
        <link rel="stylesheet" href="//cdn.jsdelivr.net/gh/highlightjs/cdn-release@10.2.1/build/styles/default.min.css">
        <script src="//cdn.jsdelivr.net/gh/highlightjs/cdn-release@10.2.1/build/highlight.min.js"></script>
        <script>hljs.initHighlightingOnLoad();</script>
        <title>Latest</title>
    </head>
    <body>
        <#list lastCodesStore as lastCode>
            <div>
                <span id="load_date">${lastCode.date}</span>
                <pre id="code_snippet"><code>${lastCode.code}</code></pre>
            </div>
        </#list>
    </body>
</html>