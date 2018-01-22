$(function(){
$(".product_link").on("click", function(){

  $.ajax({

    type: "GET",

    url: $(this).attr("href"),

    datatype:'html'    

  }).then(function(result){

    //成功時の処理

    //application.html.hamlの93行目.box.grayのところに何か#IDを付けておきましょう

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