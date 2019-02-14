$(document).ready(function () {
    $('#filterButton').click(function () {

        $('#containerFilter').show();
    });

    $('#cancelButton').click(function () {

        $('#containerFilter').hide();
    });
});

$('#filterSuccess').click(function () {

    var code = $('#inputIDFilter').val();
    var country = $('#countryFilter').val();
    var sam = $('#inputSamFilter').val();
    var name = $('#inputNameFilter').val();
    var active = $('#activeFilter').val();
    $.ajax({
        url: 'Home.aspx/FilterEmployee',
        method: 'post',
        contentType: 'application/json',
        data: "{code:'" + code + "', country:'" + country + "', sam:'" + sam +
            "',name:'" + name + "', active:'" + active + "'}",
        dataType: 'json',
        success: function (data) {
            $("#spinnerLoading").show().delay(1800).hide(400);
            if (data.d.length > 0) {
                setTimeout(
                    function () {
                        $("#mainTable tbody").empty();
                        $('#containerFilter').hide();
                        for (i = 0; i < data.d.length; i++) {
                            var cell = "<tr><td>" +
                                data.d[i].ID + "</td><td>" +
                                data.d[i].name + "</td><td>" +
                                data.d[i].sam + "</td><td>" +
                                data.d[i].country + "</td><td>" +
                                data.d[i].active + "</td><td>" +
                                "<button id=" + data.d[i].ID + " onclick='updateFilter(this.id)' class='btn btn-default updateButton' type='button'><span class='fas fa-edit'></span></button></td>"

                            $("#mainTable").append(cell)
                        }
                    }, 2000);
            } else {
                setTimeout(function () {
                    $(".searchAlert").text("No data recorded");
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