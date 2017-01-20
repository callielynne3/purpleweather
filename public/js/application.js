$(document).ready(function() {
  hadouken();
  // resetForm();
});

var hadouken = function() {
  $('#my-div').html('<img src="http://i.imgur.com/90Mmdcm.png">')
  $('#my-div img').hover( function() {
      this.src = 'http://i.imgur.com/nTj3Fxx.gif'
  }, function() {
      this.src = 'http://i.imgur.com/90Mmdcm.png'
  })
  $('#my-div img').mousedown( function() {
      this.src = 'http://i.imgur.com/Rfj0a80.png'
  })
  $('#my-div img').mousedown(function() {
      $('.demo-hadouken').remove();
  })
  $('#my-div img').mousedown(function() {
      $('#my-div').append(
      '<img class="demo-hadouken" src="http://i.imgur.com/oTyQRvX.gif">'
      );
  })
  $('#my-div img').mousedown(function() {
      $('.demo-hadouken').animate( {
          "margin-left": "600px"
      }, 1000, 'swing', function() {
          this.remove();
      })
  })
  $('#my-div img').mouseup(function() {
      this.src = 'http://i.imgur.com/90Mmdcm.png'
  });
 }; 


// var resetForm = function() {
// 	$('form').on('submit', (function(e) {
//     e.preventDefault();
//     console.log('you clicked me');
// 	}

// 	var form = $(this);
// 	var url = $form.attr('action')
// 	var method = $form.attr('method');

// $.ajax({
// 	url: url; 
// 	method: method;
// }).done(function() {
// 	console.log('yipppeeeee')
// 	form.click(function(){
//         form.reset();
//   });
// }