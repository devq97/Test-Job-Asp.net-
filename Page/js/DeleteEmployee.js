$(document).ready(function () {

    $("select.selectAction").change(function () {

        if ($(this).children("option:selected").val().toString() == 'Delete') {
            $('.codeButton').show();
            $('#messageDelete').show();
            $('#message').hide();
            $('#inputCode').removeClass("is-invalid");
            $('#inputSam').removeClass("is-invalid");
            $(".country").prop('disabled', true);
            $(".inputSam").prop('disabled', true);
            $(".inputName").prop('disabled', true);

            $(".inputLast").prop('disabled', true);
            $(".inputEmail").prop('disabled', true);
            $(".inputActive").prop('disabled', true);
            $(".inputSystem").prop('disabled', true);
        } else {
            $('.codeButton').hide();
            $('#messageDelete').hide();
            $(".country").prop('disabled', false);
            $(".inputSam").prop('disabled', false);
            $(".inputName").prop('disabled', false);

            $(".inputLast").prop('disabled', false);
            $(".inputEmail").prop('disabled', false);
            $(".inputActive").prop('disabled', false);
            $(".inputSystem").prop('disabled', false);
        }

    });

    $('#codeButton').click(function () {

        var code = $('#inputCode').val();
        var option = "1";
        $.ajax({
            url: 'Home.aspx/SearchCode',
            method: 'post',
            contentType: 'application/json',
            data: "{srchInput:'" + code + "', option:'" + option + "'}",
            dataType: 'json',
            success: function (data) {
                $("#spinnerLoading").show().delay(1800).hide(400);
                if (data.d.length > 0) {
                    setTimeout(
                        function () {
                            $(".country").val(data.d[0].country);
                            $("#inputSam").val(data.d[0].sam);
                            $(".inputName").val(data.d[0].name);
                            $(".inputEmail").val(data.d[0].email);
                            $(".inputActive").val(data.d[0].active);
                            $(".inputSystem").val(data.d[0].systemAdmin);
                        }, 2000);
                } else {
                    setTimeout(function () {
                        $('.searchAlert').show().delay(1800).hide(400);
                    }, 2000);
                }
            },
            error: function (error) {
                console.log(error);
                $('.searchAlert').show().delay(1800).hide(400);
            }
        });
    });
});