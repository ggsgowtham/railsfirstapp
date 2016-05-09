
jQuery.fn.submitOnCheck = function() {
  console.log('comes here')
  this.find('span.taskName').dblclick(function(e) {
  	var labelName = $(this).find("label").text();
  	var html = '<input type="text" name="tak[name]" class="editForm" value="'+ labelName +'">'
  	$(this).html(html);
  });
  this.find('li').find('input[type=checkbox]').on('click',function(e) {
    $(this).parent().parent('form').submit();
  });
  return this;
}
$(function() {
  $('.edit_tak').submitOnCheck();
  $('#all_tasks').on('click',function(){
      $("#incomplete_panel, #complete_panel").show();
  });
  $('#active_tasks').on('click',function(){
      $("#incomplete_panel").show();
      $("#complete_panel").hide();
  });
  $('#completed_tasks').on('click',function(){
      $("#incomplete_panel").hide();
      $("#complete_panel").show();
  });
});