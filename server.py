from flask import Flask, redirect, render_template_string, url_for
import os


app = Flask(__name__)

@app.route('/')
def index():
	return render_template_string("""
		<a href="/">home</a>
		<br>
		<a href="/redirect">redirect to home</a>
		<br>
		<a href="/absolute-redirect">absolute redirect to home</a>
		""")

@app.route('/redirect')
def other():
	return redirect('/')

@app.route('/absolute-redirect')
def another():
	url = url_for('index', _external=True, _scheme='https')
	print 'url', url
	return redirect(url)


if __name__ == '__main__':
	# context = ('ssl.cert', 'ssl.key')
	PORT = int(os.environ.get('PORT', 5000))
	app.run(debug=True, host='0.0.0.0', port=PORT)

