CW.Local_ngosIndex = (() => {
  return {
    init
  }

  function init() {
    onChangeImportFile();
  }

  function onChangeImportFile() {
    $("#importModal input:file").on('change', function (){
      $("#importModal .btn-primary").attr('disabled', !$(this).val())
    });
  }
})();
