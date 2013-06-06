use Rack::Static,
  :urls => ["/img", "/js", "/style","/font-awesome"],
  :root => "public",
  :index => "index.html"

  run lambda { |env|
    [
      200,
      {
        'Content-Type'  => 'text/html',
        'Cache-Control' => 'public, max-age=86400'
      },
      File.open("public/#{env['PATH_INFO']}", File::RDONLY)
    ]
  }

