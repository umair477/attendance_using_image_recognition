from flask import Flask,jsonify,request,abort,send_file

from face_recog import recognize
import werkzeug
from werkzeug.utils import secure_filename
names=[]



app = Flask(__name__)
@app.route('/upload_image',methods=['POST'])
def handle_image():
    
    imagefile = request.files["image"]
    # Getting file name of the image using werkzeug library
    filename = werkzeug.utils.secure_filename(imagefile.filename)
    imagefile.save(filename)
    names,file_name=recognize(filename)
    f = open("names.txt", "w")
    f.write(str(names))
    f.close()
    #print(names)
    return send_file(file_name, mimetype='image/gif')



@app.route('/output_list',methods=['POST'])
def handle_output_list():
    content = request.get_json()
    imgname = content['file_name']
    f = open("names.txt", "r")
    data = f.read()
    data = data.replace("'","")
    data = data.replace("["," ")
    data = data.replace("]","")
    data = data.split(",")
    resp = jsonify({'list' : data})
    resp.status_code = 200
    #print(names)
    return resp

if __name__=="__main__":
    app.run(host="0.0.0.0", port="3000", threaded=True)