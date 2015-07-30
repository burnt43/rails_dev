# Rails Development

## Embedding EmberJS in a Rails 4 App

Add ember-rails and ember-source gems to my Gemfile
``` ruby 
gem 'ember-rails'
gem 'ember-source'
```

Then run bundle install
```ruby
bundle install
```

Run ember install. This puts the ember javascript files in the vendor dir.
``` ruby
rails g ember:install
```

Run the bootstrapper. I used regular old javascript, not coffescript
``` ruby
rails g ember:bootstrap --javascript-engine js
```

This bootstrap command will add in a bunch of directories in app/assets/javascripts like
<pre>
adapters
components
controllers
helpers
mixins
models
routes
templates
views
</pre>

It will also modify your application.js file. I take all these changes out and put them into a new file called ember_main.js For my app I do not want every page to have Ember running. I just want it for 1 particular page, so what I do is make an ember_main.js and make sure that Rails will compile all the Ember related stuff.

ember_main.js
``` javascript
//= require ember
//= require ember-data
//= require active-model-adapter
//= require_self
//= require ./ember_app
```

ember_app.js
``` javascript
//= require_tree ./adapters
//= require_tree ./mixins
//= require_tree ./models
//= require_tree ./controllers
//= require_tree ./views
//= require_tree ./helpers
//= require_tree ./components
//= require_tree ./templates
//= require_tree ./routes
//= require ./router
//= require_self
```

I tell Rails to compile ember_main.js. I add this line to my development environment file.
``` ruby
config.assets.precompile += %w( ember_main.js )
```

I also add this line. I'm not sure what it does or if it is needed.
``` ruby
config.ember.variant = :development
```

I put my Ember app in /emberjs. So I add a route for emberjs to go to my EmberJsController. I also add a route for all subpaths of /emberjs. You need to add this wildcard because of how Ember does its own routing.
``` ruby
get '/emberjs'         => 'ember_js#index'
get '/emberjs/*path'   => 'ember_js#index'
```

I make a simple EmberJsController that I mentioned earlier
``` ruby
class EmberJsController < ApplicationController
  def index
  end
end
```

I make a layout for the EmberJsController. I am using HAML. I am including the ember_main javascript file here. This will be the only page that has Ember enabled.
app/views/layouts/ember_js.html.haml:
``` haml
%html
  %head
    = stylesheet_link_tag    'application', media: 'all'
    = javascript_include_tag 'application'
    = javascript_include_tag 'ember_main'
  %body
    = yield
```

The index view is very simple. This is just a div with id="ember-app". I do this to give Ember a place to embed in. I will explain hwo to configure this below.
app/views/ember_js/index.html.haml:
``` haml
#ember-app
```

Now the Rails app should be all ready to go. We have to configure Ember to work now.
First thing to do is create an Embber Application. The bootstrap process from before generates this line for you.
I put this at the bottom of my ember_main.js file. I added the rootElement field here to tell Ember to go inside my ```<div id="ember-app"></div>``` from earlier.
``` javascript
App = Ember.Application.create({
  rootElement: '#ember-app'
});
```

I also modify router.js. I set 2 fields location and rootURL. I set location to auto. Ember has a few location settings, I find for just using Ember in 1 page of rails that this is the best. The Ember docs explain this well. Basically, this setting is for Ember routing. Ember will mess around with the URL in your browser unless you set location to 'none'. I am ok with Ember messing with the URL because if a user of the Ember app hits back or forward on the browser it will properly navigate. 
``` javascript
App.Router = Ember.Router.extend({
  location: 'auto',
  rootURL: '/emberjs/'
});
```

The last step to get a 'Hello World' working is to add an application template. 
Create templates/application.hbs. I use hbs(Handlebars), but you can use Emblem(I have not been able to get this to work).
```
<h1>Hello World</h1>
```

Now when you navigate to emberjs#index you should see Hello World.
