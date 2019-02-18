## Introduction 
This is a pure copy&paste of a part from [Active Record Query Interface — Ruby on Rails Guides](https://guides.rubyonrails.org/active_record_querying.html#conditions). The guide is very thorough and super informative.

## Array Conditions
What if that number could vary, say as an argument from somewhere? The find would then take the form:

```ruby
Client.where("orders_count = ?", params[:orders])
```

Active Record will take the first argument as the conditions string and any additional arguments will replace the question marks (?) in it.

If you want to specify multiple conditions:

```ruby
Client.where("orders_count = ? AND locked = ?", params[:orders], false)
```

In this example, the first question mark will be replaced with the value in `params[:orders]` and the second will be replaced with the SQL representation of false, which depends on the adapter.

This code is highly preferable:

```ruby
Client.where("orders_count = ?", params[:orders])
to this code:
```

`Client.where("orders_count = #{params[:orders]}")`
because of argument safety. Putting the variable directly into the conditions string will pass the variable to the database as-is. This means that it will be an unescaped variable directly from a user who may have malicious intent. If you do this, you put your entire database at risk because once a user finds out they can exploit your database they can do just about anything to it. Never ever put your arguments directly inside the conditions string.
