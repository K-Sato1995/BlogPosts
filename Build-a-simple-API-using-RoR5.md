#Overview
 Here is a simple guideline to create a simple API with RoR5. In this post, I'll create a simple blog like application that users can read, create, update and delete posts on.

#Table of contents

1. [Create the application](#create-the-application)
- [Create the controller and model for Post](#create-the-controller-and-model-for-post)
- [Set up Routes with namespaces](#set-up-routes-with-namespaces)
- [Set up the Post controller](#set-up-the-post-controller)


#Create the application
 You can make an API-only RoR application by just adding `--api` at the end of `rails new` command.

```console
$ rails new blog --api
```
#Create the controller and model for Post
 You can generate the `Post Controller` and `Post Model` by running commands below.

```console
$ rails g model post title:string
$ rails g controller posts
$ rake db:migrate
```

#Set up Routes with namespaces
 `Namespaces` enable you to easily control the version of your API. 

```Ruby
Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :posts
    end
  end
end
```

 The code above creates routes like this. (You can check the routes of your application with `rake routes` command.)

```console
api_v1_posts GET    /api/v1/posts(.:format)     api/v1/posts#index
             POST   /api/v1/posts(.:format)     api/v1/posts#create
 api_v1_post GET    /api/v1/posts/:id(.:format) api/v1/posts#show
             PATCH  /api/v1/posts/:id(.:format) api/v1/posts#update
             PUT    /api/v1/posts/:id(.:format) api/v1/posts#update
             DELETE /api/v1/posts/:id(.:format) api/v1/posts#destroy
```

#Set up the Post controller.
 Create the `api` and `v1` directories under your _controllers directory_. Your _controllers directory_ should look like this.

```Ruby 
---- controllers

      --- api

        -- v1

         - posts_controller.rb
```
 
 Create methods for reading, creating, updating and deleting objects with `ajax request` like the code below.

```Ruby 
module Api
  module V1
    class PostsController < ApplicationController
      def index
        posts = Post.order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'loaded posts', data: posts }, status: :ok
      end

      def show
        post = Post.find(params[:id])
        render json: { status: 'SUCCESS', message: 'loaded the post', data: post }, status: :ok
      end

      def create
        post = Post.new(post_params)
        if post.save
          render json: { status: 'SUCCESS', message: 'loaded the post', data: post }, status: :ok
        else
          render json: { status: 'ERROR', message: 'post not saved', data: post.errors }, status: :error
        end
      end

      def destroy
        post = Post.find(params[:id])
        post.destroy
        render json: { status: 'SUCCESS', message: 'deleted the post', data: post }, status: :ok
      end

      def update
        post = Post.find(params[:id])
        if post.update(post_params)
          render json: { status: 'SUCCESS', message: 'updated the post', data: post }, status: :ok
        else
          render json: { status: 'SUCCESS', message: 'loaded the post', data: post }, status: :ok
        end
      end

      private

      def post_params
        params.require(:post).permit(:title)
      end
    end
  end
end
```

You can use [Postman](https://www.getpostman.com/) to check if your api is working correctly.
