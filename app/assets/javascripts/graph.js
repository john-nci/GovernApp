var Graph = function(selector, data, kind) {
  // jquery selector
  this.selector = selector;
  // Takes the data
  this.data = data;
  // Will allow me to later define a method which will determine what kind of chart I'll use from the Google chart lib
  this.kind = kind;
};

Graph.prototype.getData = function() {
  var _this = this;
  var dataWithCaptions = this.data.data.map(function(element, index, array) {
    return [ _this.data.x_axis.series[index], element ];
  });

  return google.visualization.arrayToDataTable([
    [ this.data.x_axis.legend, this.data.y_axis.legend ],
  ].concat(dataWithCaptions));
};

Graph.prototype.render = function() {
    // Set chart options
    var options = {'title': this.data.title,
                   'width':400,
                   'height':300};

    // Instantiate and draw our chart, passing in some options.
    var chart = new google.visualization.PieChart($(this.selector)[0]);
    chart.draw(this.getData(), options);
  };
    
Graph.instances = [];