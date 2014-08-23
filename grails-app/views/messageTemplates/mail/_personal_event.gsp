مشتری گرامی ${personalEvent.customer} <br/>

<g:link uri="/" absolute="true">فروشگاه اینترنتی <g:message code="name"/></g:link>مناسبت زیر را به شما یادآوری می نماید
${dayRemaining} روز مانده به  ${personalEvent.title}

<br/>
پیشنهاد گلدان با توجه به محدوده قیمت مد نظر شما<g:link absolute="true" uri="/filter?f=${productType?.id?"p${productType?.id},":''}${personalEvent.minPrice?"rf${personalEvent.minPrice},":''}${personalEvent.maxPrice?"rt${personalEvent.maxPrice}":''}" >${personalEvent.title}</g:link> میباشد