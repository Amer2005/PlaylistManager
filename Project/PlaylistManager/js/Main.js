function ShowError(errorMessage) {
    toastr.options = {
        "closeButton": false,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-center",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }

    toastr.error(errorMessage);
}

function ShowSuccess(successMessage) {
    toastr.options = {
        "closeButton": false,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-center",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }

    toastr.success(successMessage);
}

$(document).ready(function () {
    console.log("OnLoad");

    var érrorMessageHiddenField = document.getElementById("ErrorMessageDiv").getElementsByTagName('input')[0];

    var errorMessage = érrorMessageHiddenField.value;

    if (!!errorMessage) {
        ShowError(errorMessage);
    }

    var successMessageHiddenField = document.getElementById("SuccessMessageDiv").getElementsByTagName('input')[0];

    var successMessage = successMessageHiddenField.value;

    if (!!successMessage) {
        ShowSuccess(successMessage);
    }
});