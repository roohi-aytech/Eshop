<%--
  Created by IntelliJ IDEA.
  User: Farzin
  Date: 6/29/13
  Time: 5:51 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="grails.converters.JSON" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <g:javascript plugin="jquery" src="jquery/jquery-1.7.2.min.js"></g:javascript>
    <g:javascript src="highcharts/highcharts.js"/>
    <g:javascript src="date-conversion.js"/>
    <script language="javascript" type="text/javascript">
        function addCommas(nStr) {
            nStr = nStr.replace(/\,/g, '');
            nStr += '';
            var x = nStr.split('.');
            var x1 = x[0];
            var x2 = x.length > 1 ? '.' + x[1] : '';
            var rgx = /(\d+)(\d{3})/;
            while (rgx.test(x1)) {
                x1 = x1.replace(rgx, '$1' + ',' + '$2');
            }
            return x1 + x2;
        }

        var options = {
            chart: {
                renderTo: 'container',
                zoomType: 'x',
                spacingRight: 20
            },
            title: {
                text: ''
            },
            subtitle: {
                text: document.ontouchstart === undefined ?
                        '' :
                        ''
            },
            exporting: {
                enabled: false
            },
            xAxis: {
                type: 'datetime',
                maxZoom: 14 * 24 * 3600000, // fourteen days
                labels: {
                    formatter: function () {
                        var date = new Date(this.value);
                        return ConvertDateMiladiToShamsi(date.getFullYear(), (date.getMonth() + 1), date.getDate());
                    }
                },
                title: {
                    text: null
                }
            },
            yAxis: {
                title: {
                    text: ''
                },
                startOnTick: true,
                showFirstLabel: true
            },
            tooltip: {
                shared: true,
                useHTML: true,
                style: {
                    fontFamily: 'Tahoma',
                    fontSize: '11px',
                    direction: 'ltr',
                    width: '200px'
                },
                formatter: function () {
                    var date = new Date(this.x);
                    var result = "" + ConvertDateMiladiToShamsi(date.getFullYear(), (date.getMonth() + 1), date.getDate()) + "<br/>";
                    for (var i = 0; i < this.points.length; i++) {
                        result += "<div dir='rtl' style='text-align:right;'>";
                        result += //this.points[i].series.name +
                                "<b>" + addCommas(this.points[i].y.toString()) + "</b><div>";
                    }
                    return result;
                }
            },
            legend: {
                enabled: false,
                rtl: true,
                itemStyle: {
                    fontFamily: 'Tahoma',
                    fontSize: '11px'
                }

            },

            plotOptions: {
                line: {
                    lineWidth: 2,
                    marker: {
                        enabled: false,
                        states: {
                            hover: {
                                enabled: true,
                                radius: 5
                            }
                        }
                    },
                    shadow: false,
                    states: {
                        hover: {
                            lineWidth: 2
                        }
                    }
                }
            }
        };

        $(document).ready(function () {

            options.series = new Array();
            var serie = new Object();
            serie.name = '${message(code:'price')}';
            var data = ${priceList.collect {["${it.startDate.getAt(Calendar.YEAR)},${it.startDate.getAt(Calendar.MONTH)},${it.startDate.getAt(Calendar.DAY_OF_MONTH)}", it.rialPrice.toInteger()]} as JSON};
            serie.data = new Array();
            for (var i = 0; i < data.length; i++) {
                var dateParts = data[i][0].split(',');
                serie.data[serie.data.length] = [Date.UTC(parseInt(dateParts[0]), parseInt(dateParts[1]), parseInt(dateParts[2])), data[i][1]]
            }
            options.series[options.series.length] = serie;
            var chart = new Highcharts.Chart(options);
        });
    </script>
</head>

<body dir="rtl">
<div>
    <h2><g:message code="productModel.priceHistogram"/> ${productModel.toString()}</h2>

    <div id="container" style="height: 250px">
    </div>

    <div id="legendContainer">
    </div>
    <br/><br/>
</div>
</body>
</html>