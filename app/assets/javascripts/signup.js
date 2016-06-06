$(document).on("ready", function() {
  $("#Sign-Up").on("click", function() {
    $("#home").hide()
    $("#Create_Commish").fadeIn(1000)
  })
  $("#BackSI").on("click", function() {
    $("#Create_Commish").hide()
    $("#home").fadeIn()
  })
})
