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

function ItemSetData() {
  this.title = $("div.item-set-container input.item-set-name").val();
  this.type = "custom";
  this.map = $("ul.map-selector li:first-child").data("map");
  this.mode = $("ul.game-type-selector li:first-child").data("game-type");
  this.priority = false;
  this.sortrank = 0;
  this.blocks = [];
  var blocks = [];
  $("div.row-container div.item-set-row-container").each(function() {
    var row = $(this);
    var block = {};
    block.type = row.find("input").val();
    block.recMath = false;
    block.minSummonerLevel = -1;
    block.maxSummonerLevel = -1;
    block.showIfSummonerSpell = "";
    block.hideIfSummonerSpell = "";
    block.items = [];
    row.find("span").each(function() {
      var item = {};
      item.id = $(this).data("id").toString();
      item.count = 1;
      block.items.push(item);
    });
    blocks.push(block);
  });
  this.blocks = blocks;
}


$("div.save-div button.compile-button").on("click", function(e) {
  // window.location = 'data:rawr download="data.json"';
  var obj = new ItemSetData;
  var data = "text/json;charset=utf-8," + encodeURIComponent(JSON.stringify(obj));
  $("div.save-div a").remove();
  var name = obj.title;
  if (name === "") {
    name = "item_set";
  }
  $('<a href="data:' + data + '" download="' + name + '.json">Download!</a>').appendTo($("div.save-div"));
});


  // var data = "text/json;charset=utf-8," + encodeURIComponent(JSON.stringify(obj));
  // $('<a href="data:' + setData + '" download="data.json">download JSON</a>').appendTo('#container');