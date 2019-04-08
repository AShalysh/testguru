document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.sort-by-title');
  if (control) { control.addEventListener('click', sortRowsByTitle) };
})

function sortRowsByTitle() {
  var table = document.querySelector('table');
  //to select all rows from table.
  //it will return NodeList https://developer.mozilla.org/en-US/docs/Web/API/NodeList
  var rows = table.querySelectorAll('tr');
  var sortedRows = [];
  //selecting all rows from table except the header row
  for (var i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i]);
  }
  //var arrowUp = this.querySelector('.octicon-arrow-up')

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc);
    this.querySelector('.octicon-arrow-up').classList.remove('hide');
    this.querySelector('.octicon-arrow-down').classList.add('hide');
  } else {
    sortedRows.sort(compareRowsDesc);
    this.querySelector('.octicon-arrow-down').classList.remove('hide');
    this.querySelector('.octicon-arrow-up').classList.add('hide');
  }

  //create a table only in memory
  var sortedTable = document.createElement('table');
  //to add css class .table
  sortedTable.classList.add('table','table-bordered','mt-3');
  sortedTable.appendChild(rows[0]);

  for (var i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i]);
  }

  table.parentNode.replaceChild(sortedTable, table);
}
//compare rows
function compareRowsAsc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent;
  var testTitle2 = row2.querySelector('td').textContent;

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0;
}

function compareRowsDesc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent;
  var testTitle2 = row2.querySelector('td').textContent;

  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0;
}