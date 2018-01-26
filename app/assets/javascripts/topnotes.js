$(function(){
    $(".note_link").on("click", function(){
    
      $.ajax({
    
        type: "GET",
    
        url: $(this).attr("href"),
    
        datatype:'html'    
    
      }).then(function(){
    
        //成功時の処理
    
        $("#noteArea").html(result);
    
    
      },
    
      function(){
    
        //失敗時の処理
    
        alert()
        
        //を使ってエラーメッセージを出すとか
    
      });