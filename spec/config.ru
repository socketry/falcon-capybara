
run lambda { |env| [200, {"Content-Type" => "text/html"}, [<<~BODY]] }
<!DOCTYPE html>
<html>
	<head>
		<title>Test</title>
	</head>
	<body>
		<h1>Hello World (#{env['rack.url_scheme']})</h1>
	</body>
</html>
BODY
