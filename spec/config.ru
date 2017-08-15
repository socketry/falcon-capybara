
HELLO_WORLD = <<-EOF
<!DOCTYPE html>
<html>
	<head>
		<title>Test</title>
	</head>
	<body>
		<h1>Hello World</h1>
	</body>
</html>
EOF

run lambda { |env| [200, {"Content-Type" => "text/html"}, [HELLO_WORLD]] }
