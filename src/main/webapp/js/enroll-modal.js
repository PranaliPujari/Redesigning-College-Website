(function () {
    function createApplicationModal() {
        const modal = document.createElement('div');
        modal.className = 'application-modal';
        modal.id = 'applicationModal';
        modal.setAttribute('aria-hidden', 'true');
        modal.innerHTML = `
            <div class="application-form-card" role="dialog" aria-modal="true" aria-labelledby="applicationTitle">
                <button class="close-form-btn" type="button" id="closeApplicationForm" aria-label="Close application form">
                    <i class="fas fa-times"></i>
                </button>
                <h2 id="applicationTitle">Admission Form 2025</h2>
                <p>Fill in your details and our admission team will contact you shortly.</p>
                <form class="application-form" id="applicationForm">
                    <div class="form-group">
                        <label for="studentName">Full Name</label>
                        <input type="text" id="studentName" name="studentName" placeholder="Enter your name" required>
                    </div>
                    <div class="form-group">
                        <label for="phoneNumber">Mobile Number</label>
                        <input type="tel" id="phoneNumber" name="phoneNumber" placeholder="+91 98765 43210" required>
                    </div>
                    <div class="form-group">
                        <label for="emailAddress">Email Address</label>
                        <input type="email" id="emailAddress" name="emailAddress" placeholder="you@example.com" required>
                    </div>
                    <div class="form-group">
                        <label for="programChoice">Program</label>
                        <select id="programChoice" name="programChoice" required>
                            <option value="MCA">MCA</option>
                            <option value="MBA">MBA</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="qualification">Highest Qualification</label>
                        <input type="text" id="qualification" name="qualification" placeholder="BCA, B.Sc, B.Com, etc." required>
                    </div>
                    <div class="form-group">
                        <label for="percentage">Percentage / CGPA</label>
                        <input type="text" id="percentage" name="percentage" placeholder="Example: 72% or 8.1 CGPA" required>
                    </div>
                    <div class="form-group full-width">
                        <label for="message">Message</label>
                        <textarea id="message" name="message" placeholder="Tell us if you have any questions"></textarea>
                    </div>
                    <button class="submit-application-btn" type="submit">
                        <i class="fas fa-paper-plane"></i> Submit Application
                    </button>
                </form>
            </div>
        `;
        document.body.appendChild(modal);
        return modal;
    }

    const existingApplicationModal = document.getElementById('applicationModal');
    const applicationModal = existingApplicationModal || createApplicationModal();
    const closeApplicationForm = applicationModal.querySelector('#closeApplicationForm');
    const applicationForm = applicationModal.querySelector('#applicationForm');
    const firstApplicationInput = applicationModal.querySelector('#studentName');

    function openApplicationForm(event) {
        event.preventDefault();
        applicationModal.classList.add('active');
        applicationModal.setAttribute('aria-hidden', 'false');
        document.body.style.overflow = 'hidden';
        firstApplicationInput.focus();
    }

    function closeApplicationModal() {
        applicationModal.classList.remove('active');
        applicationModal.setAttribute('aria-hidden', 'true');
        document.body.style.overflow = '';
    }

    document.querySelectorAll('.enroll-btn, .js-open-application').forEach((button) => {
        button.addEventListener('click', openApplicationForm);
    });

    // Always attach event listeners
    closeApplicationForm.addEventListener('click', closeApplicationModal);
        applicationModal.addEventListener('click', (event) => {
            if (event.target === applicationModal) {
                closeApplicationModal();
            }
        });
        document.addEventListener('keydown', (event) => {
            if (event.key === 'Escape' && applicationModal.classList.contains('active')) {
                closeApplicationModal();
            }
        });
        applicationForm.addEventListener('submit', (event) => {
            event.preventDefault();
            
            const submitBtn = applicationForm.querySelector('.submit-application-btn');
            const originalText = submitBtn.innerHTML;
            submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Submitting...';
            submitBtn.disabled = true;

            const formData = {
                studentName: applicationForm.querySelector('#studentName').value,
                phoneNumber: applicationForm.querySelector('#phoneNumber').value,
                emailAddress: applicationForm.querySelector('#emailAddress').value,
                programChoice: applicationForm.querySelector('#programChoice').value,
                qualification: applicationForm.querySelector('#qualification').value,
                percentage: applicationForm.querySelector('#percentage').value,
                message: applicationForm.querySelector('#message').value
            };

            // Use relative path handling for API
            let apiUrl = 'api/enroll';
            if (window.location.pathname.includes('/admin/')) {
                apiUrl = '../api/enroll';
            }

            fetch(apiUrl, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(formData)
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    alert('Thank you! ' + data.message);
                    applicationForm.reset();
                    closeApplicationModal();
                    // Redirect to admin dashboard to view the new entry
                    let dashboardUrl = 'admin/dashboard';
                    if (window.location.pathname.includes('/admin/')) {
                        dashboardUrl = 'dashboard';
                    }
                    window.location.href = dashboardUrl;
                } else {
                    alert('Error: ' + data.message);
                }
            })
            .catch(error => {
                alert('Error connecting to the server. Please try again later.');
                console.error('Error:', error);
            })
            .finally(() => {
                submitBtn.innerHTML = originalText;
                submitBtn.disabled = false;
            });
        });
})();
