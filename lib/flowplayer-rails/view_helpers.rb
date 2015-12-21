module FlowplayerRails
  module ViewHelpers

    def flowplayer(options = {})
      files = options[:files] || {'mp4' => options[:file]}
      element_options = {}.tap do |h|
        h[:class] = options[:class] || 'flowplayer'
        h[:id] = options[:id] || "fb-#{(Time.now.to_f * 1000).round}"
        h[:data] = {
          :swf => asset_path('flowplayer/flowplayer.swf'),
          :swfHls => asset_path('flowplayer/flowplayerhls.swf')
        }
        h[:data].merge! options.slice(:autoplay, :fullscreen, :keyboard, :muted, :poster, :ratio, :volume, :swf)
      end

      "#{
      content_tag 'div', element_options do
        content_tag 'video' do
          files.map do |type, file|
            content_tag('source', nil, type: "video/#{type}", src: file)
          end.join("\n").html_safe
        end
      end
      }#{
      content_tag "script", :type => "text/javascript" do
        raw("flowplayer(document.getElementById('#{element_options[:id]}'))")
      end
      }".html_safe
    end

  end
end