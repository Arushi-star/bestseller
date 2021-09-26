$(document).on('turbolinks:load', function() {

   $.validator.addMethod("textOnly", function (value, element) {
           var pattern = /^[a-zA-Z\s]+$/
           return this.optional(element) || pattern.test(value);
     });

   $.validator.addMethod("isValidEmailAddress", function (value, element) {
         var pattern = new RegExp(/^[a-zA-Z0-9_\.%\+\-]+@[a-zA-Z0-9\.\-]+\.[a-zA-Z]{2,3}$/);
         return this.optional(element) || pattern.test(value);
   },'Please enter valid email');

    $.validator.addMethod("notEqual", function(value, element, param) {
    return this.optional(element) || value != param;
  }, "Please specify a different (non-default) value");

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
              maxlength:10,
            },

            'product[price]':{
              required: true,
            },

            'product[category_types]':{
              required: true,
            },
            
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

            'product[color]':{
              required: 'Please enter select color',
              minlength: 'Color must be more than 2 characters',
              maxlength: 'Color must not exceed 10 characters',
            },

            'product[price]':{
              required: 'Please enter the price',
            },
            'product[category_types]':{
              required: 'Please select the category',
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
        maxlength:10,
      },
      'user[password]':{
        required: true,
      },
      'user[password_confirmation]':{
        required: true,
        equalTo: '#user_password'
      },
       'user[user_type_id]':{
        required: true,
      }


    },
    messages:{
      'user[name]':{
        required: 'Please enter name',
        textOnly: 'Please enter characters only'
      },
      'user[email]':{
        required: 'Please enter email',
        remote: "Email already exits",
        trimFunc: "Please enter valid email" 

      },
     
      'user[phonenumber]':{
        required: 'Please enter number',
        minlength: 'Phonenumber must be of 10 digits',
        maxlength: 'Phonenumber does not exceed more than 10 digits',
      },
      'user[password]':{
        required: 'Please enter password',

      },
      'user[password_confirmation]':{
        required: 'Please confirm your password',
        equalTo:  'Password  does not match',
      },
      'user[user_type_id]':{
        required: 'Please select the user type',
      }
       
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