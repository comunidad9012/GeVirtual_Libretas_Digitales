from apiwsgi import Wsgiclass
from whitenoise import WhiteNoise
from jinja2 import Environment, FileSystemLoader
import mysql.connector 
from webob import Request, Response
from wsgiref.simple_server import make_server
import cgi
import os

#waitress-serve --listen=127.0.0.1:8000 aplicacion:app
#.\env\Scripts\activate

template_dir = os.path.join(os.path.dirname(__file__), 'templates')
env = Environment(loader=FileSystemLoader(template_dir))

conexion1 = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="PROGRAMACION2023",
    database="mydb"
)

cursor1 = conexion1.cursor()

app = Wsgiclass()

@app.ruta("/")
def index(request, response):
    template= env.get_template('index.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response



@app.ruta('/iniciopag')
def inicio(request, response):
    template= env.get_template('iniciopag.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response

#CARRERAS
@app.ruta('/carreras')
def carreras(request, response):
    template= env.get_template('carreras.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response


#CONSULTA A CARRERAS
@app.ruta('/consultacarreras')
def consulta (request, response):
    template= env.get_template('consultacarreras.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response


@app.ruta('/DS')
def desarrollo (request, response):
    template= env.get_template('DS.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response

@app.ruta('/AE')
def administracion (request, response):
    template= env.get_template('AE.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response

@app.ruta('/CR')
def computacion (request, response):
    template= env.get_template('CR.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response

@app.ruta('/SH')
def seguridad (request, response):
    template= env.get_template('SH.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response

@app.ruta('/TB')
def biomedica (request, response):
    template= env.get_template('TB.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response

@app.ruta('/OV')
def viales (request, response):
    template= env.get_template('OV.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response


#ABM DE CARRERAS
@app.ruta('/abmcarreras')
def carreras(request, response):
    
    cursor1.execute("SELECT * FROM carrera")
    
    resultados = cursor1.fetchall()

    template= env.get_template('abmcarreras.html')
    rendered_html = template.render(cursor1=resultados)
    response=Response()
    response.text = rendered_html
    return response

#REGISTRAR CARRERAS
@app.ruta('/registrarC', methods=['POST'])
def registrarC(request, response):
    Nombre = request.POST.get('name')
    Resolucion = request.POST.get('resolucion')
    Modalidad = request.POST.get('modalidad')
    Duracion = request.POST.get('duracion')

    cursor1.execute ("INSERT INTO Carrera(Nombre,Resolucion,Modalidad,Duracion) VALUES (%s,%s,%s,%s)", (Nombre, Resolucion, Modalidad, Duracion))
    conexion1.commit()
    #SIRVE PARA REDIRECCIONAR
    response=Response()
    response.status_code = 302
    response.headers['Location'] = '/abmcarreras'
    return response

#BORRAR CARRERAS
@app.ruta('/borrarC', methods=['POST'])
def borrarC (request, response):

    id = request.POST.get('id_carrera')

    cursor1.execute(f"delete FROM Carrera WHERE (`ID_Carrera` = '{id}')")
    conexion1.commit()
    response=Response()
    response.status_code = 302
    response.headers['Location'] = '/abmcarreras'
    return response

#EDITAR CARRERAS
@app.ruta('/editarC', methods=['POST'])
def editarC (request, response):

    id = request.POST.get('id_carrera')

    cursor1.execute(f"select * FROM Carrera WHERE (`ID_Carrera` = '{id}')")
    datos_carrera = cursor1.fetchone()
    conexion1.commit()



    template= env.get_template('editcarrera.html')
    rendered_html = template.render(datos_carrera=datos_carrera)
    response=Response()
    response.text = rendered_html
    return response

#CONFIRMAR MODIFICACION DE LA CARRERA
@app.ruta('/confirC', methods=['POST'])
def confirC (request, response):
    id = request.POST.get('id')
    Nombre = request.POST.get('name')
    Resolucion = request.POST.get('resolucion')
    Modalidad = request.POST.get('modalidad')
    Duracion = request.POST.get('duracion')

    try:

        cursor1.execute (f"UPDATE `mydb`.`carrera` SET `Nombre` = '{Nombre}', `Resolucion` = '{Resolucion}', `Modalidad` = '{Modalidad}', `Duracion` = '{Duracion}' WHERE (`ID_carrera` = '{id}');")
    except Exception as e:
        print("Error mysql:", str(e))
    conexion1.commit()
    response=Response()
    response.status_code = 302
    response.headers['Location'] = '/abmcarreras'
    return response

#ALUMNOS
@app.ruta('/alumnos')
def alumnos(request, response):
    template= env.get_template('alumnos.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response

#CONSULTA DE ALUMNOS
@app.ruta('/consalum')
def consalum(request, response):
    template= env.get_template('consultaalumnos.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response


#CONSULTA DE ALUMNOS POR CARRERA Y AÑO ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@app.ruta('/alumcon',methods=['POST'])
def alumcon(request, response):
    
    
    num = request.POST.get('num_carrera')
    aio = request.POST.get('aio')

    
    
    
    cursor1.execute("SELECT alumnos.*, carrera.nombre FROM alumnos JOIN carrera ON alumnos.ID_carre_corresp = carrera.ID_carrera WHERE alumnos.ID_carre_corresp = %s AND alumnos.anio = %s;", (num, aio))

    
    resultados = cursor1.fetchall()

    template = env.get_template('consultaalumnos.html')
    rendered_html = template.render(cursor1=resultados)
    response = Response()
    response.text = rendered_html
    return response
        
      
#ABM ALUMNOS
@app.ruta('/abmalumnos')
def alum(request, response):
    template= env.get_template('abmalumnos.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response
    
#CONSULTA DE ALUMNOS POR CARRERA Y AÑO EN ABM
@app.ruta('/alumcon2',methods=['POST'])
def alumcon2(request, response):
    
    
    num = request.POST.get('num_carrera')
    aio = request.POST.get('aio')
    
    cursor1.execute("SELECT * FROM alumnos WHERE id_carre_corresp = %s AND anio = %s;", (num, aio))
    
    resultados = cursor1.fetchall()

    template = env.get_template('abmalumnos.html')
    rendered_html = template.render(cursor1=resultados)
    response = Response()
    response.text = rendered_html
    return response


#MATRICULAR ALUMNOS
@app.ruta('/matricularA', methods=['POST'])
def matricularA (request, response):
    Nombre = request.POST.get('name')
    Apellido = request.POST.get('apellido')
    DNI = request.POST.get('dni')
    Domicilio = request.POST.get('domicilio')
    Email = request.POST.get('email')
    Edad = request.POST.get('edad')
    Genero = request.POST.get('genero')
    IDC = request.POST.get('idc')
    Año = request.POST.get('anio')

    cursor1.execute ("INSERT INTO Alumnos(Nombre,Apellido,DNI,Domicilio,Email,Edad,Género,id_carre_corresp, anio) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)", (Nombre, Apellido, DNI, Domicilio,Email,Edad,Genero,IDC,Año))
    conexion1.commit()
    #SIRVE PARA REDIRECCIONAR
    response=Response()
    response.status_code = 302
    response.headers['Location'] = '/abmalumnos'
    return response

#EDITAR DATOS DE ALUMNOS
@app.ruta('/editarA', methods=['POST'])
def editarA (request, response):

    id = request.POST.get('id_alumno')

    cursor1.execute(f"select * FROM Alumnos WHERE (`ID_Alum` = '{id}')")
    datos_alumno = cursor1.fetchone()
    conexion1.commit()



    template= env.get_template('editalumno.html')
    rendered_html = template.render(datos_alumno=datos_alumno)
    response=Response()
    response.text = rendered_html
    return response

#CONFIRMAR MODIFICACION DEL ALUMNO
@app.ruta('/confirA', methods=['POST'])
def confirA (request, response):
    id = request.POST.get('id')
    Nombre = request.POST.get('name')
    Apellido = request.POST.get('apellido')
    DNI = request.POST.get('dni')
    Domicilio = request.POST.get('domicilio')
    Email = request.POST.get('email')
    Edad = request.POST.get('edad')
    Genero = request.POST.get('genero')
    IDC = request.POST.get('idc')
    Año = request.POST.get('anio')


    try:
        resultado = f"UPDATE `mydb`.`Alumnos` SET `Nombre` = '{Nombre}', `Apellido` = '{Apellido}', `DNI` = '{DNI}', `Domicilio` = '{Domicilio}',`Email` = '{Email}', `Edad` = '{Edad}', `Género` = '{Genero}', `id_carre_corresp` = '{IDC}', `anio` = '{Año}' WHERE (`ID_Alum` = '{id}');"
        cursor1.execute (resultado)
    except Exception as e:
        print("Error mysql:", str(e))
    conexion1.commit()
    response=Response()
    response.status_code = 302
    response.headers['Location'] = '/abmalumnos'
    return response

#BORRAR ALUMNO
@app.ruta('/borrarA', methods=['POST'])
def borrarC (request, response):

    id = request.POST.get('id_alumno')

    cursor1.execute(f"delete FROM Alumnos WHERE (`ID_Alum` = '{id}')")
    conexion1.commit()
    response=Response()
    response.status_code = 302
    response.headers['Location'] = '/abmalumnos'
    return response

#CARGAR CALIFICACIONES DE ALUMNOS 
@app.ruta('/cargarcalificacion')
def cargarcali(request, response):
    template= env.get_template('cargarcalificacion.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response

#CONSULTA DE ALUMNOS POR CARRERA Y AÑO
@app.ruta('/conspcar',methods=['POST'])
def conspcar(request, response):
    
    
    num = request.POST.get('num_carrera')
    aio = request.POST.get('aio')

    
    cursor1.execute("SELECT * FROM alumnos WHERE ID_carre_corresp = %s AND anio = %s;", (num, aio))
    
    
    resultados = cursor1.fetchall()

    template = env.get_template('cargarcalificacion.html')
    rendered_html = template.render(cursor1=resultados)
    response = Response()
    response.text = rendered_html
    return response

#TRAER LIBRETA PARA CARGAR CALIFICACION CON ID DEL ALUMNO
@app.ruta('/cargarnota', methods=['POST'])
def cargarnota (request, response):

    id = request.POST.get('id_alumno')
    carrera = request.POST.get('id_carrera')
    año = request.POST.get('id_anio')
    resultado={}
    resultado['id']= id
    
    cursor1.execute("SELECT * FROM materias WHERE ID_carre_corresp = %s AND anio = %s;", (carrera, año))

    resultado['materias']=cursor1.fetchall() 

    template= env.get_template('notaalumno.html')
    rendered_html = template.render(resultado=resultado)
    response=Response()
    response.text = rendered_html
    return response
   
#CONFIRMAR CARGA DE CALIFICACION DEL ALUMNO
@app.ruta('/confirnotas', methods=['POST'])
def confirA (request, response):
    id = request.POST.get('id')
    Materia = request.POST.get('materia')
    Evaluacion = request.POST.get('evaluacion')
    Calificacion = request.POST.get('calificacion')


    try:
        cursor1.execute ("INSERT INTO Libreta(alum_id,Evaluacion_id,Calificacion,Materia_id) VALUES (%s,%s,%s,%s)", (id, Evaluacion, Calificacion, Materia))
        conexion1.commit()
    except Exception as e:
        print("Error mysql:", str(e))
    conexion1.commit()
    response=Response()
    response.status_code = 302
    response.headers['Location'] = '/cargarcalificacion'
    return response


#MATERIAS
@app.ruta('/materias')
def mat(request, response):
    template= env.get_template('materias.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response


#CONSULTA DE MATERIAS
@app.ruta('/materiacarrera')
def materiacarrera (request, response):
    template= env.get_template('materiacarrera.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response

#CONSULTA DE MATERIAS POR CARRERA Y AÑO
@app.ruta('/matecon',methods=['POST'])
def matecon(request, response):
    
    
    num = request.POST.get('mat_carrera')
    aio = request.POST.get('aio')

    
    
    
    cursor1.execute("""SELECT materias.id_materias, materias.Nombre AS Nombre_materia, profesor.nombre AS Nombre_profesor, profesor.apellido AS Apellido ,materias.anio, carrera.Nombre AS Nombre_carrera
                        FROM materias
                        INNER JOIN profesor ON materias.id_prof_corresp = profesor.id_profesor
                        INNER JOIN carrera ON materias.id_carre_corresp = carrera.id_carrera
                        WHERE materias.id_carre_corresp = %s AND materias.anio = %s;""", (num, aio))

    
    resultados = cursor1.fetchall()

    template = env.get_template('materiacarrera.html')
    rendered_html = template.render(cursor1=resultados)
    response = Response()
    response.text = rendered_html
    return response

#ABM MATERIAS
@app.ruta('/abmaterias')
def materias(request, response):
    mostrarprofes (request, response, env)
    template= env.get_template('abmaterias.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response

#CONSULTA DE MATERIAS POR CARRERA Y AÑO EN ABM
@app.ruta('/materiacon',methods=['POST'])

def materiacon(request, response):
    mostrarprofes (request, response, env)
    
    num = request.POST.get('num_carrera')
    aio = request.POST.get('aio')
    
    cursor1.execute("""SELECT materias.id_materias, materias.Nombre AS Nombre_materia, profesor.nombre AS Nombre_profesor, profesor.apellido AS Apellido ,materias.anio, carrera.Nombre AS Nombre_carrera
                    FROM materias
                    INNER JOIN profesor ON materias.id_prof_corresp = profesor.id_profesor
                    INNER JOIN carrera ON materias.id_carre_corresp = carrera.id_carrera
                    WHERE materias.id_carre_corresp = %s AND materias.anio = %s;""", (num, aio))
    
    resultados = cursor1.fetchall()

    template = env.get_template('abmaterias.html')
    rendered_html = template.render(cursor1=resultados)
    response = Response()
    response.text = rendered_html
    return response

#SELECCION DE PROFES EN FORMULARIO DE ABM MATERIAS
def mostrarprofes (request, response, env):
    try:
        cursor1=conexion1.cursor()
        cursor1.execute("SELECT * FROM profesor;")
        lista=cursor1.fetchall()
        env.globals["profesores"]=lista
    except Exception as e:
        print("Error MySQL:", str(e))

@app.ruta('/select')
def profes (request,response):
    mostrarprofes (request, response, env)
    try:
        cursor1.execute("SELECT * FROM profesor;")

        resultados = cursor1.fetchall()
    except Exception as e:
        print("Error mysql:", str(e))
    conexion1.commit()
    template = env.get_template('abmaterias.html')
    rendered_html = template.render(cursor1=resultados)
    response = Response()
    response.text = rendered_html
    return response

#REGISTRAR MATERIAS
@app.ruta('/registrarM', methods=['POST'])
def registrarM(request, response):
    Nombre = request.POST.get('name')
    Profesor = request.POST.get('pc')
    Año = request.POST.get('anio')
    IDC = request.POST.get('idc')
    
    cursor1.execute ("INSERT INTO Materias(Nombre,id_prof_corresp,anio,id_carre_corresp) VALUES (%s,%s,%s,%s)", (Nombre,Profesor,Año,IDC))
    conexion1.commit()
    #SIRVE PARA REDIRECCIONAR
    response=Response()
    response.status_code = 302
    response.headers['Location'] = '/abmaterias'
    return response

#EDITAR DATOS DE MATERIA
@app.ruta('/editarM', methods=['POST'])
def editarM (request, response):
    mostrarprofes (request, response, env)
    id = request.POST.get('id_materia')

    cursor1.execute(f"select * FROM Materias WHERE (`ID_materias` = '{id}')")
    datos_materia = cursor1.fetchone()
    conexion1.commit()



    template= env.get_template('editmateria.html')
    rendered_html = template.render(datos_materia=datos_materia)
    response=Response()
    response.text = rendered_html
    return response

#CONFIRMAR MODIFICACION DE LA MATERIA
@app.ruta('/confirM', methods=['POST'])
def confirM (request, response):
    id = request.POST.get('id')
    Nombre = request.POST.get('name')
    Profesor = request.POST.get('pc')
    IDC = request.POST.get('idc')
    Año = request.POST.get('anio')

    try:

        cursor1.execute (f"UPDATE `mydb`.`Materias` SET `Nombre` = '{Nombre}', `id_prof_corresp` = '{Profesor}', `anio` = '{Año}', `id_carre_corresp` = '{IDC}' WHERE (`ID_materias` = '{id}');")
    except Exception as e:
        print("Error mysql:", str(e))
    conexion1.commit()
    response=Response()
    response.status_code = 302
    response.headers['Location'] = '/abmaterias'
    return response

#BORRAR MATERIA
@app.ruta('/borrarM', methods=['POST'])
def borrarC (request, response):

    id = request.POST.get('id_materia')

    cursor1.execute(f"delete FROM Materias WHERE (`ID_materias` = '{id}')")
    conexion1.commit()
    response=Response()
    response.status_code = 302
    response.headers['Location'] = '/abmaterias'
    return response


#PROFESORES
@app.ruta('/profesores')
def profesores(request, response):
    template= env.get_template('profesores.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response

#CONSULTA DE PROFESORES
@app.ruta('/consprofe')
def consalum(request, response):
    template= env.get_template('consultaprofesores.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response


#CONSULTA DE PROFESORES POR CARRERA Y AÑO
@app.ruta('/profecons',methods=['POST'])
def profecons(request, response):
    
    
    num = request.POST.get('num_carrera')
    aio = request.POST.get('aio')

    
    
    
    cursor1.execute("""SELECT profesor.id_profesor, profesor.nombre, profesor.apellido, profesor.dni, profesor.domicilio, profesor.email, profesor.edad, profesor.genero, profesor.cuil, materias.nombre as Materia 
                    FROM profesor INNER JOIN materias ON profesor.id_profesor = materias.id_prof_corresp
                    WHERE materias.id_carre_corresp = %s AND materias.anio = %s;""", (num, aio))

    
    resultados = cursor1.fetchall()

    template = env.get_template('consultaprofesores.html')
    rendered_html = template.render(cursor1=resultados)
    response = Response()
    response.text = rendered_html
    return response

#ABM PROFESORES //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@app.ruta('/abmprofes')
def abmprofes(request, response):
    template= env.get_template('abmprofes.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response

#CONSULTA DE PROFESORES POR CARRERA Y AÑO EN ABM
@app.ruta('/profcon2',methods=['POST'])
def profecon2(request, response):
    
    
    num = request.POST.get('num_carrera')
    aio = request.POST.get('aio')
    
    cursor1.execute("""SELECT profesor.id_profesor, profesor.nombre, profesor.apellido, profesor.dni, profesor.domicilio, profesor.email, profesor.edad, profesor.genero, profesor.cuil, materias.nombre as Materia 
                    FROM profesor INNER JOIN materias ON profesor.id_profesor = materias.id_prof_corresp
                    WHERE materias.id_carre_corresp = %s AND materias.anio = %s;""", (num, aio))
        
    resultados = cursor1.fetchall()

    template = env.get_template('abmprofes.html')
    rendered_html = template.render(cursor1=resultados)
    response = Response()
    response.text = rendered_html
    return response

#REGISTRAR PROFESOR
@app.ruta('/registrarP', methods=['POST'])
def matricularP (request, response):
    Nombre = request.POST.get('name')
    Apellido = request.POST.get('apellido')
    DNI = request.POST.get('dni')
    Domicilio = request.POST.get('domicilio')
    Email = request.POST.get('email')
    Edad = request.POST.get('edad')
    Genero = request.POST.get('genero')
    cuil = request.POST.get('cuil')
    IDC = request.POST.get('idc')
    Año = request.POST.get('anio')

    cursor1.execute ("INSERT INTO Profesor(Nombre,Apellido,DNI,Domicilio,Email,Edad,Genero,Cuil,id_carrerac, anio) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)", (Nombre, Apellido, DNI, Domicilio,Email,Edad,Genero,cuil,IDC,Año))
    conexion1.commit()
    #SIRVE PARA REDIRECCIONAR
    response=Response()
    response.status_code = 302
    response.headers['Location'] = '/abmprofes'
    return response

#EDITAR DATOS DEL PROFE
@app.ruta('/editarP', methods=['POST'])
def editarP (request, response):

    id = request.POST.get('id_profe')

    cursor1.execute(f"select * FROM Profesor WHERE (`ID_profesor` = '{id}')")
    datos_profe = cursor1.fetchone()
    conexion1.commit()



    template= env.get_template('editprofe.html')
    rendered_html = template.render(datos_profe=datos_profe)
    response=Response()
    response.text = rendered_html
    return response


#CONFIRMAR MODIFICACION DEL PROFESOR
@app.ruta('/confirP', methods=['POST'])
def confirP (request, response):
    id = request.POST.get('id')
    Nombre = request.POST.get('name')
    Apellido = request.POST.get('apellido')
    DNI = request.POST.get('dni')
    Domicilio = request.POST.get('domicilio')
    Email = request.POST.get('email')
    Edad = request.POST.get('edad')
    Cuil = request.POST.get('cuil')
    Genero = request.POST.get('genero')
    IDC = request.POST.get('idc')
    Año = request.POST.get('anio')


    try:
        resultado = f"UPDATE `mydb`.`Profesor` SET `Nombre` = '{Nombre}', `Apellido` = '{Apellido}', `DNI` = '{DNI}', `Domicilio` = '{Domicilio}',`Email` = '{Email}', `Edad` = '{Edad}', `Genero` = '{Genero}',`Cuil` = '{Cuil}' , `id_carrerac` = '{IDC}', `anio` = '{Año}' WHERE (`ID_profesor` = '{id}');"
        cursor1.execute (resultado)
    except Exception as e:
        print("Error mysql:", str(e))
    conexion1.commit()
    response=Response()
    response.status_code = 302
    response.headers['Location'] = '/abmprofes'
    return response

#BORRAR PROFESOR
@app.ruta('/borrarP', methods=['POST'])
def borrarP (request, response):

    id = request.POST.get('id_profe')

    cursor1.execute(f"delete FROM Profesor WHERE (`ID_profesor` = '{id}')")
    conexion1.commit()
    response=Response()
    response.status_code = 302
    response.headers['Location'] = '/abmprofes'
    return response

#HORARIOS
@app.ruta('/horarios')
def horarios (request, response):
    template= env.get_template('horarios.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response

@app.ruta('/horarioDS')
def horarios1 (request, response):
    template= env.get_template('horarioDS.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response

@app.ruta('/horarioAE')
def horarios2 (request, response):
    template= env.get_template('horarioAE.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response

@app.ruta('/horarioCR')
def horarios3 (request, response):
    template= env.get_template('horarioCR.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response

@app.ruta('/horarioSH')
def horarios4 (request, response):
    template= env.get_template('horarioSH.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response

@app.ruta('/horarioTB')
def horarios5 (request, response):
    template= env.get_template('horarioTB.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response

@app.ruta('/horarioOV')
def horarios6 (request, response):
    template= env.get_template('horarioOV.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response

#GENERAR LA LIBRETA DEL ALUMNO 
@app.ruta('/generar')
def cargarcali(request, response):
    template= env.get_template('generarlibreta.html')
    rendered_html = template.render()
    response=Response()
    response.text = rendered_html
    return response


#CONSULTA DE ALUMNOS POR CARRERA Y AÑO
@app.ruta('/consparagenerar',methods=['POST'])
def conspcar(request, response):
    
    
    num = request.POST.get('num_carrera')
    aio = request.POST.get('aio')

    
    cursor1.execute("SELECT alumnos.*, carrera.nombre FROM alumnos JOIN carrera ON alumnos.ID_carre_corresp = carrera.ID_carrera WHERE alumnos.ID_carre_corresp = %s AND alumnos.anio = %s;", (num, aio))

    
    
    resultados = cursor1.fetchall()

    template = env.get_template('generarlibreta.html')
    rendered_html = template.render(cursor1=resultados)
    response = Response()
    response.text = rendered_html
    return response

#LISTA DE LIBRETAS
@app.ruta('/libreta',methods=['POST'])
def libreta(request, response):
    id = request.POST.get('id_alumno')
    nombre= request.POST.get('nombrealumno')
    apellido = request.POST.get('apellidoalumno')
    dni = request.POST.get('dni')
    domicilio = request.POST.get('domicilio')
    carrera = request.POST.get ('carrera')
    aio = request.POST.get ('aio')

    resultados = {}
    
    resultados ['id']= id
    resultados ['nombre']= nombre
    resultados ['apellido']= apellido
    resultados ['dni']= dni
    resultados ['domicilio']= domicilio
    resultados ['carrera']= carrera
    resultados ['aio']= aio
    
    cursor1.execute("""SELECT materias.Nombre AS nombre_materia, libreta.Materia_id, min(libreta.calificacion), max(libreta.calificacion), count(libreta.calificacion), avg(libreta.Calificacion)
        FROM materias
        INNER JOIN libreta 
        ON libreta.materia_id = materias.ID_materias
        WHERE libreta.alum_id = %s
        GROUP BY libreta.Materia_id
        LIMIT 5;""",(id,))



    resultados['materias']=cursor1.fetchall()
    
    template= env.get_template('libreta.html')
    rendered_html = template.render(resultados=resultados)
    response=Response()
    response.text = rendered_html
    return response

#REVISAR NOTAS DE ALUMNOS
@app.ruta('/revisarnotas', methods=['POST'])
def revisar (request, response):
    id = request.POST.get('id_carrera')
    ida = request.POST.get('id_alum')

    cursor1.execute("""SELECT libreta.calificacion, tipo_evaluación.nombre
                    FROM libreta
                    INNER JOIN tipo_evaluación
                    ON libreta.evaluacion_id = tipo_evaluación.ID_Tipo_evaluacion
                    WHERE libreta.Materia_id = %s and libreta.alum_id = %s;""",(id,ida))
    
    resultados = cursor1.fetchall()

    template = env.get_template('revisionnotas.html')
    rendered_html = template.render(cursor1=resultados)
    response = Response()
    response.text = rendered_html
    return response

app=WhiteNoise(app, root='static/')

