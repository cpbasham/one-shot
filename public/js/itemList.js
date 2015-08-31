var itemDiv = $("div.items");
var itemSearch = itemDiv.find("#item-search")
;
var images = itemDiv.find("ul.images li span")
itemSearch.on("input", function(e) {
  var pattern = new RegExp(escapeRegExp(e.target.value));
  // console.log(pattern);
  images.each(function(i) {
    var image = $(images[i]);
    if (!pattern.test(image.attr("title"))) {
      image.parent().hide();
    } else {
      image.parent().show();
    }
  });
  // e.target.value
});

function escapeRegExp(str) {
  return str.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&");
}
