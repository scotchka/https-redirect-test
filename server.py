from flask import Flask, redirect, render_template_string
import os


app = Flask(__name__)

@app.route('/')
def index():
	return render_template_string("""
		<a href="/redirect">link</a>
		""")

@app.route('/redirect')
def other():
	return redirect('/')


if __name__ == '__main__':
	# context = ('ssl.cert', 'ssl.key')
	PORT = os.environ.get('PORT', 5000)
	app.run(debug=True, host='0.0.0.0', port=PORT)

