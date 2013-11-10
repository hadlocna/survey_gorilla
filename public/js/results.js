$(document).ready(function() {

  var margin = {top:20, right: 20, bottom: 30, left: 40};
  var width = 960 - margin.left - margin.right;
  var height = 500 - margin.top - margin.bottom;

  
  
  
  
  // var svg = d3.selectAll('.graph').append("svg")
  // .attr('width', width + margin.left + margin.right)
  // .attr('height', height + margin.top + margin.bottom)
  // .append('g')
  // .attr('transform', "translate(" + margin.left + "," + margin.top + ")");

  var tables = $('.question-table')
  // var xData = []
  // var yData = []
  var graphs = $('.graph')
  // var svg = d3.select('.graph').append('svg')

  $.each(tables, function(index, value) {
    // var formatPercent = d3.format(".0%");
    var x = d3.scale.ordinal().rangeRoundBands([0, width], .1);
    var y = d3.scale.linear().range([height, 0]);
    var xAxis = d3.svg.axis().scale(x).orient('bottom');
    var yAxis = d3.svg.axis().scale(y).orient('left');

    var xData = (d3.selectAll($(tables[index]).find('.choice-label')));
    var yData = (d3.selectAll($(tables[index]).find('.data-cell')));
    x.domain(xData[0].map(function(d) {return d.innerHTML}));
    y.domain( [0, d3.max(yData[0], function(d) { return +parseInt(d.innerHTML)})]);

    var svg = d3.select(graphs[index]).append('svg')
    .attr('width', width + margin.left + margin.right)
    .attr('height', height + margin.top + margin.bottom)
    .append('g')
    .attr('transform', "translate(" + margin.left + "," + margin.top + ")");
    
    svg.append('g')
    .attr('class', 'x axis')
    .attr("transform", "translate(0," + height + ")")
    .call(xAxis);
    
    svg.append('g')
    .attr("class", "y axis")
    .call(yAxis)
    .append("text")
    .attr("transform", "rotate(-90)")
    .attr("y", 6)
    .attr("dy", ".71em")
    .style("text-anchor", "end")
    .text("Responses");

    svg.selectAll('.bar')
    .data(yData[0])
    .enter().append('rect')
    .attr('class', 'bar')
    .attr('x', function(d) { return x(d.innerHTML) })
    .attr('width', x.rangeBand())
    .attr('y', function(d) { return y(parseInt(yData[0].innerHTML))})
    .attr('height', function(d) { return height - y(parseInt(d.innerHTML))});
  });
function type(d) {
  d.frequency = +d.frequency;
  return d;
}
});
