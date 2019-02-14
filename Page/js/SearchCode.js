$(document).ready(function () {
    $('#searchButton').click(function () {
        var code = $('#srchInput').val();
        var option = "2";
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
                            $("#mainTable tbody").empty();
                            for (i = 0; i < data.d.length; i++) {
                                var cell = "<tr><td>" +
                                    data.d[i].ID + "</td><td>" +
                                    data.d[i].name + "</td><td>" +
                                    data.d[i].sam + "</td><td>" +
                                    data.d[i].country + "</td><td>" +
                                    data.d[i].active + "</td><td>" +
                                    "<button id=" + data.d[i].ID +" class='btn btn-default updateButton' onclick='updateFilter(this.id)' type='button'><span class='fas fa-edit'></span></button></td>"

                                $("#mainTable").append(cell)
                            }
                        }, 2000);
                } else {
                    setTimeout(function ()
                    {
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