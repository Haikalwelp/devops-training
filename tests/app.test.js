const { greet } = require('../src/app');

test('greet function returns correct greeting', () => {
  expect(greet('World')).toBe('Hello, World!');
});