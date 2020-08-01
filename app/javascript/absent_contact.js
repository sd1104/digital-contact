// $(function(){
//   // $('.teacher-not-confirm-btn').on('click', function(e) {
//   //   e.preventDefault();
//   //   let input = $('.teacher-not-confirm-btn').val();
//   //   console.log(input)


//   //   $.ajax({
//   //     type: "",
//   //     url: "",
//   //     data: {  },
//   //     dataType: ""
//   //   })
//   //   .done(function() {

//   //   })
//   //   .fail(function() {
//   //     console.log("error")
//   //   });

//   // });
//   $(".t_checked").bind('change', function(e){
//     e.preventDefault();
//     if (this.checked){
//       $.ajax({
//         url: '/rooms/'+this.value+'/absent_contact_t_checked',
//         type: 'POST',
//         data: {"t_checked": this.checked}
//       });
//     }
//     else {
//        alert("no");
//     }
//   });
// });


