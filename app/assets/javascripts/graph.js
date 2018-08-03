//Google Charts API

// Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.arrayToDataTable([
          ['Bill', 'In Favour', 'Against'],
          ['Bill 1', 1000, 400],
          ['Bill 2', 1170, 460],
          ['Bill 3', 660, 1120],
          ['Bill 4', 1030, 540]
        ]);

        // Set chart options
        var options = {'title':'Results Of The Vote',
                       'width':500,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.ColumnChart(document.getElementById('tab-results'));
        chart.draw(data, options);
      }