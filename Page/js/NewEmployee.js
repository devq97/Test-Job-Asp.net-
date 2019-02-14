$(document).ready(function () {
    var employeeClone = $('#newEmployee').clone();
    $('#newButton').click(function () {
        
        $('#newEmployee').show();
    });

    $('#backButton').click(function () {

        $('#newEmployee').hide();
        $('#editButton').hide();
        $('#submitButton').show();

        $("#inputCode").prop('disabled', false);
        $(".inputSam").prop('disabled', false);
        $(".selectAction").prop('disabled', false);

        $("#inputCode").val("");
        $("#inputSam").val("");
        $(".inputName").val("");
        $(".inputEmail").val("");

    });
});

$(document).ready(function () {
    document.getElementById("inputCode").oninvalid = function () {
        $('#inputCode').addClass("is-invalid");
        $('#message').show();
    };

    $("#inputCode").keyup(function () {
        $('#inputCode').removeClass("is-invalid");
        $('#message').hide();
    });

    document.getElementById("inputSam").oninvalid = function () {
        $('#inputSam').addClass("is-invalid");
        $('#message').show();
    };

    $("#inputSam").keyup(function () {
        $('#inputSam').removeClass("is-invalid");
        $('#message').hide();
    });

    $("#form1").submit(function (e) {
        event.preventDefault()
        var code = $('#inputCode').val().toString();
        var country = $('#country').val();
        var sam = $('#inputSam').val();
        var name = $('#inputName').val();
        var lastName = $('#inputLast').val();
        var email = $('#inputEmail').val();
        var active = $('#inputActive').val();
        var systemAdmin = $('#inputSystem').val();
        if ($("#selectAction").val() == 'Save') {
            $.ajax({
                url: 'Home.aspx/InsertEmployee',
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
                                $("#divSuccess").show();
                            }, 2000);
                        setTimeout(
                            function () {
                                location.reload();
                            }, 4000);
                    } else {
                        setTimeout(
                            function () {
                                $('#insertError').show().delay(1800).hide(400);
                            }, 2000);
                    }
                },
                error: function (error) {
                    console.log(error.responseText);
                    $('#insertError').show().delay(1800).hide(400);
                }
            });
        } else {
            $.ajax({
                url: 'Home.aspx/DeleteEmployee',
                method: 'post',
                contentType: 'application/json',
                data: "{code:'" + code + "'}",
                dataType: 'json',
                success: function (data) {
                    $("#spinnerLoading").show().delay(1800).hide(400);
                    if (!data.d) {
                        setTimeout(
                            function () {
                                $("#divSuccess").text("Employee with code: " + code + " has been deleted.");
                                $("#divSuccess").show();
                            }, 2000);
                        setTimeout(
                            function () {
                                location.reload();
                            }, 4000);
                    } else {
                        setTimeout(
                            function () {
                                $("#insertError").text("Employee with code:" + code + " doesn'y exist. Try with another code.");
                                $('#insertError').show().delay(1800).hide(400);
                            }, 2000);         
                    }            
                },
                error: function (error) {
                    console.log(error.responseText);
                    $('#insertError').show().delay(1800).hide(400);
                }
            });
        }
    });
});
