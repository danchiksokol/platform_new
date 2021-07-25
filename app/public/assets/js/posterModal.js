var myModal = new bootstrap.Modal(document.getElementById('posterModal'));
$('.poster-images a').click(function () {
    $('.posterModal .modal-title').text($(this).attr('data-title'));
    $('.posterModal .open_pdf').attr('href', $(this).attr('data-pdf'));
    $('.posterModal .posterModal-img').attr('src', $(this).attr('data-img'));

    if ($(this).parent().prev().length) {
        $('.posterModal .poster-prev').removeClass('hidden');
    } else {
        $('.posterModal .poster-prev').addClass('hidden');
    }

    if ($(this).parent().next().length) {
        $('.posterModal .poster-next').removeClass('hidden');
    } else {
        $('.posterModal .poster-next').addClass('hidden');
    }
    $('.posterModal .poster-prev, .posterModal .poster-next').attr('data-id', $(this).parent().attr('id'));
    myModal.show();
});

$('.posterModal .poster-next').click(function () {
    myModal.hide();
    var id = $(this).attr('data-id');
    setTimeout(function () {
        $('#' + id).next().find('a').eq(0).click();
    }, 500);
});

$('.posterModal .poster-prev').click(function () {
    myModal.hide();
    var id = $(this).attr('data-id');
    setTimeout(function () {
        $('#' + id).prev().find('a').eq(0).click();
    }, 500);
});
