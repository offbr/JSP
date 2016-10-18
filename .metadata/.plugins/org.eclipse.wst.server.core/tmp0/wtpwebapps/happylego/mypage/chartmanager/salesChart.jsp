<%@page import="java.util.ArrayList"%>
<%@page import="service.business.OrderDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processdao" class = "happy.mybatis.ProcessDao" />
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%
   ArrayList<OrderDto> list = processdao.salesChart();
   String sday = "";
   String eday = "";
   int price1 = 0, price2 =0, price3 = 0, price4 = 0, price5 = 0, price6 = 0;
   int price7 = 0 , price8 = 0, price9 = 0, price10 = 0, price11 = 0, price12 = 0;
   for(int i = 0; i < list.size(); i++){
      OrderDto dto = list.get(i);
      sday = dto.getO_sdate();
      eday = dto.getO_edate();
      sday = sday.substring(5, 7);
      if(eday.substring(5, 7).equals("01")){
         price1 += Integer.parseInt(dto.getP_price());
      }
      if(eday.substring(5, 7).equals("02")){
         price2 += Integer.parseInt(dto.getP_price());
      }
      if(eday.substring(5, 7).equals("03")){
         price3 += Integer.parseInt(dto.getP_price());
      }
      if(eday.substring(5, 7).equals("04")){
         price4 += Integer.parseInt(dto.getP_price());
      }
      if(eday.substring(5, 7).equals("05")){
         price5 += Integer.parseInt(dto.getP_price());
      }
      if(eday.substring(5, 7).equals("06")){
         price6 += Integer.parseInt(dto.getP_price());
      }
      if(eday.substring(5, 7).equals("07")){
         price7 += Integer.parseInt(dto.getP_price());
      }
      if(eday.substring(5, 7).equals("08")){
         price8 += Integer.parseInt(dto.getP_price());
      }
      if(eday.substring(5, 7).equals("09")){
         price9 += Integer.parseInt(dto.getP_price());
      }
      if(eday.substring(5, 7).equals("10")){
         price10 += Integer.parseInt(dto.getP_price());
      }
      if(eday.substring(5, 7).equals("11")){
         price11 += Integer.parseInt(dto.getP_price());
      }
      if(eday.substring(5, 7).equals("12")){
         price12 += Integer.parseInt(dto.getP_price());
      }   
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sales/month</title>
<style type="text/css">

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>         
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script type="text/javascript">

$(document).ready(function(){
   

   $('#container').highcharts({
        chart: {
            type: 'column',
            options3d: {
                enabled: true,
                alpha: 12,
                beta: 25,
                depth: 70
            }
        },
        title: {
            text: 'Total Sales / Month'
        },
        subtitle: {
            text: 'fuck you'
        },
        plotOptions: {
            column: {
                depth: 25
            }
        },
        xAxis: {
            categories: Highcharts.getOptions().lang.shortMonths
        },
        yAxis: {
            title: {
                text: null
            }
        },
        series: [{
            name: 'Sales',
            data: [<%= price1 %>, <%= price2%>, <%= price3 %>, <%= price4 %>, <%= price5 %>, <%= price6 %>, <%= price7 %>, <%= price8 %>, <%=price9%>, <%= price10 %>, <%= price11 %>, <%= price12 %>]
        }]
    });

})

    


/**
 * Dark theme for Highcharts JS
 * @author Torstein Honsi
 */

// Load the fonts
Highcharts.createElement('link', {
   href: 'https://fonts.googleapis.com/css?family=Unica+One',
   rel: 'stylesheet',
   type: 'text/css'
}, null, document.getElementsByTagName('head')[0]);

Highcharts.theme = {
   colors: ["#2b908f", "#90ee7e", "#f45b5b", "#7798BF", "#aaeeee", "#ff0066", "#eeaaee",
      "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
   chart: {
      backgroundColor: {
         linearGradient: { x1: 0, y1: 0, x2: 1, y2: 1 },
         stops: [
            [0, '#2a2a2b'],
            [1, '#3e3e40']
         ]
      },
      style: {
         fontFamily: "'Unica One', sans-serif"
      },
      plotBorderColor: '#606063'
   },
   title: {
      style: {
         color: '#E0E0E3',
         textTransform: 'uppercase',
         fontSize: '20px'
      }
   },
   subtitle: {
      style: {
         color: '#E0E0E3',
         textTransform: 'uppercase'
      }
   },
   xAxis: {
      gridLineColor: '#707073',
      labels: {
         style: {
            color: '#E0E0E3'
         }
      },
      lineColor: '#707073',
      minorGridLineColor: '#505053',
      tickColor: '#707073',
      title: {
         style: {
            color: '#A0A0A3'

         }
      }
   },
   yAxis: {
      gridLineColor: '#707073',
      labels: {
         style: {
            color: '#E0E0E3'
         }
      },
      lineColor: '#707073',
      minorGridLineColor: '#505053',
      tickColor: '#707073',
      tickWidth: 1,
      title: {
         style: {
            color: '#A0A0A3'
         }
      }
   },
   tooltip: {
      backgroundColor: 'rgba(0, 0, 0, 0.85)',
      style: {
         color: '#F0F0F0'
      }
   },
   plotOptions: {
      series: {
         dataLabels: {
            color: '#B0B0B3'
         },
         marker: {
            lineColor: '#333'
         }
      },
      boxplot: {
         fillColor: '#505053'
      },
      candlestick: {
         lineColor: 'white'
      },
      errorbar: {
         color: 'white'
      }
   },
   legend: {
      itemStyle: {
         color: '#E0E0E3'
      },
      itemHoverStyle: {
         color: '#FFF'
      },
      itemHiddenStyle: {
         color: '#606063'
      }
   },
   credits: {
      style: {
         color: '#666'
      }
   },
   labels: {
      style: {
         color: '#707073'
      }
   },

   drilldown: {
      activeAxisLabelStyle: {
         color: '#F0F0F3'
      },
      activeDataLabelStyle: {
         color: '#F0F0F3'
      }
   },

   navigation: {
      buttonOptions: {
         symbolStroke: '#DDDDDD',
         theme: {
            fill: '#505053'
         }
      }
   },

   // scroll charts
   rangeSelector: {
      buttonTheme: {
         fill: '#505053',
         stroke: '#000000',
         style: {
            color: '#CCC'
         },
         states: {
            hover: {
               fill: '#707073',
               stroke: '#000000',
               style: {
                  color: 'white'
               }
            },
            select: {
               fill: '#000003',
               stroke: '#000000',
               style: {
                  color: 'white'
               }
            }
         }
      },
      inputBoxBorderColor: '#505053',
      inputStyle: {
         backgroundColor: '#333',
         color: 'silver'
      },
      labelStyle: {
         color: 'silver'
      }
   },

   navigator: {
      handles: {
         backgroundColor: '#666',
         borderColor: '#AAA'
      },
      outlineColor: '#CCC',
      maskFill: 'rgba(255,255,255,0.1)',
      series: {
         color: '#7798BF',
         lineColor: '#A6C7ED'
      },
      xAxis: {
         gridLineColor: '#505053'
      }
   },

   scrollbar: {
      barBackgroundColor: '#808083',
      barBorderColor: '#808083',
      buttonArrowColor: '#CCC',
      buttonBackgroundColor: '#606063',
      buttonBorderColor: '#606063',
      rifleColor: '#FFF',
      trackBackgroundColor: '#404043',
      trackBorderColor: '#404043'
   },

   // special colors for some of the
   legendBackgroundColor: 'rgba(0, 0, 0, 0.5)',
   background2: '#505053',
   dataLabelsColor: '#B0B0B3',
   textColor: '#C0C0C0',
   contrastTextColor: '#F0F0F3',
   maskColor: 'rgba(255,255,255,0.3)'
};

// Apply the theme
Highcharts.setOptions(Highcharts.theme);
</script>
</head>
<body>
   <div id="container" style="height: 100%; width: 100%">Chart</div>

</html>