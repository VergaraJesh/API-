document.addEventListener('DOMContentLoaded', () => {
    const contactForm = document.getElementById('contact-form');

    // Handle contact form submission
    contactForm.addEventListener('submit', (event) => {
        event.preventDefault();
        
        // Perform form submission logic here (e.g., sending the form data to the server)

        // Redirect to the index page after form submission
        window.location.href = 'index.html';
    });
});
