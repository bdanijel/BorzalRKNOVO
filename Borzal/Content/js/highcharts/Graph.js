var colors = ['#1976D2', '#9575CD', '#673AB7', '#D6DAE0', '#EC407A'];
var Sabac = "Шабац",
    Beograd = "Београд",
    Zajecar = "Зајечар",
    Leskovac = "Лесковац",
    Kraljevo = "Краљево",
    Nis = "Ниш",
    Valjevo = "Ваљево",
    Smederevo = "Смедерево",
    Uzice = "Ужице",
    Kragujevac = "Крагујевац",
    NoviPazar = "Нови Пазар",
    Zrenjanin = "Зрењанин",
    NoviSad = "Нови Сад",
    Pancevo = "Панчево",
    SremskaMitrovica = "Сремска Митровица",
    Subotica = "Суботица";
var kategorije = [Sabac, Beograd, Zajecar, Leskovac, Kraljevo, Nis, Valjevo, Smederevo, Uzice, Kragujevac, NoviPazar, Zrenjanin, NoviSad, Pancevo, SremskaMitrovica, Subotica]
var JSONData = $.parseJSON($("#txtJSON_BrojIzvestajaPoDanima").val());
var JSONDatum = new Array();
var JSONPodOd2 = new Array();
var MatrixData = [];
$.map(JSONData, function (obj, i) {
    JSONDatum.push([obj.Datum])
    JSONSabac = [parseInt(obj['Шабац'])]
    JSONPodOd2 = [parseInt(obj['Шабац']), parseInt(obj['Београд']), parseInt(obj['Зајечар']), parseInt(obj['Лесковац']), parseInt(obj['Краљево']),
        parseInt(obj['Ниш']), parseInt(obj['Ваљево']), parseInt(obj['Смедерево']), parseInt(obj['Ужице']), parseInt(obj['Крагујевац']), parseInt(obj['Нови Пазар']),
        parseInt(obj['Зрењанин']), parseInt(obj['Нови Сад']), parseInt(obj['Панчево']), parseInt(obj['Сремска Митровица']), parseInt(obj['Суботица'])];    
    var x = kategorije.length
    for (z = 0; z < JSONPodOd2.length; ++z) {
        MatrixData.push([z, i, JSONPodOd2[z]]);
    }
});
Highcharts.chart('GraphBrojIzvestajaPoDanima', {
    chart: {
        type: 'heatmap',
        marginBottom: 90,
        plotBorderWidth: 1,
        height: 1600
    },
    title: {
        text: 'Број попуњених извештаја по данима'
    },
    xAxis: [{
        categories: kategorije,
        opposite: true,
        offset: 30,
        tickPosition: 'inside',
        lineWidth: 1,
        labels: {
            style: {
                fontWeight: "bold"
            }
        }
    }, {
        linkedTo: 0,
        opposite: true,
        tickLength: 7,
        offset: -1,
        labels: {
            style: {
                fontWeight: "bold"
            },
            formatter: function () {
                var chart = this.chart,
                    each = Highcharts.each,
                    series = chart.series[0],
                    sum = 0,
                    x = this.value;

                each(series.options.data, function (p, i) {
                    if (p[0] === x)
                        sum += p[2];
                });

                return sum;
            }
        }
    }],
    yAxis: [{
        categories: JSONDatum,
        reversed: true,
        title: null
    }, {
        linkedTo: 0,
        opposite: true,
        tickLength: 0,
        lineWidth: 1,
        labels: {
            style: {
                fontWeight: 'bold'
            },
            formatter: function () {
                var chart = this.chart,
                    each = Highcharts.each,
                    series = chart.series[0],
                    sum = 0,
                    x = this.value;
                each(series.options.data, function (p, i) {
                    if (p[1] === x)
                        sum += p[2];
                });

                return sum;
            }
        },
        title: null
    }],
    colorAxis: {
        min: 0,
        stops: [
          [0, '#FFFFFF'],
          [0.15, '#CE93D8'],
          [0.25, '#81D4FA'],
          [0.35, '#4FC3F7'],
          [0.45, '#29B6F6'],
          [0.55, '#8BC34A'],
          [0.65, '#8BC34A'],
          [1.00, '#FFEB3B']
        ]
    },
    legend: {
        align: 'right',
        layout: 'vertical',
        margin: 20,
        verticalAlign: 'top',
        y: 92,
        symbolHeight: 1400
    },
    tooltip: {
        formatter: function () {
            return '<b>' + this.series.xAxis.categories[this.point.x] + '</b><br />Број извештаја: <b>' +
                this.point.value + '</b><br><b>' + this.series.yAxis.categories[this.point.y] + '</b>';
        }
    },
    credits: {
        enabled: false
    },
    series: [{
        borderWidth: 0.2,
        borderColor: '#D6DAE0',
        data: MatrixData,
        turboThreshold: 0,
        dataLabels: {
            enabled: true,
            color: '#333333',
            style: {
                textOutline: false,
                fontSize: '12px'
            }
        }
    }]
});
