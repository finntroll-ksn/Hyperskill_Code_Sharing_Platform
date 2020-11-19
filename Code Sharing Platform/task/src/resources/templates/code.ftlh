<!DOCTYPE html>
<#import "/spring.ftl" as spring/>

<html>
    <head>
        <meta charset="utf-8"/>
        <link rel="stylesheet" href="//cdn.jsdelivr.net/gh/highlightjs/cdn-release@10.2.1/build/styles/default.min.css">
        <script src="//cdn.jsdelivr.net/gh/highlightjs/cdn-release@10.2.1/build/highlight.min.js"></script>
        <script>hljs.initHighlightingOnLoad();</script>
        <title>${responseCode.title}</title>
    </head>
    <body>
        <span id="load_date">${responseCode.date}</span>
        <p>
            <#if responseCode.viewLimit == true>
                <#if (responseCode.views >= 0)>
                    <span><span id="views_restriction">${responseCode.views}</span> more views allowed</span>
                </#if>
            </#if>
        </p>
        <p>
            <#if responseCode.timeLimit == true>
                <#if (responseCode.time > 0)>
                    <span>The code will be available for <span id="time_restriction">${responseCode.time}</span> seconds</span>
                </#if>
            </#if>
        </p>
        <pre id="code_snippet"><code>${responseCode.code}</code></pre>
    </body>
</html>