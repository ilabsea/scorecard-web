CW.Removing_scorecardsNew = (() => {
  return {
    init
  }

  function init() {
    CW.Scorecard_batchesNew.onChangeImportFile();
    CW.Scorecard_batchesNew.onClickBtnRemoveFile();
  }
})();
