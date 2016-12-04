from flask import Flask, redirect, render_template_string, url_for
import os


app = Flask(__name__)

@app.route('/')
def index():
	return render_template_string("""
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>HTTPS redirect test</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>

<body>
	<a href="/">home</a>
	<br>
	<a href="/redirect">redirect to home</a>
	<br>
	<a href="/absolute-redirect">absolute redirect to home</a>
	<br>
	<a href="/absolute-redirect-https">absolute https redirect to home</a>
</body>

</html>
""")

@app.route('/redirect')
def other():
	url = url_for('index')
	print 'url', url
	return redirect('/')

@app.route('/absolute-redirect')
def another():
	url = url_for('index', _external=True)
	print 'url', url
	return redirect(url)

@app.route('/absolute-redirect-https')
def yet_another():
	url = url_for('index', _external=True, _scheme='https')
	print 'url', url
	return redirect(url)


if __name__ == '__main__':
	# context = ('ssl.cert', 'ssl.key')
	PORT = int(os.environ.get('PORT', 5000))
	app.run(debug=True, host='0.0.0.0', port=PORT)

