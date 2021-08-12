CW.ScorecardsIndex = (() => {
  function init() {
    CW.DatepickerPopup.init();
    CW.ScorecardsShow.onClickBtnCopy();

    handleDisplayCollapseContent();
    onShowCollapse();
    onHideCollapse();
    onAddFilter();
    onSaveFilter();
    onCancelFilter();
  }

  function onCancelFilter() {
    $(".add-filter__cancel").click(function (e) {
      e.preventDefault();
      $("#add-filter__modal").hide();
    });
  }

  function onSaveFilter() {
    $(".add-filter__save").click(function (e) {
      e.preventDefault();
      let $container = $(".add-filter__saved_items_container");
      let $item = $("<div></div>");
      $item.text("hello world");
      $item.addClass("d-inline-block p-1 mr-3");
      $item.css({ border: "1px solid #ccc" });
      $container.append($item);
    });
  }

  function onAddFilter() {
    $("#add-filter__link").click(function (e) {
      e.preventDefault();
      $("#add-filter__modal").toggle();
    });
  }

  function handleDisplayCollapseContent() {
    if (window.localStorage.getItem("show_collapse") == "true") {
      $(".collapse").addClass("show");
      hideArrowDown();
    }
  }

  function onShowCollapse() {
    $(".collapse").on("show.bs.collapse", function () {
      window.localStorage.setItem("show_collapse", true);
      hideArrowDown();
    });
  }

  function onHideCollapse() {
    $(".collapse").on("hide.bs.collapse", function () {
      window.localStorage.setItem("show_collapse", false);
      showArrowDown();
    });
  }

  function showArrowDown() {
    $(".advance-search i").removeClass("fa-angle-up");
    $(".advance-search i").addClass("fa-angle-down");
  }

  function hideArrowDown() {
    $(".advance-search i").removeClass("fa-angle-down");
    $(".advance-search i").addClass("fa-angle-up");
  }

  return {
    init,
  };
})();
