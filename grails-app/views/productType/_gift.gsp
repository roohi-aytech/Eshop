<g:form action="saveGiftInformation">
    <g:hiddenField name="id" value="${giftInformation?.id}"/>
    <g:hiddenField name="productType.id" value="${productTypeInstance?.id}"/>

    <div class="fieldcontain ${hasErrors(bean: giftInformation, field: 'cultureEvents', 'error')} ">
        <label for="cultureEvents">
            <g:message code="gift.events" default="Events"/>

        </label>
        <rg:checkBoxList name="cultureEvents" from="${eshop.CultureEvent.findAll()}" optionKey="id" value="${giftInformation?.cultureEvents?.collect {it.id}}" />
    </div>

    <div class="fieldcontain ${hasErrors(bean: giftInformation, field: 'gender', 'error')} ">
        <label for="gender">
            <g:message code="gift.gender" default="Gender"/>

        </label>
        <g:select name="gender" from="${new eshop.GiftInformation().constraints.gender.inList}"
                  valueMessagePrefix="giftInformation" value="${giftInformation?.gender}" noSelection="['':'']"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: giftInformation, field: 'age', 'error')} ">
        <label for="fromAge">
            <g:message code="gift.age" default="Age"/>

        </label>
        <g:textField name="fromAge" value="${giftInformation?.fromAge}" placeholder="${message(code: "from")}"/>
        -
        <g:textField name="toAge" value="${giftInformation?.toAge}"  placeholder="${message(code: "to")}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: giftInformation, field: 'type', 'error')} ">
        <label for="type">
            <g:message code="gift.type" default="Type"/>

        </label>
        <g:select name="type" from="${new eshop.GiftInformation().constraints.type.inList}"
                  valueMessagePrefix="giftInformation" value="${giftInformation?.type}" noSelection="['':'']"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: giftInformation, field: 'usageType', 'error')} ">
        <label for="usageType">
            <g:message code="gift.usageType" default="Usage Type"/>

        </label>
        <g:select name="usageType" from="${new eshop.GiftInformation().constraints.usageType.inList}"
                  valueMessagePrefix="giftInformation" value="${giftInformation?.usageType}" noSelection="['':'']"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: giftInformation, field: 'job', 'error')} ">
        <label for="job">
            <g:message code="gift.job" default="job"/>

        </label>
        <g:select name="job" from="${new eshop.GiftInformation().constraints.job.inList}"
                  valueMessagePrefix="giftInformation" value="${giftInformation?.job}" noSelection="['':'']"/>
    </div>
    <g:submitButton name="submit" value="${message(code: "save")}"/>
</g:form>