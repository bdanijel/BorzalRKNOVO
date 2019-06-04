function JSONtoArray(text) {
    return text.replace(/^"/, '')
        .replace(/",$/, '')
}
$(function () {
    var JSONVELFIData = $.parseJSON($("#txtJSON_VELFI").val());
    var JSONData = $.parseJSON($("#txtJSON_BrojLJ").val());
    var JSONVELFI = [];
    var PodOd2ID = [];
    var name = [];
    var data = [];
    var value;
    console.log(JSONData);
    $.map(JSONVELFIData, function (obj, i) {
        JSONVELFI.push([obj.nVfi])
    });
    $.map(JSONData, function (obj, i) {
        obj.data = JSON.parse(JSONtoArray(obj.data));
        data.push([obj.data]);
        name.push([obj.name]);
    });
    //var colors = ["#00ACC1, #9575CD, #1976D2, #FF8A65, #F06292, #1565C0, #9C27B0, #00BCD4, #EC407A, #FF7043"];
    var colors = Highcharts.getOptions().colors;
    Highcharts.chart('ChartContainer', {
        chart: {
            type: 'streamgraph',
            marginBottom: 30,
            zoomType: 'x',
            height: 500
        },
        credits: {
            enabled: false
        },
        // Make sure connected countries have similar colors
        colors: [
            colors[0],
            colors[1],
            colors[2],
            colors[3],
            colors[4],
            
            Highcharts.color(colors[5]).brighten(0.2).get(),
            Highcharts.color(colors[5]).brighten(0.1).get(),

            colors[5],
            colors[6],
            colors[7],
            colors[8],
            colors[9],
            colors[0],
            colors[1],
            colors[3],
           
            Highcharts.color(colors[2]).brighten(-0.1).get(),
            Highcharts.color(colors[2]).brighten(-0.2).get(),
            Highcharts.color(colors[2]).brighten(-0.3).get()
        ],

        title: {
            floating: true,
            align: 'left',
            text: null
        },
        subtitle: {
            text: null
        },
        tooltip: {
            shared: true,
            //backgroundColor: {
            //    linearGradient: [0, 0, 0, 60],
            //    stops: [
            //        [0, '#FFFFFF'],
            //        [1, '#E0E0E0']
            //    ]
            //},
            borderWidth: 1,
            borderColor: '#CFD8DC'
        },
        xAxis: {
            maxPadding: 0,
            type: 'category',
            crosshair: true,
            categories: JSONVELFI,
            labels: {
                align: 'center',
                reserveSpace: false
            },
            tickWidth: 0,
            style: {
                stroke: 'transparent'
            },
            lineWidth: 0,
            borderWidth: 0,
            minorGridLineWidth: 0,
            lineColor: 'transparent'
        },
        yAxis: {
            visible: false,
            startOnTick: false,
            endOnTick: false
        },

        legend: {
            enabled: true,
            floating: true,
            useHTML: true,
            layout: 'vertical',
            align: 'left',
            verticalAlign: 'top',
            symbolRadius: 0, //for changing to square 
            padding: 3,
            itemMarginTop: 5,
            itemMarginBottom: 5
        },

        //annotations: [{
        //    labels: [{
        //        point: {
        //            x: 5.5,
        //            xAxis: 0,
        //            y: 30,
        //            yAxis: 0
        //        },
        //        text: 'Нема података за правну форму'
        //    }, {
        //        point: {
        //            x: 10,
        //            xAxis: 0,
        //            y: 90,
        //            yAxis: 0
        //        },
        //        text: 'Нема података за правну форму'
        //    }],
        //    credits: {
        //        enabled: false
        //    },
        //    labelOptions: {
        //        backgroundColor: 'rgba(255,255,255,0.5)',
        //        borderColor: 'silver'
        //    }
        //}],

        plotOptions: {
            series: {
                label: {
                    minFontSize: 10,
                    maxFontSize: 15,
                    style: {
                        color: 'rgba(255,255,255,0.75)'
                    },
                    dataLabels: {
                        enabled: true,
                        format: '<b>{series.name}</b><br/>{x}: <b>{y}</b>',
                        borderRadius: 0,
                        backgroundColor: 'rgba(255,255,255,0.5)',
                        borderWidth: 1,
                        borderColor: 'silver',
                        y: -6
                    }
                }
            }
        },
        // Data parsed with olympic-medals.node.js
        series: JSONData,
        exporting: {
            sourceWidth: 800,
            sourceHeight: 600
        }
    });
});