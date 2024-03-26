from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('welcome.html')

if __name__ == '__main__':
    # host=0.0.0.0 allows the app to be accessible from any device on the network
    app.run(host='0.0.0.0', debug=True)