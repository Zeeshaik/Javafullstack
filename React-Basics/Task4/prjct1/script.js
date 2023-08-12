const questions = [
    {
      question: "What is the capital of France?",
      options: ["London", "Paris", "Berlin", "Rome"],
      answer: "Paris"
    },
    {
      question: "What is the largest planet in our solar system?",
      options: ["Mars", "Venus", "Jupiter", "Saturn"],
      answer: "Jupiter"
    },
    // Add more questions here
  ];
  
  const questionContainer = document.getElementById('question-container');
  const submitBtn = document.getElementById('submit-btn');
  
  function createQuestionElement(questionObj, index) {
    const questionElem = document.createElement('div');
    questionElem.classList.add('question');
    questionElem.innerHTML = `<p>${index + 1}. ${questionObj.question}</p>`;
    
    questionObj.options.forEach((option, i) => {
      const optionElem = document.createElement('div');
      optionElem.classList.add('option');
      optionElem.innerText = option;
      optionElem.addEventListener('click', () => selectOption(questionElem, i));
      questionElem.appendChild(optionElem);
    });
  
    return questionElem;
  }
  
  function selectOption(questionElem, selectedOptionIndex) {
    const options = questionElem.querySelectorAll('.option');
    options.forEach((option, index) => {
      if (index === selectedOptionIndex) {
        option.classList.add('selected');
      } else {
        option.classList.remove('selected');
      }
    });
  }
  
  function calculateScore() {
    let score = 0;
    questions.forEach((questionObj, index) => {
      const options = questionContainer.children[index].querySelectorAll('.option');
      options.forEach((option, i) => {
        if (option.classList.contains('selected') && questionObj.options[i] === questionObj.answer) {
          score++;
        }
      });
    });
    return score;
  }
  
  function displayScore(score) {
    const resultElem = document.createElement('p');
    resultElem.innerHTML = `<strong>Your Score: ${score} out of ${questions.length}</strong>`;
    questionContainer.appendChild(resultElem);
  }
  
  function initializeQuiz() {
    questions.forEach((question, index) => {
      const questionElem = createQuestionElement(question, index);
      questionContainer.appendChild(questionElem);
    });
  
    submitBtn.addEventListener('click', () => {
      const score = calculateScore();
      displayScore(score);
      submitBtn.style.display = 'none';
    });
  }
  
  initializeQuiz();
  