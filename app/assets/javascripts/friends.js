$(function () {
    $(window).scroll(function (e) {
        e.preventDefault();
        if ($(window).scrollTop() + $(window).height() == $(document).height()) {
            var next_page_no = $('#next_page_no').val();
            var $next = parseInt(next_page_no);
            var total_no_pages = $('#total_no_pages').val();
            var $total = parseInt(total_no_pages);
//            alert('next = ' + $n + 'total = ' + $t)
            if ($next < $total) {
                $.get('/friends', {page: next_page_no},
                    function () {
                });
            }
        }
    });
});

