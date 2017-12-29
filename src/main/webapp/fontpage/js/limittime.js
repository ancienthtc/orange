//--限时购--------------------------------------------------------------
function count_time(endTime) {
    
    $('#limitData').css("display", "none");
    var interval = window.setInterval(function () {

        var now_time = Date.parse(new Date()) / 1000;
        var time = endTime - now_time;
        //console.debug(time);
        if (!time ||time<0) {
            $('.index_time_p2').html('限时购活动已结束');
            $('#limitData').css("display", "none");
             clearInterval(interval);
           

        } else {
            $('#limitData').css("display", "block");
            $('.index_time_p2').html('剩余 <input type="button" class="index_time_bu1" value="00" id="hour">:<input type="button" class="index_time_bu1" value="00" id="minute">:<input type="button" class="index_time_bu1" value="00" id="second">');
            ShowCountDown(time--);

        }



    }, 1000);

}

function ShowCountDown(data) {

    var time = data;
    var leftsecond = parseInt(time);
    var day1 = Math.floor(leftsecond / (60 * 60 * 24));
    var hour = Math.floor((leftsecond - day1 * 24 * 60 * 60) / 3600);
    var minute = Math.floor((leftsecond - day1 * 24 * 60 * 60 - hour * 3600) / 60);
    var second = Math.floor(leftsecond - day1 * 24 * 60 * 60 - hour * 3600 - minute * 60);
    $("#hour").val(charLeftAll(hour));
    $("#minute").val(charLeftAll(minute));
    $("#second").val(charLeftAll(second));

}
function charLeftAll(n) {
    if (n < 10)
        return "0" + n;
    else
        return n;
}