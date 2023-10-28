from flask import Flask

from flask_mysqldb import MySQL
from config import config 
from flask import Flask, render_template ,jsonify


app=Flask(__name__)

conexion= MySQL(app)

# Ruta para servir archivos estáticos (JavaScript y CSS)
app.add_url_rule('/static/styles.css', 'static', build_only=True)
app.add_url_rule('/static/script.js', 'static', build_only=True)


@app.route("/")
def index():
    return render_template("index.html")  # Aquí renderiza "index.html"

"""
@app.route('/CC')

def mostrar_CC():
    try:
        cursor = conexion.connection.cursor()
        sql = "Select CC from Users"
        cursor.execute(sql)
        datos = cursor.fetchall()    
        print(datos)
        return "users ok"
    except Exception as ex:
        print("Error:", str(ex))
        return "ha ocurrido un error"    
"""

@app.route('/CC')
def mostrar_CC():
    try:
        cursor = conexion.connection.cursor()
        sql = "SELECT CC FROM Users"
        cursor.execute(sql)
        datos = cursor.fetchall()

        # Extrae las CC de los resultados
        cc_list = [str(dato[0]) for dato in datos]

        return jsonify(cc_list)
    except Exception as ex:
        print("Error:", str(ex))
        return jsonify([])  # Devuelve una lista vacía en caso de error

# Configura la ubicación de las plantillas (templates)
app.template_folder = 'templates'




@app.route("/buscar_personas", methods=["GET"])
def buscar_personas():
    try:
    # Implementa la lógica para buscar personas según habilidades en la base de datos
    # Retorna los resultados en formato JSON
        cursor = conexion.connection.cursor()
        sql = "Select CC from Users"
        cursor.execute(sql)
        datos = cursor.fetchall()    
        print(datos)
        return "users ok"
    except Exception as ex:
        print("Error:", str(ex))
        return "ha ocurrido un error"    

@app.route("/crear_transaccion", methods=["POST"])
def crear_transaccion():
    try:
    # Implementa la lógica para crear una nueva transacción
    # Actualiza la base de datos con los detalles de la transacción
        cursor = conexion.connection.cursor()
        sql = "Select CC from Users"
        cursor.execute(sql)
        datos = cursor.fetchall()    
        print(datos)
        return "users ok"
    except Exception as ex:
        print("Error:", str(ex))
        return "ha ocurrido un error"    


def page_not_found(error):
    return"<h1>The page does not exist<h1>"
if __name__ == '__main__':
    app.config.from_object(config['development'])
    app.register_error_handler(404,page_not_found)
    app.run()

