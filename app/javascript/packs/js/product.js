$(document).on('turbolinks:load', function() {

	 // $(document).on('click','#favourite_link',function(e){

  //   //console.log("ndnd")
  //   //alert("dfdf")
  //   // e.preventDefault();
  //   this_tag = $(this)
  //   e.preventDefault();
  //   var product_id = $(this).attr("data_product_id")
  //   $.ajax({
  //   url:'/products/like_dislike_status',
  //   data: {product_id: product_id}, 
  //   type:'get',
  //   headers: {
  //   'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
  //   },
  //   success:function(response){
  //     console.log(response)
  //     if(response['status']){
  //       if(response['like_dislike_status']){
  //       this_tag.find('i').addClass('fas-thumbs-up')
  //       this_tag.find('i').removeClass('fa-thumbs-up')

  //          this_tag.attr("title", "Inactive")
  //          window.location.reload();
  //       }else{
  //        this_tag.find('i').addClass('fa-thumbs-up')
  //        this_tag.find('i').removeClass('fas-thumbs-up')
  //        this_tag.attr("title", "Active")
  //        window.location.reload();
  //       }

  //     }else{
  //       if(response.url){

  //         window.location.href=response.url;
  //       }else{
  //         $('#ajax_flash').show().html("").html('<div class="slide-effect"><div class="alert alert-danger alert-dismissible"><button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="fas fa-times"></i></button>  <div class="alert-message p-med"><i class=" fa fa-ban"></i> Alert!</div>'+response.message+' </div></div>');
  //       }
  //     }
  //   }
  // })
  // })


    
  });
 