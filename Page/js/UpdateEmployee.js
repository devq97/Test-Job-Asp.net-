function updateFilter (id) {
    var option = "1";
    $.ajax({
        url: 'Home.aspx/SearchCode',
        method: 'post',
        contentType: 'application/json',
        data: "{srchInput:'" + id + "', option:'" + option + "'}",
        dataType: 'json',
        success: function (data) {
            $("#spinnerLoading").show().delay(1800).hide(400);
            if (data.d.length > 0) {
                setTimeout(
                    function () {
                        $('#newEmployee').show();
                        $('#editButton').show();
                        $('#submitButton').hide();                        

                        $("#inputCode").prop('disabled', true);
                        $(".inputSam").prop('disabled', true);
                        $(".selectAction").prop('disabled', true);
                        $("#inputCode").val(data.d[0].ID);
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
};

$('#editButton').click(function () {

    var code = $('#inputCode').val().toString();
    var country = $('#country').val();
    var sam = $('#inputSam').val();
    var name = $('#inputName').val();
    var lastName = $('#inputLast').val();
    var email = $('#inputEmail').val();
    var active = $('#inputActive').val();
    var systemAdmin = $('#inputSystem').val();
    $.ajax({
        url: 'Home.aspx/UpdateEmployee',
        method: 'post',
        contentType: 'application/json',
        data: "{code:'" + code + "', name:'" + name + "', lastName:'" + lastName +
            "', sam:'" + sam + "', country:'" + country + "', active:'" + active +
            "', systemAdmin:'" + systemAdmin + "', email:'" + email + "'}",
        dataType: 'json',
        success: function (data) {
            $("#spinnerLoading").show().delay(1800).hide(400);
            if (!data.d) {
                setTimeout(
                    function () {
                        $("#divSuccess").text("Employee with code: " + code + " has been updated.");
                        $("#divSuccess").show();
                    }, 2000);
                setTimeout(
                    function () {
                        location.reload();
                    }, 4000);
            } else {
                setTimeout(function () {
                    $(".searchAlert").text("Update Failed!");
                    $('.searchAlert').show().delay(1800).hide(400);
                }, 2000);
            }
        },
        error: function (error) {
            console.log(error);
            $(".searchAlert").text("Error!");
            $('.searchAlert').show().delay(1800).hide(400);
        }
    });
});