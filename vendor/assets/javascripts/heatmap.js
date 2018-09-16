let cal = new CalHeatMap();
cal.init({
  domain: 'month',
  data: "/api/v1/heatmap/index",
  subdomain: 'day',
  start: new Date(2018, 1, 0),
  displayLegend: false
});
