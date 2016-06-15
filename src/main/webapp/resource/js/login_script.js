$(document).ready(function() {
	
	////////////____Input Focus___//////////////////

    $('.form-control').focusout(function() {
      $('.form-group').removeClass('focus');
    });
    $('.form-control').focus(function() {
      $(this).closest('.form-group').addClass('focus');
    });

    /// Input Kepress Filled  Focus
    $('.form-control').keyup(function() {
      if ($(this).val().length > 0) {
        $(this).closest('.form-group').addClass('filled');
      } else {
        $(this).closest('.form-group').removeClass('filled');
      }
    });

    /// Input Check Filled Focus
    var $formControl = $('.form-control');
    var values = {};
    var validate = $formControl.each(function() {
      if ($(this).val().length > 0) {
        $(this).closest('.form-group').addClass('filled');
      } else {
        $(this).closest('.form-group').removeClass('filled');
      }
    });

    //Ripple Effect
    $(".btn").click(function(e) {

      // Remove olds ones
      $(".ripple").remove();

      // Setup
      var posX = $(this).offset().left,
        posY = $(this).offset().top,
        buttonWidth = $(this).width(),
        buttonHeight = $(this).height();

      // Add the element
      $(this).prepend("<span class='ripple'></span>");

      // Make it round!
      if (buttonWidth >= buttonHeight) {
        buttonHeight = buttonWidth;
      } else {
        buttonWidth = buttonHeight;
      }

      // Get the center of the element
      var x = e.pageX - posX - buttonWidth / 2;
      var y = e.pageY - posY - buttonHeight / 2;

      // Add the ripples CSS and start the animation
      $(".ripple").css({
        width: buttonWidth,
        height: buttonHeight,
        top: y + 'px',
        left: x + 'px'
      }).addClass("rippleEffect");
      
      //alert('로그인 시도 중...');
    });// 버튼 클릭
})