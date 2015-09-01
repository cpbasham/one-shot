
// CHAMPION SELECTOR MODIFIER LISTENERS
//------------------------------------------------------
//   var champSelector = $(".menu-bar.champion-select input");
//   champSelector.on("focus", function(e) {
//     champSelector.attr("placeholder", "");
//   });
//   champSelector.on("blur", function(e) {
//     champSelector.attr("placeholder", "Champion");
//   });
//------------------------------------------------------

var inputPlaceholder;
$("body").on("focus", "input", function(e) {
  var target = $(e.target);
  inputPlaceholder = target.attr("placeholder");
  $(e.target).attr("placeholder", "");
});
$("body").on("blur", "input", function(e) {
  $(e.target).attr("placeholder", inputPlaceholder);
});