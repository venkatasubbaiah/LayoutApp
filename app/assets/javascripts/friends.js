$(function () {

    if (params["action"] == "index" && params["controller"] == "friends") {

        $(window).scroll(function (e) {
            var next_page_no = $('#next_page_no').val();
            var $next = parseInt(next_page_no);
            var total_no_pages = $('#total_no_pages').val();
            var $total = parseInt(total_no_pages);
            if ($total > 1) {
                e.preventDefault();
                if ($(window).scrollTop() + $(window).height() == $(document).height()) {
//            alert('next = ' + $n + 'total = ' + $t)
                    if ($next < $total) {
                        $.get('/friends', {page: next_page_no},
                            function () {
                            });
                    }
                }
            }

        });
    }

}) ;

