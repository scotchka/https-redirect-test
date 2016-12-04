from flask import Flask, redirect, render_template_string, url_for, request, flash
import os


app = Flask(__name__)

app.config['SECRET_KEY'] = 'abc'

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
	{% with messages = get_flashed_messages() %}
	  {% if messages %}
	    <ul>
	    {% for message in messages %}
	      <li>{{ message }}</li>
	    {% endfor %}
	    </ul>
	  {% endif %}
	{% endwith %}
	<a href="/">home</a>
	<br>
	<a href="/redirect">redirect to home</a>
	<br>
	<a href="/redirect?external=True">absolute redirect to home</a>
	<br>
	<a href="/redirect?external=True&scheme=https">absolute https redirect to home</a>
</body>

</html>
""")

@app.before_request
def before():
	print 'request', request.url
	flash('request ' + request.url)

@app.route('/redirect')
def other():
	external = bool(request.args.get('external', False))
	scheme = request.args.get('scheme')
	url = url_for('index', _external=external, _scheme=scheme)
	print 'url', url
	response = redirect(url)
	print response.headers
	return response

if __name__ == '__main__':
	PORT = int(os.environ.get('PORT', 5003))
	# app.run(debug=True, host='0.0.0.0', port=PORT)
	app.run(debug=True, host='0.0.0.0', port=PORT, ssl_context=('ssl.cert', 'ssl.key'))

