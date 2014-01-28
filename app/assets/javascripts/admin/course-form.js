// this works with render layout:false
//$(document).ready(function() {
//  $('#course_period').on('keyup', function(event) {
//    var value = $(this).val();
//    var url = '/admin/available_teachers'
//    $.get(url, {period: value}, function(form_data){
//      console.log(form_data);
//      $('select').replaceWith(form_data)
//    })
// selectTag.html(html)
//  });
//});
//

$(document).ready(function(){
  $('#course_period').on('keyup', function(event) {
    var value = $(this).val();
    var url = '/admin/available_teachers'

    $.get(url, {period: value}, function(form_data){
      console.log(form_data[0].first_name, form_data[0].id);
      var options = []
      form_data.forEach(function(teacher){
        options.push("<option value=" + teacher.id + ">" + teacher.first_name +" "+ teacher.last_name + "</option>")
      });
    $('select').html(options);
    });
  });
});

// <option value="1">Jonesmahoney</option>
// <option value="2">Mahiggleflop</option>
