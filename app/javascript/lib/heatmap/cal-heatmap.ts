export class CalHeatmap {
  readonly cal;

  constructor() {
    const now = new Date();
    this.cal = new CalHeatMap();
    this.cal.init({
      itemSelector: '#cal-heatmap',
      domain: 'month',
      data: `/api/v1/heatmap/data/${now.getFullYear()}`,
      subdomain: 'day',
      start: new Date(now.getFullYear(), 1, 0),
      domainLabelFormat: '%Y-%m',
      displayLegend: false
    });
  }
}
