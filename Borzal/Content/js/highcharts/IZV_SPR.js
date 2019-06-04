function JSONtoArray(text) {
    return text.replace(/^"/, '')
        .replace(/",$/, '')
}
$(function () {
    var JSONPFData = $.parseJSON($("#txtJSON_PF").val());
    var JSONData = $.parseJSON($("#txtJSON_BrojLJ").val());
    var JSONPF = [];
    var PodOd2ID = [];
    var NPodOd2 = [];
    var Podaci = [];
    var data = [];
    var value;

    $.map(JSONData, function (obj, i) {
        obj.Rezultat = JSON.parse(JSONtoArray(obj.Rezultat));
        Podaci.push([obj.Rezultat]);
        PodOd2ID.push([obj.PodOd2ID]);
        NPodOd2.push([obj.NPodOd2]);
    });
    $.map(JSONPFData, function (obj, i) {
        JSONPF.push([obj.nPF])
    });
    var mapChart,
      POChart,
      categories = JSONPF;
    var mapData = Highcharts.geojson(PO);

    $.each(mapData, function () {
        name = this.properties['NPodOd2'];
        this.name = name;
        id = this.properties['PodOd2ID'];
        this.id = id;
    });

    Highcharts.wrap(Highcharts.Point.prototype, 'select', function (proceed) {
        proceed.apply(this, Array.prototype.slice.call(arguments, 1));
        var points = mapChart.getSelectedPoints();
        if (points.length) {
            if (points.length === 1) {
                $('#info h6').html(points[0].name);
            } else {
                $('#info h6').html('Поређење по подручним одељењима');
            }
            $('#info .text-slate').html('<small><em>Shift + Click на мапи за поређење по подручним одељењима</em></small>');
            if (!POChart) {
                POChart = $('#POChart').highcharts({
                    chart: {
                        marginTop: 40
                    },
                    credits: {
                        enabled: false
                    },
                    title: {
                        text: null
                    },
                    subtitle: {
                        text: null
                    },
                    xAxis: {
                        tickPixelInterval: 50,
                        crosshair: true,
                        categories: categories,
                        labels: {
                            rotation: -90
                        }
                    },
                    yAxis: {
                        title: null,
                        opposite: true,
                        min: 0,
                        max: 1500
                    },
                    tooltip: {
                        shared: true
                    },
                    plotOptions: {
                        series: {
                            threshold: 0,
                            dataLabels: {
                                enabled: true
                            }
                        },
                        areaspline: {
                            fillOpacity: 0.5
                        }
                    }
                }).highcharts();
            }
            $.each(points, function (i) {
                if (POChart.series[i]) {
                    POChart.series[i].update({
                        name: this.name,
                        data: this.Rezultat,
                        type: points.length > 1 ? 'areaspline' : 'areaspline'
                    }, false);
                } else {
                    POChart.addSeries({
                        name: this.name,
                        data: this.Rezultat,
                        type: points.length > 1 ? 'areaspline' : 'areaspline'
                    }, false);
                }
            });
            while (POChart.series.length > points.length) {
                POChart.series[POChart.series.length - 1].remove(false);
            }
            POChart.redraw();
        } else {
            $('#info h6').html('');
            $('#info .subheader').html('');
            if (POChart) {
                POChart = POChart.destroy();
            }
        }
    });
    mapChart = $('#mapContainer').highcharts('Map', {
        mapNavigation: {
            enabled: true,
            buttonOptions: {
                verticalAlign: 'bottom'
            }
        },
        chart: {
            height: 450
        },
        credits: {
            enabled: false
        },
        title: {
            text: null
        },
        subtitle: {
            text: null
        },
        colorAxis: {
            min: 0,
            stops: [
              [0, '#F3E5F5'],
              //[0.15, '#CE93D8'],
              //[0.25, '#81D4FA'],
              //[0.35, '#4FC3F7'],
              //[0.45, '#29B6F6'],
              //[0.55, '#8BC34A'],
              //[0.65, '#8BC34A'],
              [1.00, '#6200EA']
            ]
        },
        series: [{
            name: "Подручно одељење: ",
            data: JSONData,
            mapData: mapData,
            joinBy: ['PodOd2ID', 'PodOd2ID'],
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                formatter: function () {
                    return this.point.properties['NPodOd2'];
                },
                style: {
                    fontSize: '10px'
                }
            }
        }]
    }).highcharts();
    // Default selection - Beograd
    mapChart.get('71').select();
});