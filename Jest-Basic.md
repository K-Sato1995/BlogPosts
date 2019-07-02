# Jest Basic 
Jest is a JavaScript unit testing framework built by Facebook.

# Directory Structure 

```
- myProgram.js
- __tests__
   - myProgram-test.js
```

# Basic Syntax 

Each test file looks something like this:

```javascript
const MathModule = require('../myMath');   // 1

describe('my math module', () => {         // 2
  it('adds two numbers', () => {           // 3
    // Your testing code goes here
  });
});
```

- `describe` defines a set of tests.
- `it` defines a single test.

You can run the test with `jest` command.

```
$ jest
```

# Assertions

```javascript
expect(value).toBe(something);
```

## Useful matchers

- `toBe`:  compare 2 values using `===` operator.

```javascript
expect(2).toBe(2);   // OK
```

- `toEqual`: recursively compares two values.

```javascript
expect({}).toEqual({});  // OK
```

- `toContain`: makes sure the array has the given item.

```javascript
expect([1, 2, 3]).toContain(1); // OK
```

- `toThrow`: checks if the given function throws an error.

```javascript
expect(() => { undefined() }).toThrow(); // OK
```

- `not`: useful to inverse the expectation.

```javascript
expect(2).not.toBe(4); // OK
```

You can see other matchers [here](https://jestjs.io/docs/en/api).


# Async tests
JavaScript relies on callbacks in many cases and Jest supports testing asynchronous code.

```javascript
describe('my async module', () => {
  it('supports promises', () => {
    return new Promise((resolve) => {
      setTimeout(resolve, 1000);
    })
  });

  it('supports async/await', async () => {
    await saveUser({...});
  });
});
```

# LifeCycle

If you need to add some setup/teardown logic, use `beforeEach`/`afterEach` and `beforeAll`/`afterAll`:

```javascript
describe('my math module', () => {
  beforeAll(() => {
    console.log('This is executed before the test suite');
  });

  beforeEach(() => {
    console.log('This is executed before each testcase');
  });

  it('adds two numbers', () => {
    expect(() => { undefined() }).toThrow()
  });
});
```

# Test with Enzyme
`Enzyme` is a JavaScript Testing utility for React that makes it easier to test your React Components' output. 

## Set up

```
npm install --save-dev enzyme enzyme-adapter-react-16 react-test-renderer
```

create `src/setupTests.js` file.

```javascript
import { configure } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

configure({ adapter: new Adapter() });
```

## Shallow()

if you want to test the `<App />` component, you can extend our `App.test.js` file by adding the following.
The `shallow()` will test the provided component and ignores any child components that may be present in the component tree thereafter. if we had a `<Header />` and `<Footer />` component within `<App />` for example, they would be ignored in this test.

```
import React from 'react';
import { shallow } from 'enzyme';
import App from './App';

describe('First React component test with Enzyme', () => {
   it('renders without crashing', () => {
      shallow(<App />);
    });
});
```
# References 

- [jestbasics](http://frantic.im/jestbasics/)
- [Jest](https://jestjs.io/docs/en/getting-started.html)
- [Enzyme](https://airbnb.io/enzyme/)
- [Testing in React with Jest and Enzyme: An Introduction](https://medium.com/@rossbulat/testing-in-react-with-jest-and-enzyme-an-introduction-99ce047dfcf8)
- [React Unit Testing Using Enzyme and Jest | Toptal](https://www.toptal.com/react/tdd-react-unit-testing-enzyme-jest)
