// public/script.js
document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('addBrandForm');
    const messageDiv = document.getElementById('message');

    form.addEventListener('submit', async (e) => {
        e.preventDefault();
        const brandname = form.brandname.value;

        try {
            const response = await fetch('/addbrand', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ brandname }),
            });

            if (response.ok) {
                const brandList = await response.json();
                messageDiv.textContent = 'Brand added successfully.';
                console.log('Updated Brand List:', brandList);
            } else {
                messageDiv.textContent = 'Error adding brand.';
            }
        } catch (error) {
            console.error('Error:', error);
            messageDiv.textContent = 'Server error.';
        }
    });
});
