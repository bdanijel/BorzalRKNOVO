$.ajax({
    //url: 'https://cdn.rawgit.com/highcharts/highcharts/v6.0.4/samples/data/world-population-history.csv',
    success: function () {

        var jsondata = {

            "data": [{
                "value": "27",
                "code": "in",
                "name": "india",
                "last_five_month": [{
                    "month": "Jan",
                    "vcount": "30"
                },
                  {
                      "month": "Feb",
                      "vcount": "80"
                  },
                  {
                      "month": "Mar",
                      "vcount": "50"
                  }
                ]
            },
              {
                  "value": "1",
                  "code": "ie",
                  "name": "ireland",
                  "last_five_month": [{
                      "month": "Jan",
                      "vcount": "70"
                  },
                    {
                        "month": "Feb",
                        "vcount": "10"
                    },
                    {
                        "month": "Mar",
                        "vcount": "30"
                    }
                  ]
              },
              {
                  "value": "2088",
                  "code": "us",
                  "name": "united states",
                  "last_five_month": [{
                      "month": "Jan",
                      "vcount": "90"
                  },
                    {
                        "month": "Feb",
                        "vcount": "20"
                    },
                    {
                        "month": "Mar",
                        "vcount": "40"
                    }
                  ]
              },
              {
                  "value": "65778",
                  "code": "ca",
                  "name": "canada",
                  "last_five_month": [{
                      "month": "Jan",
                      "vcount": "20"
                  },
                    {
                        "month": "Feb",
                        "vcount": "10"
                    },
                    {
                        "month": "Mar",
                        "vcount": "60"
                    }
                  ]
              }
            ]
        }

        var mapChart;
        var countryChart;

        /* var data = [];
          var graphdata = [];
    
         $.each(jsondata.data, function(i, item) {
             $.each(item.last_five_month, function(x,item2) {
    
                 var graphval = [];
                 var last_five_month_array = [];
    
                 var month = item2.month;
                 var vcount = item2.vcount;
    
                 last_five_month_array.push(month);
                 last_five_month_array.push(vcount);
    
                 graphdata.push(last_five_month_array);
    
          });
        });
         console.log(graphdata);
         return false;*/

        var graphdata = [];
        var graphdataf = [];
        var month;
        var valuecount;
        var countries = {};

        /*$.each(jsondata.data, function (i, item) {
           var code = item.code;
        });
        return false;*/

        $.each(jsondata.data, function (i, item) {

            var graphval = [];

            var value = item.value;
            var code = item.code;
            var name = item.name;

            graphval.push(code);
            graphval.push(value);
            graphdata.push(graphval);

            $.each(item.last_five_month, function (j, itemval) {

                /*var graphvaldata = [];
                valuecount = itemval.vcount;
                month = itemval.month;
        
                graphvaldata.push(valuecount);
                graphvaldata.push(month);
        
                graphdataf.push(graphvaldata);*/

            });
            countries[item.code] = {
                name: item.name,
                code3: item.code,
                data: item.last_five_month
            };
        });

        var data = [];

        for (var code3 in countries) {
            if (countries.hasOwnProperty(code3)) {
                $.each(countries[code3].data, function (j, itemval) {
                    //var graphvaldata = [];
                    var value = itemval.vcount;
                    var month = itemval.month;

                    //graphvaldata.push(valuecount);
                    //graphvaldata.push(month);
                    //graphdataf.push(graphvaldata);

                    //var value = null,
                    //mon,
                    //itemData = countries[code3].data,
                    //i = itemData.length;

                    /*while (i--) {
                        //if (typeof itemData[i] === 'number') {
                            value = itemData[i];
                            month = categories[i];
                            break;
                        //}
                    }*/

                    data.push({
                        name: countries[code3].name,
                        code3: code3,
                        value: value,
                        year: month
                    });
                });
            }

        }
        // Wrap point.select to get to the total selected points
        Highcharts.wrap(Highcharts.Point.prototype, 'select', function (proceed) {
            proceed.apply(this, Array.prototype.slice.call(arguments, 1));
            var points = mapChart.getSelectedPoints();
            if (points.length) {
                if (points.length === 1) {
                    $('#flag').attr('class', 'flag ' + points[0].flag);
                    $('h2').html(points[0].name);
                } else {
                    $('#flag').attr('class', 'flag');
                    $('h2').html('Comparing countries');

                }
                $('.subheader').html('<h4>Historical population</h4><small><em>Shift + Click on map to compare countries</em></small>');

                if (!countryChart) {
                    countryChart = Highcharts.chart('country-chart', {
                        chart: {
                            height: 250,
                            spacingLeft: 0
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
                            crosshair: true
                        },
                        yAxis: {
                            title: null,
                            opposite: true
                        },
                        tooltip: {
                            split: true
                        },
                        plotOptions: {
                            series: {
                                animation: {
                                    duration: 500
                                },
                                marker: {
                                    enabled: false
                                }
                                //threshold: 0
                                //pointStart: categories
                            }
                        }
                    });
                }


                $.each(points, function (i, point) {


                    var data,
          	dataRaw = countries[point['hc-key']].data;

                    if (dataRaw) {
                        data = dataRaw.map((p) => parseInt(p.vcount));
                    }

                    // Update
                    if (countryChart.series[i]) {
                        /*$.each(countries[this.code3].data, function (pointI, value) {
                            countryChart.series[i].points[pointI].update(value, false);
                        });*/
                        countryChart.series[i].update({
                            name: this.name,
                            data: data,
                            type: points.length > 1 ? 'line' : 'area'
                        }, false);
                    } else {
                        countryChart.addSeries({
                            name: this.name,
                            data: data,
                            type: points.length > 1 ? 'line' : 'area'
                        }, false);
                    }
                });
                while (countryChart.series.length > points.length) {
                    countryChart.series[countryChart.series.length - 1].remove(false);
                }
                countryChart.redraw();

            } else {
                $('#info #flag').attr('class', '');
                $('#info h2').html('');
                $('#info .subheader').html('');
                if (countryChart) {
                    countryChart = countryChart.destroy();
                }
            }
        });
        // Initiate the map chart
        mapChart = Highcharts.mapChart('container', {

            title: {
                text: 'Population history by country'
            },

            subtitle: {
                text: 'Source: <a href="http://data.worldbank.org/indicator/SP.POP.TOTL/countries/1W?display=default">The World Bank</a>'
            },
            /*mapNavigation: {
                enabled: true,
                buttonOptions: {
                    verticalAlign: 'left'
                }
            },*/

            legend: {
                layout: 'vertical',
                align: 'left',
                verticalAlign: 'bootom',
                floating: true,
                backgroundColor: '#FFFFFF'
            },
            colorAxis: {
                type: 'logarithmic',
                endOnTick: false,
                startOnTick: false,
                min: 50000
            },

            tooltip: {
                footerFormat: '<span style="font-size: 10px">(Click for details)</span>'
            },
            credits: {
                enabled: false
            },


            /*data: graphdata,
            mapData: Highcharts.maps['custom/world'],
            joinBy: 'hc-key',
            allAreas: true,
            name: 'Random data',*/

            series: [{
                data: graphdata,
                mapData: Highcharts.maps['custom/world'],
                joinBy: 'hc-key',
                name: 'Total Play',
                allowPointSelect: true,
                cursor: 'pointer',
                states: {
                    select: {
                        color: '#a4edba',
                        borderColor: 'black',
                        dashStyle: 'shortdot'
                    }
                }
            }]
        });
    }
});
