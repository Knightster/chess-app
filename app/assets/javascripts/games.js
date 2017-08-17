function getGameStatus() {
 
  var gameId = $("#js-game-status-card").data('game_id');
 
  $.get("/games/" + gameId + "/status", function(data){
    // console.log("Response from the server", data);
    $('span#js-in-check-status').html(data.in_check);
  })
}
 
function setPieceClickHandler() {
  console.log("ready");
  $('td.piece-cell').click(function(){
    var pieceId = $(this).data('piece_id');
    // console.log("Stop clicking on me!", pieceId);
    var url = "/pieces/" + pieceId + "/player";
    $.get(url, function(serverData) {
      console.log("The response from the server:", serverData.name);
    })
  });
}
 
$(function() {
  setPieceClickHandler();
  getGameStatus();
})