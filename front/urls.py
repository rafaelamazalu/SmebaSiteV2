from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('register', views.register, name='register'),
    path('register-user', views.register_user, name='register_user'),
    path('start-questionnaire', views.start_questionnaire, name='start_questionnaire'),
    path('next-questionnaire', views.next_questionnaire_question, name='next_questionnaire_question'),

]