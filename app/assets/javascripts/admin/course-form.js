$(document).ready(function(){
  var __bind = function(fn, me) {
    return function(){ return fn.apply(me, arguments); };
  };

  var CourseForm = function() {
    this.resetOptions();
    this.handleInputChange = __bind(this.handleInputChange, this);
    this.addOption = __bind(this.addOption, this);
    this.optionRetriever = __bind(this.optionRetriever, this);
    this.bindEvents();
  };

  CourseForm.prototype.addOption = function(model){
    var template = this.template();
    this.options.push(template(model));
  };

  CourseForm.prototype.bindEvents = function() {
    $('#course_period').on('keyup', this.handleInputChange);
  };

  CourseForm.prototype.handleInputChange = function(event) {
    var value = $(event.target).val();
    var url = '/admin/available_teachers.json';
    $.get(url, {period: value}, this.optionRetriever);
  };

  CourseForm.prototype.optionRetriever = function(formData) {
    this.resetOptions();
    formData.forEach(this.addOption);
    $('#course_teacher_id').html(this.options);
  };

  CourseForm.prototype.resetOptions = function() {
    this.options = [];
  };

  CourseForm.prototype.template = function() {
    return _.template($('#option-template').html());
  };

  new CourseForm();
});

