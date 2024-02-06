// 날씨
var cities = ['Seoul', 'Busan', 'Incheon'];

var apiKey = 'ba939557ede20833440726417d9f3f0f';
var units = 'metric';

cities.forEach(function(city, index) {
    var apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=' + city + '&appid=' + apiKey + '&units=' + units;
    $.getJSON(apiUrl, function(result){
        $('.city').eq(index).text(city);
        $('.ctemp').eq(index).text(result.main.temp);
        var wiconUrl = '<img src="https://openweathermap.org/img/wn/' + result.weather[0].icon + '.png" alt="' + result.weather[0].description + '">';
        $('.icon').eq(index).html(wiconUrl);
    });
});