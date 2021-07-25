document.addEventListener('click', function (event) {
    let buttonId = event.target.getAttribute('id');
    let tagName = event.target.tagName;
    //TODO У кнопки отбора сделать уникальный класс event.target.className
    if ('BUTTON' == tagName) {
        let id = buttonId.split('_', 2).pop();
        setAjax(id);
    }
});

function setAjax(id) {
    $.ajax({
        url: '{{ (path('poster_ajax_create')) }}',
        type: "POST",
        dataType: "json",
        data: {
            "posterId": id // Данные которые отправляем на сервер posterId
        },
        async: true,
        success: function (data) {
            console.log(data)
            $('div#ajax-results').html(data.output);
        }
    });
    return false;
};