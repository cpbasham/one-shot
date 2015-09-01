// HIDE MENUS WHEN SOMETHING ELSE CLICKED
$("html").on("click", function() {
  $("div.menu-bar.item-set-modifiers li:first-child").siblings().hide();
});

// DON'T ALLOW SELECTION OF TEXT
$("div.menu-bar.item-set-modifiers").on("selectstart dragstart", "li", function(evt) {
  evt.preventDefault();
  return false;
});

function specifyItemsByMap(map, searchVal) {
  if (map === "any") {
    var images = $("div.items ul.images li span.sprite");
    images.data("purchasable", "true");
    searchForItem(searchVal);
  } else {
    $.ajax({
      url: "items",
      method: "GET",
      dataType: "json"
    }).done(function(data) {
      var images = $("div.items ul.images li span.sprite");
      images.data("purchasable", "true");
      var unpurchasable = data[map];
      for (var i=0; i<unpurchasable.length; i++) {
        var id = unpurchasable[i];
        $("div.items ul.images li span.sprite[data-id='" + id + "']").data("purchasable", "false");
      }
      searchForItem(searchVal);
    });
  }
}

$("div.menu-bar.item-set-modifiers").on("click", "li:not(:first-child)", function(e) {
  var target = $(e.target);
  if (target.is(".unviable")) {
    e.stopPropagation();
  } else {
    if (target.is($("ul.map-selector").children())) {
      var val = $("input#item-search").val();
      specifyItemsByMap($(e.target).data("map"), val);
    }
    bringToTop(target);
  }
});

$("div.menu-bar.item-set-modifiers").on("click", "li:first-child", function(e) {
  e.stopPropagation();
  $("div.menu-bar.item-set-modifiers li:first-child").not(e.target).siblings().hide();
  $(e.target).siblings().toggle();
});

function bringToTop(jListItem) {
  var parent = jListItem.parent();
  var first = parent.find("li:first-child");
  parent.prepend(jListItem.remove());
  var children = $(parent.children().not(first));
  var i = 0;
  while (children[i+1] !== undefined && $(children[i+1]).data("pos") < first.data("pos")) {
    i++;
  }
  first.remove().insertAfter(children[i]);
}