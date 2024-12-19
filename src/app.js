function greet(name) {
  return `Hello, ${name}!`;
}

document.addEventListener('DOMContentLoaded', () => {
  const contentDiv = document.getElementById('content');
  contentDiv.textContent = 'Welcome to the DevOps Training Project!';
});

module.exports = { greet };