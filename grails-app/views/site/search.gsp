<%--
  Created by IntelliJ IDEA.
  User: Farzin
  Date: 5/13/13
  Time: 3:10 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="org.springframework.util.ClassUtils; grails.plugin.searchable.internal.util.StringQueryUtils; grails.plugin.searchable.internal.lucene.LuceneUtils" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${params.phrase} - <g:message code="site.title"/></title>
</head>

<body>

<div id="main">
    <div class="layout-container table">
        <div class="table-row">
            <g:set var="haveQuery" value="${params.phrase?.trim()}"/>
            <g:set var="haveResults" value="${searchResult?.results}"/>
            <g:if test="${haveQuery && haveResults}">
                <div class="span180 table-cell">
                    <div class="well sidebar-nav">
                        %{--<g:render template="common/browsingTextualMenu"></g:render>--}%
                    </div>
                </div>
            </g:if>

            <div class="table-cell">
                <div class="table">
                    <div class="table-row">
                        <div class="table-cell">
                            <div class="table">
                                <div class="table-row">
                                    <div class="span600 table-cell">
                                        <div class="search-title">
                                            <span>
                                                <g:if test="${haveQuery && haveResults}">
                                                    <h3><g:message code="search.title" args="${[params.phrase]}"/></h3>

                                                    <div class="resultCounter"><g:message code="search.resultCounter"
                                                                                          args="${[searchResult.offset + 1, searchResult.results.size() + searchResult.offset, searchResult.total]}"/></div>
                                                </g:if>
                                                <g:if test="${haveQuery && !haveResults && !parseException}">
                                                    <h3><g:message code="search.title" args="${[params.phrase]}"/></h3>

                                                    <p><g:message code="search.nothingMatchedYourQuery"/></p>
                                                </g:if>
                                            </span>
                                        </div>
                                        <g:if test="${searchResult?.suggestedQuery}">
                                            <p>Did you mean <g:link controller="searchable" action="index"
                                                                    params="[q: searchResult.suggestedQuery]">${StringQueryUtils.highlightTermDiffs(params.phrase.trim(), searchResult.suggestedQuery)}</g:link>?</p>
                                        </g:if>
                                        <g:if test="${parseException}">
                                            <p>Your query - <strong>${params.phrase}</strong> - is not valid.</p>

                                            <p>Suggestions:</p>
                                            <ul>
                                                <li>Fix the query: see <a
                                                        href="http://lucene.apache.org/java/docs/queryparsersyntax.html">Lucene query syntax</a> for examples
                                                </li>
                                                <g:if test="${LuceneUtils.queryHasSpecialCharacters(params.phrase)}">
                                                    <li>Remove special characters like <strong>" - [ ]</strong>, before searching, eg, <em><strong>${LuceneUtils.cleanQuery(params.phrase)}</strong>
                                                    </em><br/>
                                                        <em>Use the Searchable Plugin's <strong>LuceneUtils#cleanQuery</strong> helper method for this: <g:link
                                                                controller="searchable" action="index"
                                                                params="[q: LuceneUtils.cleanQuery(params.phrase)]">Search again with special characters removed</g:link>
                                                        </em>
                                                    </li>
                                                    <li>Escape special characters like <strong>" - [ ]</strong> with <strong>\</strong>, eg, <em><strong>${LuceneUtils.escapeQuery(params.phrase)}</strong>
                                                    </em><br/>
                                                        <em>Use the Searchable Plugin's <strong>LuceneUtils#escapeQuery</strong> helper method for this: <g:link
                                                                controller="searchable" action="index"
                                                                params="[q: LuceneUtils.escapeQuery(params.phrase)]">Search again with special characters escaped</g:link>
                                                        </em><br/>
                                                        <em>Or use the Searchable Plugin's <strong>escape</strong> option: <g:link
                                                                controller="searchable" action="index"
                                                                params="[q: params.phrase, escape: true]">Search again with the <strong>escape</strong> option enabled</g:link>
                                                        </em>
                                                    </li>
                                                </g:if>
                                            </ul>
                                        </g:if>
                                        <g:if test="${haveResults}">
                                            <g:render template="common/productSearchGrid"/>
                                        </g:if>

                                    </div>

                                    <div class="span200 table-cell">
                                        <g:render template="banners/enamad"></g:render>
                                        <g:render template="banners/leftsideBanners"></g:render>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        (function ($) {
            $('.row-fluid ul.thumbnails li.span6:nth-child(2n + 3)').css('margin-right', '0px');
            $('.row-fluid ul.thumbnails li.span4:nth-child(3n + 4)').css('margin-right', '0px');
            $('.row-fluid ul.thumbnails li.span3:nth-child(4n + 5)').css('margin-right', '0px');
        })(jQuery);
    </script>
</div>
</body>
</html>