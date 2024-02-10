document.addEventListener("turbo:load", function() {
  let addLineItemButton = document.getElementById("add_line_item");
  addLineItemButton.addEventListener("click", function(e) {
    e.preventDefault();
    let content = this.dataset.content.replace(/NEW_RECORD/g, new Date().getTime());
    document.querySelector("#new_line_item").insertAdjacentHTML("beforeend", content);
  });
});

