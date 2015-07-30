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
