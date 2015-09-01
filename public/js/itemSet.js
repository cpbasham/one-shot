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

        var li = $('<li><span data-type="item" data-id="' + ui.draggable.data("id") + '" title="' + ui.draggable.attr("title") + '" style="' + ui.draggable.attr("style") + '" class="sprite"</li>');
        // console.log(li);
        li.appendTo(e.target);
        // ui.helper.parent().clone().appendTo(e.target);
      }
    });
  });
});

$("div.item-set-container").on("click", "div.item-set-row-container div.row-items", function(e) {
  var container = $(e.target).closest("div.item-set-row-container");
  container.find("div.item-set-row-delete").toggle();
  container.siblings().find("div.item-set-row-delete").hide();
});

// $("div.item-set").on("click", "div.item-set-row-container", function(e) {
//   $(e.target).closest("div.item-set-row-container").find("div.item-set-row-delete").show();
//   $(e.target).closest("div.item-set-row-container").siblings().find("div.item-set-row-delete").hide();
// });

// $("body").on("click", ":not(div.item-set-row-container)", function(e) {
//   $("div.item-set-row-container div.item-set-row-delete").hide();
// });