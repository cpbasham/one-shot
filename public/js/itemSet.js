// DON'T ALLOW SELECTION OF +
$("div.item-set-container").on("selectstart dragstart", "div.new-row, div.item-set-row-delete", function(evt) {
  evt.preventDefault();
  return false;
});

$("div.item-set-container").on("click", "div.new-row", function(evt) {
  evt.preventDefault();
  var target = $(evt.target);
  $.ajax({
    url: "item_sets/new",
    method: "GET",
    dataType: "html"
  }).done(function(data) {
    var newRow = $(data).insertBefore(target);
    newRow.find("ul").droppable({
      drop: function( e, ui ) {
        e.preventDefault();
        e.stopPropagation();
        var li = $('<li><span data-type="item" data-id="' + ui.draggable.data("id") + '" title="' + ui.draggable.attr("title") + '" style="' + ui.draggable.attr("style") + '" class="sprite"></span></li>');
        li.appendTo(e.target);
      }
    });
  });
});

$("div.item-set-container").on("dblclick", "span.sprite", function(e) {
  $(e.target).parent().remove();
});

$("div.item-set-container").on("click", "div.item-set-row-container div.row-items", function(e) {
  var container = $(e.target).closest("div.item-set-row-container");
  container.find("div.item-set-row-delete").toggle();
  container.siblings().find("div.item-set-row-delete").hide();
});

$("div.item-set-container").on("dblclick", "div.item-set-row-delete", function(e) {
  $(e.target).parent().remove();
});



// function showText(text) {
//   $("body").empty().html(text);
// }

// $.ajax({
//   url: "items/",
//   method: "GET",
//   dataType: "json"
// }).done(function(data) {
//   // showText(JSON.stringify(data));
//   // showText(data.TT);
//   console.log(data.SR);
// })