document.addEventListener('DOMContentLoaded', () => {
    const budgetInput = document.getElementById('budget-input');
    const budgetButton = document.getElementById('budget-button');
    const componentSelect = document.getElementById('component-select');
    const recommendationsList = document.getElementById('recommendations');
    const selectedList = document.getElementById('selected');
    const totalPriceElem = document.getElementById('total-price');

    let totalPrice = 0;

    // Restrict budget input to only accept numerical values
    budgetInput.addEventListener('input', () => {
        budgetInput.value = budgetInput.value.replace(/[^0-9.]/g, '');
    });

    function fetchRecommendations() {
        const budget = budgetInput.value;
        const type = componentSelect.value;

        console.log(`Fetching data for type: ${type}, budget: ${budget}`);

        fetch(`index.php?type=${type}&budget=${budget}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok ' + response.statusText);
                }
                return response.json();
            })
            .then(data => {
                console.log('Data received:', data);
                recommendationsList.innerHTML = '';

                if (data.error) {
                    const li = document.createElement('li');
                    li.textContent = data.error;
                    recommendationsList.appendChild(li);
                } else if (data.length === 0) {
                    const li = document.createElement('li');
                    li.textContent = 'No products found for the selected criteria.';
                    recommendationsList.appendChild(li);
                } else {
                    data.forEach(product => {
                        const li = document.createElement('li');
                        li.textContent = `${product.name} - $${product.price} - ${product.description}`;
                        li.dataset.price = product.price;
                        li.addEventListener('click', () => {
                            addSelectedProduct(product);
                        });
                        recommendationsList.appendChild(li);
                    });
                }
            })
            .catch(error => {
                console.error('Fetch error:', error);
                const li = document.createElement('li');
                li.textContent = `Error fetching products: ${error.message}`;
                recommendationsList.appendChild(li);
            });
    }

    function addSelectedProduct(product) {
        const li = document.createElement('li');
        li.textContent = `${product.name} - $${product.price} - ${product.description}`;
        li.dataset.price = product.price;

        const deleteButton = document.createElement('button');
        deleteButton.textContent = 'Delete';
        deleteButton.className = 'delete-button';
        deleteButton.addEventListener('click', (event) => {
            event.stopPropagation(); // Prevent the event from bubbling up to the li click event
            if (confirm('Are you sure you want to delete this product?')) {
                totalPrice -= parseFloat(product.price);
                totalPriceElem.textContent = `Total Price: $${totalPrice.toFixed(2)}`;
                selectedList.removeChild(li);
            }
        });

        li.appendChild(deleteButton);
        selectedList.appendChild(li);

        totalPrice += parseFloat(product.price);
        totalPriceElem.textContent = `Total Price: $${totalPrice.toFixed(2)}`;
    }

    budgetButton.addEventListener('click', fetchRecommendations);
    componentSelect.addEventListener('change', fetchRecommendations);
});
document.addEventListener('DOMContentLoaded', () => {
    const contactForm = document.getElementById('contact-form');

    contactForm.addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent the form from submitting normally

        if (emailInput.value.trim() === '') {
            alert('Please enter an email address.');
            return; // Stop form submission
        }

        // Collect form data
        const formData = new FormData(this);

        // Send form data to PHP script using Fetch API
        fetch('email.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            // Check if the status is success
            if (data.status === 'success') {
                // If success, display an alert and redirect to index.html
                alert(data.message);
                window.location.href = 'index.html';
            } else {
                // If error, display an alert with the error message
                alert(data.message);
            }
        })
        .catch(error => {
            // If there's an error with the fetch request, display an alert
            alert('An error occurred while processing your request.');
            console.error('Error:', error);
        });
    });
});

