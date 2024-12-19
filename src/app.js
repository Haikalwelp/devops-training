function greet(names) {
  return `Hello, ${names}!`;
}

document.addEventListener('DOMContentLoaded', () => {
  const contentDiv = document.getElementById('content');
  contentDiv.textContent = 'Helo Bapak!';
});

module.exports = { greet };