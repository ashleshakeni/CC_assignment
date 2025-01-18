document.addEventListener('DOMContentLoaded', function () {
    // Carousel functionality
    (function () {
        const carouselContainer = document.querySelector('.carousel-container');
        const carouselItems = document.querySelectorAll('.carousel-item');
        const prevCarouselButton = document.querySelector('.carousel-controls .prev');
        const nextCarouselButton = document.querySelector('.carousel-controls .next');
        let carouselIndex = 0;
        let autoSlideInterval;

        function updateCarousel() {
            carouselContainer.style.transform = `translateX(-${carouselIndex * 100}%)`;
        }

        function goToNextCarouselSlide() {
            carouselIndex = (carouselIndex === carouselItems.length - 1) ? 0 : carouselIndex + 1;
            updateCarousel();
        }

        function goToPrevCarouselSlide() {
            carouselIndex = (carouselIndex === 0) ? carouselItems.length - 1 : carouselIndex - 1;
            updateCarousel();
        }

        function startAutoSlide() {
            autoSlideInterval = setInterval(goToNextCarouselSlide, 3000);
        }

        function stopAutoSlide() {
            clearInterval(autoSlideInterval);
        }

        prevCarouselButton.addEventListener('click', () => {
            stopAutoSlide();
            goToPrevCarouselSlide();
            startAutoSlide();
        });

        nextCarouselButton.addEventListener('click', () => {
            stopAutoSlide();
            goToNextCarouselSlide();
            startAutoSlide();
        });

        startAutoSlide();
        updateCarousel();
    })();

    // Slider functionality
    (function () {
        const sliders = document.querySelectorAll('.slider-container');

        sliders.forEach(function (sliderContainer) {
            const slider = sliderContainer.querySelector('.slider');
            const slides = sliderContainer.querySelectorAll('.slide');
            const prevSliderButton = sliderContainer.querySelector('.slider-controls .prev');
            const nextSliderButton = sliderContainer.querySelector('.slider-controls .next');
            let slideIndex = 0;

            function updateSlider() {
                const slideWidth = slides[0].offsetWidth;
                slider.style.transform = `translateX(${-slideIndex * slideWidth}px)`;
            }

            function goToNextSlide() {
                slideIndex = (slideIndex === slides.length - 1) ? 0 : slideIndex + 1;
                updateSlider();
            }

            function goToPrevSlide() {
                slideIndex = (slideIndex === 0) ? slides.length - 1 : slideIndex - 1;
                updateSlider();
            }

            nextSliderButton.addEventListener('click', function () {
                goToNextSlide();
            });

            prevSliderButton.addEventListener('click', function () {
                goToPrevSlide();
            });

            // Swipe functionality using Hammer.js
            const hammer = new Hammer(sliderContainer);
            hammer.on('swipeleft', () => {
                goToNextSlide();
            });

            hammer.on('swiperight', () => {
                goToPrevSlide();
            });

            window.addEventListener('resize', updateSlider);
            updateSlider();
        });
    })();

    // Profile modal functionality
    document.addEventListener("DOMContentLoaded", function() {
        var profileTrigger = document.getElementById("profileTrigger");
        var profileModal = document.getElementById("profileModal");
        var closeModal = document.querySelector(".modal .close");

        if (profileTrigger) {
            // Show modal when avatar is clicked
            profileTrigger.addEventListener("click", function() {
                profileModal.style.display = "block";
            });
        }

        // Close modal when close button is clicked
        closeModal.addEventListener("click", function() {
            profileModal.style.display = "none";
        });

        // Close modal when clicking outside the modal content
        window.addEventListener("click", function(event) {
            if (event.target === profileModal) {
                profileModal.style.display = "none";
            }
        });
    });
});
