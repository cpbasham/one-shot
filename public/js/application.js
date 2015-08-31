$(document).ready(function() {

//------------------------------------------------------
  // ITEM SET MODIFIER LISTENERS
//------------------------------------------------------
  // HIDE MENUS WHEN SOMETHING ELSE CLICKED
  $("html").on("click", function() {
    $("div.menu-bar.item-set-modifiers li:first-child").siblings().hide();
  });

  // DON'T ALLOW SELECTION OF TEXT
  $("div.menu-bar.item-set-modifiers").on("selectstart dragstart", "li", function(evt) {
    evt.preventDefault();
    return false;
  });

  $("div.menu-bar.item-set-modifiers").on("click", "li:not(:first-child)", function(e) {
    var target = $(e.target);
    if (target.is(".unviable")) {
      e.stopPropagation();
    } else {
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
//------------------------------------------------------


//------------------------------------------------------
// CHAMPION SELECTOR MODIFIER LISTENERS
//------------------------------------------------------
  var champSelector = $(".menu-bar.champion-select input");
  champSelector.on("focus", function(e) {
    champSelector.attr("placeholder", "");
  });
  champSelector.on("blur", function(e) {
    champSelector.attr("placeholder", "Champion");
  });
//------------------------------------------------------









});
