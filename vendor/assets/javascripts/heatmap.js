const cal = new CalHeatMap();
const now = new Date();
const yearSelect = document.getElementById('year-select')

const response = fetch('/api/v1/user/period', {
  method: 'GET',
  headers: {
    'Content-Type': 'application/json',
  },
}).then(response => {
  return response.json();
}).then(jsonData => {
  console.log(jsonData);
  submitYear = jsonData['submit'];

  const addOption = document.createElement('option');
  addOption.setAttribute('value', submitYear);
  addOption.setAttribute('selected', 'selected');
  addOption.innerHTML = submitYear;
  yearSelect.appendChild(addOption);

  for (let i = 1; i < jsonData['range']; i++) {
    const addOption = document.createElement('option');
    addOption.setAttribute('value', submitYear + i);
    addOption.innerHTML = submitYear + i;
    yearSelect.appendChild(addOption);
  }
  return jsonData
}).catch(err => {
  console.error(err);
});


/**
 * calheatmapの設定
 **/

$('#year-select').change(() => {
  fetch(`/api/v1/heatmap/data/${yearSelect.value}`, {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
    },
  }).then(response => {
    return response.json();
  }).then(jsonData => {
    console.log(jsonData);
    cal.update(jsonData, false, cal.RESET_ALL_ON_UPDATE)
  }).catch(err => {
    console.error(err);
  });
});

cal.init({
  itemSelector: '#cal-heatmap',
  domain: 'month',
  data: `/api/v1/heatmap/data/${now.getFullYear()}`,
  subdomain: 'day',
  start: new Date(now.getFullYear(), 1, 0),
  displayLegend: false
});
