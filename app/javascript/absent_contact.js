$(function(){
  $('').on('click', function(e) {
    e.preventDefault();
    

    $.ajax({
      type: "",
      url: "",
      data: {  },
      dataType: ""
    })
    .done(function() {

    })
    .fail(function() {
      console.log("error")
    });

  });
});

