from django.shortcuts import render
from django.http import HttpResponse
# Create your views here.
def index(request):
    args = {}
    args['home'] = "prueba"
    args['about'] = "otra_prueba"
    args['contact'] = "rafaelamazalu@gmail.com"
    return render(request, 'front/index.html', args)
