require 'flowplayer-rails/view_helpers'
module FlowplayerRails
  class Engine < Rails::Engine

    initializer 'flowplayer-sass.assets.precompile' do |app|

      app.config.assets.paths << root.join('vendor', 'assets', 'fonts')
      app.config.assets.paths << root.join('vendor', 'assets', 'swfs')

      unless Sprockets::Rails::VERSION.split('.', 2)[0].to_i >= 3
        app.config.assets.precompile << %r(flowplayer/fpicons\.(?:eot|svg|ttf|woff?)$)
        app.config.assets.precompile << %r(flowplayer/.+\.(?:png|swf?)$)
      end

    end

    initializer 'flowplayer-sass.view_helpers' do
      ActionView::Base.send :include, FlowplayerRails::ViewHelpers
    end

  end
end