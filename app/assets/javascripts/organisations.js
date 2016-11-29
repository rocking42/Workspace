// $(document).ready(function(){
//   // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
//
// });
$(document).on('turbolinks:load', function() {
  $('.modal').modal();
  // $('.modal').on('click', function(event) {
  //   event.preventDefault();
  // });
});
