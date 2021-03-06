# Before and After hooks

 You can specify when to run a set of code by using `hooks`. 
 The most common hooks in Rspec are `before` and `after` hooks. 

```ruby 
before(:example) #run before each example
before(:each) #run before each example 
before(:context) # run one time only, before all of the examples in a group
before(:all) # run one time only, before all of the examples in a group

after(:example) # run after each example
after(:each) # run after each example
after(:context) # run one time only, after all of the examples in a group
after(:all) # run one time only, after all of the examples in a group
```

`before` and `after` blocks are called in the fallowing order.

```ruby 
before :context(all)
before :example(each)
after  :example(each)
after  :context(all)
```
 Let's see some examples below.
 
```Ruby 
describe 'Post' do
  before(:each) do
    puts 'before(:each)'
  end
  before(:all) do
    puts 'before(:all)'
  end
  after(:each) do
    puts 'after(:each)'
  end
  after(:all) do
    puts 'after(:all)'
  end

  it 'tests hooks' do
    puts 'test case1'
  end

  it 'tests hooks' do
    puts 'test case2'
  end
end
```
 The result of the above code would be like this.

```Ruby 
before(:all)
before(:each)
test case1
after(:each)
before(:each)
test case2
after(:each)
after(:all)
```

 With `before` and `after` hooks, you can create, delete or update the data very flexibly.

```Ruby 
  describe 'Hooks' do
    before(:all) do
      @obj1 = 'string'
    end

    it 'tests before(all)' do
      expect(@obj1).to include('s')
    end
  end
```
# Let
 `let` helps DRY up your tests.  If you write `let(:foo){ ... }`, you can retribute values that are defines in `{ ... }` from `foo`.
 
  Here is what I mean.

```Ruby 
  describe 'Let' do
    let(:post) { Post.new(title: 'Ruby', author: 'J') }

    it 'tests let' do
      puts post.title #=> Ruby
      puts post.author #=> J
    end
  end
```

 As you can see in the code above, `post` has `{ title: 'Ruby, author: 'J' }` and you can retrieve those values with `post.title` and `post.author`. 

### Let is lazily evaluated 
 One thing you should keep in your mind about `let` is that it is lazily evaluated that means it is not evaluated until the first time it's invoked. You can use `let!` to force the method's invocation before each example.

```Ruby 
 describe 'Let' do
    let(:post) { Post.new(title: 'Ruby', author: 'J') } #let is not evaluated here.

    it 'tests let' do
      puts post.title #=> Ruby #let(:post) is evaluated here.
      puts post.author #=> J
    end
  end
```

 The value will be cached across multiple calls in the same example but __not across examples__.

```Ruby 
$count = 0

describe "let" do
  let(:count) { $count += 1 } #Add 1 to count every time let is evaluated.

  it "memoizes the value" do
    count.should == 1
    count.should == 1 #The value will be cached across multiple calls in the same example.
  end

  it "is not cached across examples" do
    count.should == 2 #The value is NOT cached across examples
  end
end
```

### Practical examples of "let"
 I am going to compare two sets of code to show how `let` DRYs your code up.
 In __Example①__, I'll write specs without `let`, while in __Example②__, I'll test the same things with `let`.

__Example①__

```Ruby 
describe 'Post' do
    
  context 'When the author is Jack' do
    before(:all) do
      post = Post.new(title: 'Ruby', author: 'Jack')
    end
      
    it 'was posted by Jack' do
      expect(post.author).to eq 'Jack'
    end
  end
    
  context 'When the author is Mike' do
    before(:all) do
      post = Post.new(title: 'Ruby', author: 'Mike')
    end
      
    it 'was posted by Mike' do
      expect(post.author).to eq 'Mike'
    end
  end
end
```

 In __Example①__, there are two `before` blocks that virtually do the same thing and it seems very redundant. So I'll DRY it up in the __Example②__.

__Example②__

```Ruby 
describe 'Post' do
  let(:post) { Post.new(params) }
  let(:params) { { title: 'Ruby', author: author } }
    
  context 'When the author is Jack' do
    let(:author) { 'Jack' }
    
    it 'was posted by Jack' do
      expect(post.author).to eq 'Jack'
    end
  end
    
  context 'When the author is Mike' do
    let(:author) { 'Mike' }
    
    it 'was posted by Mike' do
      expect(post.author).to eq 'Mike'
    end
  end
end
```

In __Example②__, I defined `let` before two example-groups and only changed the `author` of `post` in each context. This prevents you from defining essentially the same thing over and over again.

#Subject
 The `subject` keyword refers to the object being tested. For instance, `Post` is the subject of this example group in the code below. 

```Ruby
describe Post do 
  #tests
end
```


## Implicitly defined subject
 By default, If the first argument to the outermost example group is a class, RSpec implicitly creates an instance of that class and assigns it to the subject. 

```Ruby
describe Post do 
  it 'is implicitly instatiated by Rspec' do 
    expect(subject).to be_an(Post) #You can refer to the object as 'subject'
  end 
end
```

 In the code above, `subject` is used in the example even though it is not defined anywhere in the code. This is because Rspec implicitly created an instance from `Post` and assigned it to `subject`.

## Explicit subject
 `subject` also can be defined explicitly. Readers can see how it's instantiated.

```Ruby
describe Post do
  subject { Post.new }
  it 'tests subject' do 
    expect(subject).to be_a(Post)
  end
end
```

 You can give the subject a name.

```Ruby
describe Post do
  subject(:post) { Post.new }
  it 'tests subject' do 
    expect(post).to be_a(Post)
  end
end
```

 Even if you name the subject, you can still refer to it anonymously:

```Ruby
describe Post do
  subject(:post) { Post.new }
  it 'tests subject' do 
    expect(subject).to be_a(Post)
  end
end
```

## One-liner syntax
 RSpec supports a `one-liner syntax` for setting an expectation on the
subject.  With Rspec `one-liner syntax`, you can make code like __Example③__ shorter like __Example④__.

__Example③__

```Ruby 
describe Post do 
  it 'is implicitly instatiated by Rspec' do 
    expect(subject).to be_an(Post) 
  end 
end
```

__Example④__

```Ruby
describe Post do
  it { is_expected.to be_a(Post) }
end
```

 You can see more information about `subject` and `one-liner syntax` [here](https://relishapp.com/rspec/rspec-core/v/3-8/docs/subject/one-liner-syntax)
