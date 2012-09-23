<link rel="stylesheet" href="${resource(dir: 'menu', file: 'memu-0.1.css')}" type="text/css">
<script language="javascript" src="${resource(dir: 'menu', file: 'jquery.memu-0.1.js')}" type="text/javascript"></script>

<div class="black">
    <ul id="menu" class="memu js-enabled">
        <li><a href="#" class="memu-root"><g:message code="category"/></a>
        <ul>
            <g:each in="${productTypes}">
                <li><a href="<g:createLink action="category" params="[id:it.id]"/>">${it}</a>
                <g:if test="${it.children}">
                    <ul>
                        <g:each in="${it.children}">
                            <li><a href="<g:createLink action="category" params="[id:it.id]"/>">${it}</a></li>
                        </g:each>
                    </ul>
                </g:if>
                </li>
            </g:each>
        </ul>
        </li>
    </ul>
</div>
<script type="text/javascript">
    $(function(){
        $('#menu').memu({
            icon: {
                inset: true,
                margin: {
                    top: 4,
                    right: 10
                }
            },
            width: 150,
            rootWidth: 75,
            height: 25,
            subMenuOffset: {
                right: 0,
                top: 0
            }
        });
    })
</script>