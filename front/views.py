from django.http.response import HttpResponseRedirect
from django.shortcuts import render
from django.http import HttpResponse
import httpagentparser
from .models import Cuestionario, Genero, Idioma, Pregunta, Respuesta, RespuestaCuestionario, Usuario
from datetime import datetime
from random import randrange
import subprocess
# Create your views here.
def index(request):
    args = {}
    args['home'] = "prueba"
    args['about'] = "otra_prueba"
    args['contact'] = "rafaelamazalu@gmail.com"
    return render(request, 'front/index.html', args)

def register(request):
    args = {}
    return render(request,'front/register.html',args)

def register_user(request):
    args = {}
    usuario = Usuario()
    if request.method == 'POST':
        try:
            genero = Genero.objects.get(pk=request.POST['idgenero'])
            usuario.apellido = request.POST['surname']
            usuario.nombre = request.POST['name']
            usuario.fechanacimiento = request.POST['birthdate']
            usuario.nombreusuario = request.POST['username']
            usuario.password = request.POST['password']
            usuario.idgenero = genero
            usuario.save()
            request.session['usuario'] = usuario.idusuario
            return HttpResponseRedirect ('start-questionnaire',args)
        except (KeyError):
            args['error_message']="Por favor, complete todos los campos del formulario"
    args['generos'] = Genero.objects.all()
    args['usuario'] = usuario

    return render(request,'front/register_user.html',args)

def start_questionnaire(request):
    args={}
    usuario = Usuario.objects.get(pk=request.session.get('usuario'))
    if usuario:
        ##Recuperacion de los datos del navegador para completitud de datos como lenguaje, navegador y sistema operativo
        agent = request.META["HTTP_USER_AGENT"]
        info = httpagentparser.detect(agent)
        operating_system = info["os"]["name"]
        browser = info["browser"]["name"] +" "+ info["browser"]["version"]
        language = request.LANGUAGE_CODE
        cuestionario = Cuestionario()
        if request.method == 'POST':
            
            idiomas = Idioma.objects.filter(abreviatura = language)
            if not idiomas:
                idioma = Idioma()
                idioma.descripcion = language
                idioma.abreviatura = language
                idioma.save()
            else:
                idioma = idiomas[0]
            cuestionario.browser = browser
            cuestionario.sistemaoperativo = operating_system
            cuestionario.ididioma = idioma
            cuestionario.usalentes = request.POST['usalentes']
            cuestionario.lectorpantalla = request.POST['lectorpantalla']
            cuestionario.magnificador = request.POST['magnificador']
            cuestionario.reconocedorvoz = request.POST['reconocedorvoz']
            cuestionario.idusuario = usuario
            now = datetime.now()
            cuestionario.fecha = now.strftime("%Y-%m-%d %H:%M:%S")
            cuestionario.save()
            request.session['cuestionario'] = cuestionario.idcuestionario
            return HttpResponseRedirect ('next-questionnaire',args)
        
        args['usuario'] = usuario
        args['cuestionario'] = cuestionario
        args['os'] = operating_system
        args['browser'] = browser
        args['language'] = language
        return render(request, 'front/start_questionnaire.html',args)

def find_next_question_in_group(selected_group_id, actual_question_id = None):
    query = Pregunta.objects.filter(idgrupopregunta=selected_group_id)
    if actual_question_id:
        query = query.filter(idpregunta__gt=actual_question_id)
    pregunta = query.order_by("idpregunta")
    if pregunta:
        pregunta = pregunta[0]
    return pregunta

def process_questionnaire(cuestionario):
    respuestas = RespuestaCuestionario.objects.filter(idcuestionario = cuestionario.idcuestionario)
    resultado = '['
    for respuesta in respuestas:
        referencias = Respuesta.objects.filter(idpregunta=respuesta.idpregunta, resultado=respuesta.resultado)
        for referencia in referencias:
            if len(resultado) > 1:
                resultado = resultado +','
            resultado = resultado + referencia.sentencia_asl
    resultado = resultado + ']'
    process = subprocess.Popen(['python','agents/agentController.py','--questionnaire_facts=' + resultado],
                        stdout=subprocess.PIPE, 
                        stderr=subprocess.PIPE)
    stdout, stderr = process.communicate()
    print("Resultado de la ejecucion: ", stdout)
    print("Error: ", stderr)
    return None

def next_questionnaire_question(request):
    cuestionario = Cuestionario.objects.get(pk=request.session.get('cuestionario'))
    if cuestionario:
        args={}
        args['cuestionario'] = cuestionario
        if request.method == 'POST':
            pregunta = Pregunta.objects.get(pk=request.POST['pregunta_id'])
            respuesta  = RespuestaCuestionario()
            respuesta.idcuestionario = cuestionario
            respuesta.idpregunta = pregunta
            respuesta.resultado = request.POST['respuesta_cuestionario_value']
            respuesta.save()
            selected_group = request.session.get('selected_group')
            pregunta = find_next_question_in_group(selected_group, respuesta.idpregunta.idpregunta)
            if(pregunta):
                args['pregunta'] = pregunta
                return render(request, 'front/next_questionnaire_question.html',args)
            else:
                process_questionnaire(cuestionario)
                return render(request, 'front/finish_questionnaire.html',args)
        # si no es post, se considera que es la primer pregunta
        # Se procede a la determinacion de un grupo para la realizacion del cuestionario
        selected_group = randrange(1, 3)
        request.session['selected_group'] = selected_group
        pregunta = find_next_question_in_group(selected_group)
        if pregunta:
            args['pregunta'] = pregunta
            return render(request, 'front/next_questionnaire_question.html',args)
        else:
            process_questionnaire(cuestionario.idcuestionario)
            return render(request, 'front/finish_questionnaire.html',args)
