const cal = new CalHeatMap();
const now = new Date();
cal.init({
  domain: 'month',
  data: "/api/v1/heatmap/index",
  subdomain: 'day',
  start: new Date(now.getFullYear(), 1, 0),
  displayLegend: false
});
