$(document).on("ready", function() {
  $("#Log-In").on("click", function() {
    $("#home").hide()
    $("#SIform").fadeIn(1000)
  })
  $("#BackSU").on("click", function() {
    $("#SIform").hide()
    $("#home").fadeIn()
  })
})
