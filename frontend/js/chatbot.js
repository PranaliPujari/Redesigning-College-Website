(function () {
    // 2. Chatbot Q&A Data
    const qaData = [
        {
            question: "What is Chetan Business School?",
            answer: "Chetan Business School (CBS) is a premier educational institution in Hubballi, established in 2011, offering MBA and MCA programs."
        },
        {
            question: "Where is CBS located?",
            answer: "CBS is located at 100 Feet Road, Tajanagar, Srinagar, Near President Hotel, Hubballi, Karnataka – 580031."
        },
        {
            question: "Which courses are offered at CBS?",
            answer: "CBS offers Master of Business Administration (MBA) and Master of Computer Applications (MCA) programs."
        },
        {
            question: "Is CBS affiliated with any university?",
            answer: "Yes, CBS is affiliated with Karnatak University, Dharwad."
        },
        {
            question: "Is CBS approved by AICTE?",
            answer: "Yes, CBS is approved by AICTE."
        },
        {
            question: "Why should I choose CBS?",
            answer: "CBS provides quality education, industry-relevant curriculum, experienced faculty, affordable courses, and strong placement support."
        },
        {
            question: "What facilities are available at CBS?",
            answer: "CBS offers experienced faculty, practical learning opportunities, industrial visits, placement support, and modern infrastructure."
        },
        {
            question: "Does CBS provide placement assistance?",
            answer: "Yes, CBS provides placement assistance and career readiness training for students."
        },
        {
            question: "What is the vision of CBS?",
            answer: "The vision of CBS is to foster leadership for the sustainable development of business organizations and society."
        },
        {
            question: "What is the mission of CBS?",
            answer: "CBS aims to foster values, leadership, communication skills, innovation, and overall student growth."
        },
        {
            question: "How can I contact CBS?",
            answer: "You can contact CBS at 733-787-9532 or email info@chetanbschool.org."
        },
        {
            question: "Does CBS organize industrial visits?",
            answer: "Yes, CBS organizes industrial visits to provide practical exposure to students."
        },
        {
            question: "What makes CBS different from other colleges?",
            answer: "CBS focuses on industry-oriented education, practical learning, leadership development, and career readiness."
        },
        {
            question: "Who can apply for the MBA program?",
            answer: "Graduates from recognized universities who meet admission requirements can apply for the MBA program."
        },
        {
            question: "Who can apply for the MCA program?",
            answer: "Students who meet the eligibility criteria for MCA admissions can apply for the MCA program."
        },
        {
            question: "Are scholarships available at CBS?",
            answer: "Yes, CBS provides information regarding scholarship opportunities for eligible students."
        },
        {
            question: "What skills do students develop at CBS?",
            answer: "Students develop leadership, communication, management, technical, analytical, and problem-solving skills."
        },
        {
            question: "How do I apply for admission?",
            answer: "You can apply through the admission enquiry form available on the CBS website or contact the admission office directly."
        },
        {
            question: "What are the college timings?",
            answer: "Please contact the college administration for the latest academic schedule and timings."
        },
        {
            question: "Does CBS focus on practical learning?",
            answer: "Yes, CBS combines academic learning with practical exposure, internships, projects, and industry interactions."
        }
    ];

    // Generate FAQ Buttons HTML
    let faqButtonsHTML = '';
    qaData.forEach((item, index) => {
        faqButtonsHTML += `<button class="faq-item" data-index="${index}">${item.question}</button>`;
    });

    // 1. Inject Chatbot HTML
    const chatbotHTML = `
        <div class="chatbot-container">
            <button class="chatbot-toggle-btn" id="chatbot-toggle" aria-label="Open Chat">
                <i class="fas fa-comment-dots"></i>
            </button>
            <div class="chatbot-window" id="chatbot-window">
                <div class="chatbot-header">
                    <button class="back-btn" id="chatbot-back"><i class="fas fa-chevron-left"></i> Back</button>
                    <span id="chatbot-title">CBS Assistend</span>
                    <button class="close-btn" id="chatbot-close">&times;</button>
                </div>
                <div class="chatbot-content" id="chatbot-content">
                    <div class="faq-list" id="faq-list">
                        <div class="chat-msg bot" style="margin-bottom: 10px;">Hello! Welcome to Chetan Business School. Select a question below:</div>
                        ${faqButtonsHTML}
                    </div>
                    <div class="answer-view" id="answer-view">
                        <div class="chat-msg user" id="user-question-bubble"></div>
                        <div class="chat-msg bot" id="bot-answer-bubble"></div>
                    </div>
                </div>
            </div>
        </div>
    `;

    // Clean up old chatbot if it exists
    const oldChatbot = document.querySelector('.chatbot-container');
    if (oldChatbot) {
        oldChatbot.remove();
    }

    document.body.insertAdjacentHTML('beforeend', chatbotHTML);

    // 3. Elements
    const toggleBtn = document.getElementById('chatbot-toggle');
    const closeBtn = document.getElementById('chatbot-close');
    const backBtn = document.getElementById('chatbot-back');
    const chatWindow = document.getElementById('chatbot-window');
    const faqList = document.getElementById('faq-list');
    const answerView = document.getElementById('answer-view');
    const userBubble = document.getElementById('user-question-bubble');
    const botBubble = document.getElementById('bot-answer-bubble');
    const title = document.getElementById('chatbot-title');

    // 4. Toggle Logic
    toggleBtn.addEventListener('click', () => {
        chatWindow.classList.add('active');
    });

    closeBtn.addEventListener('click', () => {
        chatWindow.classList.remove('active');
    });

    backBtn.addEventListener('click', () => {
        // Show list, hide answer
        answerView.classList.remove('active');
        faqList.style.display = 'flex';
        backBtn.classList.remove('active');
        title.textContent = '(CBS FAQ)';
    });

    // 5. FAQ Click Logic
    const faqItems = document.querySelectorAll('.faq-item');
    faqItems.forEach(item => {
        item.addEventListener('click', () => {
            const index = item.getAttribute('data-index');
            const data = qaData[index];

            // Set bubbles
            userBubble.textContent = data.question;
            botBubble.textContent = data.answer;

            // Hide list, show answer
            faqList.style.display = 'none';
            answerView.classList.add('active');
            backBtn.classList.add('active');
            title.textContent = 'Answer';
        });
    });

})();
