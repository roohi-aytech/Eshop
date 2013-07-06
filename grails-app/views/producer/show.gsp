<%--
  Created by IntelliJ IDEA.
  User: Zanbil
  Date: 4/27/13
  Time: 8:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="eshop.Producer" %>
<!doctype html>
<html dir="rtl">
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'producer.label', default: 'Producer')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">
    <div class="criteria-div">
        <rg:criteria>
            <rg:like name="name" label='producer.name'/>
            <rg:filterGrid grid="ProducerGrid" label='search'/>
        </rg:criteria>
        <script type="text/javascript">
            $(".criteria-div")
                    .find('div,label,input')
                    .css('display','inline')
                    .css('margin','3px');
        </script>
    </div>
    <rg:grid domainClass="${Producer}"
             maxColumns="8"
             showCommand="false"
             onSelectRow="loadProducerStaffs"
    />
    <g:javascript>
        var curSelectedProducer=${producer?:0}
        var loadProducerStaffs = function (rowId) {
            curSelectedProducer = rowId
            var criteria = "[{'op':'eq', 'field':'producer.id', 'val':" + rowId + "}]"
            loadGridWithCriteria("ProducerStaffGrid", criteria)
            loadGridWithCriteria("ProducingProductGrid", criteria)
            loadGridWithCriteria("ProducerAccountGrid", criteria)

        }
    </g:javascript>

    <div style="margin: 10px;">
        <rg:grid domainClass="${eshop.ProducerStaff}"
                 showCommand="false"
                 maxColumns="8">
            <rg:criteria>
                <rg:inCrit name="producer.id" value="${producer as Long}"/>
            </rg:criteria>

        </rg:grid>
    </div>

    <div style="margin: 10px;">
        <rg:grid domainClass="${eshop.ProducingProduct}"
                 showCommand="false"
                 maxColumns="22">
            <rg:criteria>
                <rg:inCrit name="producer.id" value="${producer as Long}"/>
            </rg:criteria>

        </rg:grid>
    </div>

    <div style="margin: 10px;">
        <rg:grid domainClass="${eshop.ProducerAccount}"
                 showCommand="false"
                 maxColumns="7">
            <rg:criteria>
                <rg:inCrit name="producer.id" value="${producer as Long}"/>
            </rg:criteria>

        </rg:grid>
    </div>

    <g:javascript>
    </g:javascript>
</div>
</body>
</html>
