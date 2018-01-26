$(function(){
$(".product_link").on("click", function(){

  $.ajax({

    type: "GET",

    url: $(this).attr("href"),

    datatype:'html'    

  }).then(function(result){

    //成功時の処理

    $("#projectArea").html(result);


  },

  function(){

    //失敗時の処理

    alert()
    
    //を使ってエラーメッセージを出すとか

  });

  return false;

});
});