$(document).on('turbolinks:load', function() {

   $.validator.addMethod("textOnly", function (value, element) {
           var pattern = /^[a-zA-Z\s]+$/
           return this.optional(element) || pattern.test(value);
     });

   $.validator.addMethod("isValidEmailAddress", function (value, element) {
         var pattern = new RegExp(/^[a-zA-Z0-9_\.%\+\-]+@[a-zA-Z0-9\.\-]+\.[a-zA-Z]{2,3}$/);
         return this.optional(element) || pattern.test(value);
   },'Please enter valid email');

   $(document).find('form#new_product').validate({
      
        rules: {
            'product[name]': {
                required: true,
                minlength: 2,
                maxlength: 50,
  
            },
            'product[description]': {
                required: true,
                minlength: 2,
                maxlength: 100,
            },

            'product[color]':{
              required: true,
              minlength: 2,
              maxlength:10
            }
            
        },
        messages: {
            'product[name]': {
                required:'Please enter Name', 
                minlength: 'Name must be more than 2 characters',
                maxlength: 'Name must no exceed 50 characters',
                 textOnly: 'please enter characters only',
            },
            'product[description]': {
                required: 'Please enter text',
                minlength: 'Text must be more than 2 characters',
                maxlength: 'Text must no exceed 100 characters', 
            },
        },
    })

  // $(document).on("click",".register_popup",function(e){
  //   e.preventDefault();
  //    //alert("vfd")
  //   $.ajax({
  //     type:'GET',
  //     url:'/users/sign_up',
  //     success:function(response){
  //       //debugger
  //       //I assume you want to do something on controller action execution success?
  //       //debugger
  //       if(response["status"]){
  //         $(document).find(".add_login_form").html(response["html_data"])
  //         $(document).find("#registerModal").modal('show')
  //         $(document).find("#signInModal").modal('hide') 
  //          validate_register()
  //       }
  //     }
  //   });
  // });




  $(document).find('form#new_user').validate({
    rules:{

      'user[name]':{
        required: true,
        textOnly: true,
      },
      'user[email]':{
        required: true,
        minlength: 2,
        maxlength: 100,
        isValidEmailAddress: true,
      
      },
      'user[phonenumber]':{
        required:true,
        minlength: 10,
        maxlength:10
      },
      'user[password]':{
        required: true,
      },

    },
    messages:{
      'user[name]':{
        required: 'please enter name',
        textOnly: 'please enter characters only'
      },
      'user[email]':{
        required: 'please enter email',
        remote: "Email already exits",
        trimFunc: "Please enter valid email"

      },
     
      'user[phonenumber]':{
        required: 'please enter number',
      },
      'user[password]':{
        required: 'please enter password',

      },
    }
  })

 // $(document).on("click",".login_popup",function(e){
 //    e.preventDefault();
 //     //alert("vfd")
 //    $.ajax({
 //      type:'GET',
 //      url:'/user/sign_in',
 //      success:function(response){
 //        //debugger
 //        //I assume you want to do something on controller action execution success?
 //        //debugger
 //        if(response["status"]){
 //          $(document).find(".add_signin_form").html(response["html_data"])
 //          $(document).find("#loginModal").modal('show')
 //          $(document).find("#registerModal").modal('hide') 
          
 //        }
 //      }
 //    });
 //  });

  $(document).find('form#check_user').validate({
    rules:{

     
      'user[email]':{
        required: true,
        minlength: 2,
        maxlength: 100,
        isValidEmailAddress: true,
      
      },
      'user[password]':{
        required: true,
      },

    },
    messages:{
      
      'user[email]':{
        required: 'please enter email',
        remote: "Email already exits",
        trimFunc: "Please enter valid email"

      },
     
      'user[password]':{
        required: 'please enter password',

      },
    }
  })


})