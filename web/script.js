// Wait until the HTML document is fully loaded
document.addEventListener("DOMContentLoaded", function () {

    // Select all elements with the reveal class
    const revealItems = document.querySelectorAll(".reveal");

    // Check whether the browser supports Intersection Observer
    if ("IntersectionObserver" in window) {

        // Create an observer to detect visible elements
        const observer = new IntersectionObserver(
            function (entries, currentObserver) {

                entries.forEach(function (entry) {

                    // Check whether the element is visible
                    if (entry.isIntersecting) {

                        // Add the visible class
                        entry.target.classList.add("visible");

                        // Stop observing after animation
                        currentObserver.unobserve(entry.target);
                    }

                });

            },
            {
                threshold: 0.12
            }
        );

        // Observe each reveal element
        revealItems.forEach(function (item) {
            observer.observe(item);
        });

    } else {

        // Display all elements if the browser
        // does not support Intersection Observer
        revealItems.forEach(function (item) {
            item.classList.add("visible");
        });

    }

});
