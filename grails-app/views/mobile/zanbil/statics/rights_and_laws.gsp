<%--
  Created by IntelliJ IDEA.
  User: Farzin
  Date: 6/13/13
  Time: 12:32 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <g:if test="${session.mobile}">
        <meta name='layout' content='mobile'/>
    </g:if>
    <title><g:message code="rules.label"/></title>

</head>

<body>
<div class="static-page-content">
    <h2><g:message code="rules.label"></g:message></h2>

    <div class="page-content">
        <div>
            <p>

            <h3>
                کاربر گرامی:
            </h3></p>
            <p>

            <h3>
                ضمن تشکر از انتخاب فروشگاه اینترنتی <g:message
                        code="name"/>، از آنجا که استفاده از این سایت به معنای قبول شرایط مندرج در بخش قوانین و حقوق سایت است، لطفاٌ این قسمت را به دقت مطالعه فرمایید.

            </h3></p>
            <ul>
                <li><h2>قوانین سایت:</h2>
                    <ol>
                        <li>
                            شما برای مشاهده، دریافت اطلاعات و حتی ثبت سفارشات ملزم به ثبت نام در سایت نمی باشید. اما چنانچه در سایت ثبت نام نمایید، می توانید از امتیازات ویژه ای همچون استفاده از سیستم امتیازدهی سایت، ثبت لیست علاقه مندی ها، ثبت و یادآوری مناسبت ها، آگاهی از فروش ها و تخفیفات ویژه و ... استفاده نمایید. به این منظور لازم است کلیه اطلاعات درخواستی سایت از جمله نام، شماره تماس و آدرس خود را وارد نمایید. با ثبت این اطلاعات، ضمن اطمینان از محفوظ بودن آن ها، به سایت <g:message
                                    code="name"/> اختیار می دهید تا جهت ارتباط برقرار نمودن با شما و اطلاع دادن اخبار مربوط به سایت، از طریق ایمیل یا پیام کوتاه با شما در ارتباط باشد.
                        </li>
                        <li>
                            وب سایت رسمی <g:message
                                    code="name"/> و کلیه مطالب مندرج در آن از جمله متون، گرافیک، علامت تجاری، عکس ها، کلیپ ها، نرم افزارها و ... صرفاٌ متعلق به فروشگاه اینترنتی <g:message
                                    code="name"/> بوده و هرگونه کپی برداری و سوء استفاده شخصی یا تجاری از آن ها بدون کسب اجازه از مسئولین سایت یا بدون ذکر منبع، غیر مجاز بوده و پیگرد قانونی به همراه خواهد داشت.
                        </li>
                        <li>
                            قبل از ثبت هرگونه سفارش در سایت، اطلاع از نحوه ثبت سفارشات و خرید الزامی است. چنانچه مشتری اطلاعات شخصی یا سفارش خود را اشتباه ثبت نموده و از این طریق ضرر و زیانی را متوجه خود یا فروشگاه <g:message
                                    code="name"/> نماید، خود مسئول آن خواهد بود.
                        </li>
                        <li>
                            در سایت <g:message
                                    code="name"/> امکان ثبت نظرات، پیشنهادات و سؤالات کاربران فراهم آمده است. در این زمینه کاربران موظف هستند از درج هرگونه مطالب مغایر با اصول قانونی و اخلاقی، افتراآمیز، تهدید کننده حریم خصوصی افراد یا حقوق مالکیت معنوی و هرگونه مطالب ناشایست دیگر جداٌ خودداری نمایند. سایت <g:message
                                    code="name"/> هیچ گونه مسئولیتی را در قبال درج چنین مطالبی نمی پذیرد. در عین حال این حق را دارد که در صورت مشاهده آن ها را از سایت خود حذف نموده، از دسترسی مجدد کاربر به سایت جلوگیری به عمل آورده و وی را تحت پیگرد قانونی قرار دهد.
                        </li>
                        <li>
                            سایت فروشگاه اینترنتی <g:message
                                    code="name"/> جهت افزایش آگاهی و اطلاع رسانی به کاربران خود، اقدام به تهیه اطلاعات عمومی در زمینه کالاها نموده است. این اطلاعات توسط گروه تخصصی سایت با نهایت دقت در اعتبار و صحیح بودن آن ها تهیه شده است. این سایت تلاش می نماید مطالب خود را به صورت مستمر از جهت درست بودن و به روز بودن محتوا بازبینی نماید. از طرف دیگر، هیچ گونه مسئولیتی را در قبال محتوای این مطالب، اشکالات غیرعمدی و ایرادات نگارشی آن نمی پذیرد.
                        </li>
                        <li>
                            درصورتیکه کاربران هرگونه اطلاعات اعم از مطالب عمومی، اخبار، عکس و ... را برای این سایت ارسال نمایند،  فروشگاه اینترنتی <g:message
                                    code="name"/> این حق را خواهد داشت تا نسبت به استفاده، تغییر، تصحیح و انتشار آن ها اقدام نماید. در عین حال مسئولیت صحیح بودن و عدم منافات مطالب با اصول قانونی و اخلاقی، تماماٌ به عهده کاربر بوده و مسئولیتی متوجه سایت <g:message
                                    code="name"/> نخواهد بود.
                        </li>
                        <li>
                            فروشگاه اینترنتی <g:message
                                    code="name"/> ارسال کلیه کالاهای سفارشی به درب منزل مشتری را با هزینه خود به عهده دارد. چنانچه این کالاها به دلایلی چون نادرست بودن اطلاعات مشتری مانند آدرس وی یا عدم حضور و پاسخگویی او و یا وقوع حوادث طبیعی مانند سیل، زلزله و مانند آن ها به دست مشتری نرسد، هیچ گونه مسئولیتی متوجه این فروشگاه نمی باشد. در مورد نادرست بودن اطلاعات مشتری یا عدم حضور و پاسخگویی او، تمامی مسئولیت و ضرر و زیانی که از این طریق متوجه خود یا فروشگاه نماید، تماماٌ به عهده وی بوده و قابل پیگرد است.
                        </li>
                        <li>
                            ممکن است در سایت فروشگاه اینترنتی <g:message
                                    code="name"/> لینک هایی به سایر سایت ها جهت تبلیغات، استفاده کاربران از خدمات آن ها و ... فراهم شده باشد. فروشگاه اینترنتی <g:message
                                    code="name"/> به هیچ وجه مسئولیتی در قبال مطالب ارائه شده در این سایت ها و یا خدمات ارائه شده از جانب آن ها برعهده نداشته و مسئول ارزیابی و کنترل  نمودن آن ها نیست. در صورت استفاده کاربران از این لینک ها و سایت ها، مطالعه، آگاهی و پایبندی به قوانین و حقوق آن ها، به عهده خود کاربر است.
                        </li>
                        <li>
                            فروشگاه اینترنتی <g:message
                                    code="name"/> حداکثر تلاش خود را برای صحیح بودن تمامی اطلاعات مندرج در سایت منجمله اطلاعات کالاها و همچنین سرویس دهی مناسب به کاربران، به کار می گیرد. در عین حال این سایت درست بودن و بدون نقص بودن محتوای اطلاعات و یا سرویس دهی خود را تضمین نمی نماید. چنانچه کالای دریافتی مشتری متناقض با اطلاعات کالای مندرج در این سایت بوده و اشتباه از جانب فروشگاه باشد، مشتری تنها در صورت آکبند بودن کالا، می تواند آن را مرجوع نماید.
                        </li>
                        <li>
                            اگر کاربر ضمن استفاده از وب سایت <g:message
                                    code="name"/> در اثر هرگونه مشکل از قبیل نواقص اینرنتی، نرم افزاری، تغییرات جوی، خطای نیروی انسانی و ... دچار خسارت یا ضرر و زیان احتمالی گردد، مسئولیت آن به عهده این وب سایت نخواهد بود. به علاوه این سایت در قبال افشای اطلاعات کاربر در اثر قصور خود وی و یا ویروسی شدن سیستم کامپیوتری کاربر که می تواند ناشی از دسترسی به لینک سایت های دیگر باشد نیز مسئولیتی نخواهد داشت.
                        </li>
                        <li>
                            وب سایت <g:message
                                    code="name"/> این اختیار را دارد که در هر زمان نسبت به ایجاد تغییرات در این وب سایت منجمله سیاست ها، حقوق و قوانین و به روز رسانی اطلاعات خود اقدام نماید. این وب سایت مسئولیتی را در زمینه صفحات حذف شده یا لینک ها و آگهی های تاریخ گذشته خود نمی پذیرد.
                        </li>
                        <li>
                            کاربران وب سایت <g:message
                                    code="name"/> موظف می باشند تنها جهت استفاده از سرویس های مجاز این وب سایت و طبق شرایط درج شده از آن استفاده نمایند. هیچ گونه استفاده غیر قانونی از این وب سایت که منجر به آسیب، خرابی، از دست رفتن یا تغییر اطلاعات، افشای اطلاعاتی که عمداٌ به صورت ناآشکار در سایت گنجانده شده، افشای اطلاعات شخصی کاربران و سایر ضرر و زیان های احتمالی گردد مجاز نبوده و پیگرد قانونی به دنبال خواهد داشت.
                        </li>
                        <li>
                            کاربران موظف به حفاظت از اطلاعات شخصی کاربری خویش بوده و مسئولیت تبادل هرگونه اطلاعاتی که از طریق شناسه کاربری و رمز عبور آن ها صورت می گیرد به عهده خود آنان است.
                        </li>
                        <li>
                            فروشگاه اینترنتی <g:message
                                    code="name"/> در هر زمانی این اختیار را دارد که بنا به مصالح خود، ارائه سرویس به مشتریان و برقراری ارتباط با آنان را متوقف کرده و نسبت به تغییر یا حذف کلیه مطالب یا خدمات خویش اقدام نماید.
                        </li>
                    </ol>
                </li>
                <li><h2>
                    حقوق کاربران</h2>
                    <ul>
                        <li>
                            چنانچه کاربران اطلاعات خود را در وب سایت <g:message
                                    code="name"/> ثبت نموده و یا به هر طریق دیگری ارسال نمایند، این اطلاعات در وب سایت ما ذخیره خواهد شد. وب سایت <g:message
                                    code="name"/> از این اطلاعات تنها برای تعامل بیشتر و سرویس دهی بهتر به مشتریان خود استفاده نموده و به هیچ وجه آن ها را افشا نکرده و در اختیار مرجع دیگری قرار نخواهد داد.
                        </li>
                        <li>
                            یکی دیگر از روش های ذخیره اطلاعات در اکثر وب سایت ها از جمله وب سایت <g:message
                                    code="name"/>، استفاده از «کوکی» ها است. کوکی ها فایل هایی هستند که اطلاعاتی را که خود کاربر اقدام به ثبت نمودن آن ها می نماید و همچنین اطلاعاتی مانند صفحاتی که مورد مشاهده کاربر قرار می گیرند، تعداد بازدیدهای کاربر از صفحات سایت و مدت زمانی که کاربر در سایت به سر می برد را ذخیره نمایند. یکی از مزایای آن ها کمک به کاربر جهت جلوگیری از تکرار اطلاعات خود در مراجعات بعدی است. به عنوان مثال سایت هایی که بلافاصله پس از ورود، شما را با نام خطاب کرده و به شما خوش آمد می گویند، از همین ویژگی استفاده می نمایند. به طور کلی کوکی ها صرفاٌ جهت راحتی کاربر و عدم نیاز وی به ورود اطلاعات تکراری، جمع آوری اطلاعات آماری سایت مانند تعداد بازدیدهای روزانه و ارائه سرویس دهی بهتر به کاربران مورد استفاده قرار گرفته و هیچ خطری را متوجه آن ها نمی نمایند. این فایل ها همچنین قابلیت صدمه وارد کردن به کامپیوتر کاربر، اجرای برنامه بر روی آن یا ویروسی نمودن آن را ندارند.
                        </li>
                        <li>
                            وب سایت <g:message
                                    code="name"/> به جز آدرس www.zanbil.ir هیچ گونه مرجع رسمی دیگری نداشته و به جز این وب سایت یا منابع دیگری که در بخش «تماس با ما» به آن ها اشاره نموده است، با مشتریان خود در تماس نخواهد بود. درصورتیکه وب سایت بخواهد از طرق دیگری با مشتریان خود ارتباط برقرار نماید، حتماٌ آن را به صورت رسمی اطلاع رسانی خواهد کرد. این وب سایت تنها با استفاده از این مراجع با نهایت تلاش خویش اقدام به تأمین نیازها و جلب رضایت مشتریان خود نموده و در مقابل زیان های ناشی از تماس مشتریان با هرگونه راه ارتباطی غیرمجاز که از نام <g:message
                                    code="name"/> استفاده نموده باشد، پاسخگو نخواهد بود.
                        </li>
                        <li>
                            کاربران و مشتریان محترم وب سایت <g:message
                                    code="name"/> می توانند کلیه سؤالات، نظرات، انتقادات و پیشنهادات خویش را از طریق وب سایت، ایمیل یا تلفن انتقال نمایند. همکاران این مجموعه تلاش می کنند در اسرع زمان ممکن برای آنان، نسبت به پاسخگویی به مشتریان خود اقدام کرده و آسایش و رضایت خاطر آنان را تأمین نمایند.
                        </li>
                    </ul>
                </li>
            </ul>

        </div>
    </div>
</div>
</body>
</html>
