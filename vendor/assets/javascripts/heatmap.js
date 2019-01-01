const cal = new CalHeatMap();
const now = new Date();
// const yearSelect = document.getElementById('year-select')

cal.init({
  itemSelector: '#cal-heatmap',
  domain: 'month',
  data: `/api/v1/heatmap/data/${now.getFullYear()}`,
  subdomain: 'day',
  start: new Date(now.getFullYear(), 1, 0),
  domainLabelFormat: '%Y-%m',
  displayLegend: false
});

/*
const response = fetch('/api/v1/user/period', {
  method: 'GET',
  headers: {
    'Content-Type': 'application/json',
  },
}).then(response => {
  return response.json();
}).then(jsonData => {
  console.log(jsonData);
  nowYear = jsonData['now'];
  submitYear = jsonData['submit'];

  const addOption = document.createElement('option');
  addOption.setAttribute('value', nowYear);
  addOption.setAttribute('selected', 'selected');
  addOption.innerHTML = nowYear;
  yearSelect.appendChild(addOption);

  for (let i = jsonData['range']; i > 0; i--) {
    const addOption = document.createElement('option');
    addOption.setAttribute('value', nowYear - i);
    addOption.innerHTML = nowYear - i;
    yearSelect.appendChild(addOption);
  }

  cal.init({
    itemSelector: '#cal-heatmap',
    domain: 'month',
    // data: `/api/v1/heatmap/data/${nowYear}`,
    data: `/api/v1/heatmap/data/2018`,
    subdomain: 'day',
    start: new Date(2018, 1, 0),
    domainLabelFormat: '%Y-%m',
    displayLegend: false
  });

  return jsonData
}).catch(err => {
  console.error(err);
});
*/

/**
 * calheatmapの更新
 **/
/*
$('#year-select').change(() => {
  // console.log(yearSelect.value)
  fetch(`/api/v1/heatmap/data/${yearSelect.value}`, {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
    },
  }).then(response => {
    return response.json();
  }).then(jsonData => {
    console.log(jsonData);
    cal.update(jsonData, true, cal.RESET_ALL_ON_UPDATE);
    // cal.update(jsonData);
    // console.log(cal);
  }).catch(err => {
    console.error(err);
  });
});
*/
