
    var swiper = new Swiper(".reviews-slider", {
        spaceBetween: 20,
            grabCursor: true,
            loop: true,
            navigation: {
        nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            breakpoints: {
        0: {
        slidesPerView: 1,
                },
                640: {
        slidesPerView: 2,
                },
                768: {
        slidesPerView: 3,
                },
            },
        });
   