/// High Charts
function getData(targets) {
  var results = [];
  var dates = [];

  $.getJSON("/charts.json", function(data) {
      results = $.map(data.results, function(val, i) {
          return val.close / 100;
      });

      dates = $.map(data.results, function(val, i) {
          return val.tradingDay;
      });

      createChart(targets, results, dates);
  });
}

function margin(number) {
  return parseFloat($('#margin' + number).val());
}

function target(number) {
  var result = breakeven() - basis() + margin(number);
  targetElement(number).text('$' + result.toFixed(2));

  return result;
}

function breakeven() {
  var result = cost() / yield();
  $('span#baselinecalcvalue').text('$' + result.toFixed(2));

  return result;
}

function basis() {
  return parseFloat($('#basis').val());
}

function cost() {
  return parseFloat($('#cost').val());
}

function yield() {
  return parseFloat($('#yield').val());
}

function plotBand(number, dates) {
  return {
      from: plotBandFrom(number, dates),
      to: plotBandTo(number, dates),
      color: 'rgba(137, 140, 143, .2)'
  }
}

function plotBandFrom(number, dates) {
  var plotBandFrom = -1;

  $.each(dates, function(index, value) {
      if (plotBandFrom !== -1)
          return;

      if (moment(value).isSame(targetDate(number)) || moment(value).isAfter(targetDate(number))) {
          plotBandFrom = dates.indexOf(value);
      }
  });

  return plotBandFrom;
}

function plotBandTo(number, dates) {
  var plotBandTo = -1;
  var toDate = moment(targetDate(number)).add(7, 'days');

  $.each(dates, function(index, value) {
      if (plotBandTo !== -1)
          return;

      if (moment(value).isSame(toDate) || moment(value).isAfter(toDate)) {
          plotBandTo = dates.indexOf(value);
      }
  });

  return plotBandTo;
}

function plotBands(dates) {
  var plotBands = [];
	var numbers = [1, 2, 3, 4];

	$.each(numbers, function(index, value) {
		if (plotBandFrom(value, dates) != -1)
				plotBands.push(plotBand(value, dates));
	});

  return plotBands;
}

function targetDate(number) {
  return targetDateElement(number).val();
}

function targetDateElement(number) {
  return $('#targetdate' + number);
}


function targetElement(number) {
  return $('#target' + number);
}

function createChart(targets, results, dates) {
	var newTargets = $.each(targets, function(index, value) {
		return value.toFixed(2);
  });

  lastResultAvailableDate = dates[dates.length - 1];
  lastDate = dates[dates.length - 1];

  endDate = '2015-10-22';

  while(moment(lastDate).isBefore(endDate)) {
    newDate = moment(lastDate).add(1, 'day');
    dates.push(newDate.format('YYYY-MM-DD'));

    lastDate = dates[dates.length - 1];
  }

  $('#hscontainer').highcharts({
      title: {
          text: "Example - 2015 Corn Marketing Plan",
          style: {
                fontWeight: 'bold'
            }
      },
      chart: {
          type: 'spline'
      },
      colors: ['#EB0505', '#EB0505', '#EB0505'],

      xAxis: {
          type: 'datetime',
          day: '%e. %b',
          categories: dates,
          plotBands: plotBands(dates),
          tickInterval: 10,
          max: dates.length - 1
      },
      yAxis: {
          type: 'logarithmic',
          labels: {
            format: '${value:.2f}'
          },
          max: Math.max.apply(null, newTargets) || 10,
          plotLines: [{
              color: '#81C784',
              width: 2,
              value: newTargets[0] || 0,
              label: {
                  text: 'Target #1 - $' + newTargets[0].toFixed(2), // Content of the label.
                  align: 'left', // Positioning of the label.
              }
          }, {
              color: '#4CAF50',
              width: 2,
              value: newTargets[1] || 0,
              label: {
                  text: 'Target #2 - $' + newTargets[1].toFixed(2), // Content of the label.
                  align: 'left', // Positioning of the label.
              }
          }, {
              color: '#388E3C',
              width: 2,
              value: newTargets[2] || 0,
              label: {
                  text: 'Target #3 - $' + newTargets[2].toFixed(2), // Content of the label.
                  align: 'left', // Positioning of the label.
              }
          }, {
              color: '#1B5E20',
              width: 2,
              value: newTargets[3] || 0,
              label: {
                  text: 'Target #4 - $' + newTargets[3].toFixed(2), // Content of the label.
                  align: 'left', // Positioning of the label.
              }
          }]
      },
      tooltip: {
          shared: true,
          valueDecimals: 2,
          valuePrefix: '$',
          
      },
      credits: {
          enabled: false
      },
      plotOptions: {
          areaspline: {
              fillOpacity: 0.5
          }
      },
      series: [{
          showInLegend: false,
          data: results
      }]
  });
}

$(document).ready(function() {
  $(".mycalc").change(function() {
      getData([target(1), target(2), target(3), target(4)]);
  });

  getData([target(1), target(2), target(3), target(4)]);
});
