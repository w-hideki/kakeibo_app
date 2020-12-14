$(function(){
  var modal = $('#modal'),
        modalContent = $('.modal_content'),
        btnOpen = $(".income__contents__new"),
        btnClose = $(".botan");
 
  $(btnOpen).on('click', function() {
    modal.show();
  });
 
  $(modal).on('click', function(event) {
    if(!($(event.target).closest(modalContent).length)||($(event.target).closest(btnClose).length)){
      modal.hide();
    }
  });
});