yii.confirm = function (message, ok, cancel) {
    swal(
        {
            title: "Cảnh báo!",
            text: message,
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            cancelButtonText : "Không",
            confirmButtonText: "Có, xóa nó đi!",
            closeOnConfirm: false
        },
        function(isConfirm){
            if (isConfirm) {
                !ok || ok();
                swal("Deleted!", "Your imaginary file has been deleted.", "success");
              } else {
                !cancel || cancel();
              }
        }
    );
    // confirm will always return false on the first call
    // to cancel click handler
    return false;
}