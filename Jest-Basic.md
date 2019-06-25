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
# References 

- [jestbasics](http://frantic.im/jestbasics/)
- [Jest](https://jestjs.io/docs/en/getting-started.html)
