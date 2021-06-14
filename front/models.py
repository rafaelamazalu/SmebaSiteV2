# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Cuestionario(models.Model):
    idcuestionario = models.AutoField(primary_key=True)
    idusuario = models.OneToOneField('Usuario', models.DO_NOTHING, db_column='idusuario')
    fecha = models.DateTimeField()
    usalentes = models.TextField(blank=True, null=True)  # This field type is a guess.
    ididioma = models.OneToOneField('Idioma', models.DO_NOTHING, db_column='ididioma')
    browser = models.CharField(max_length=100, blank=True, null=True)
    sistemaoperativo = models.CharField(max_length=100, blank=True, null=True)
    lectorpantalla = models.TextField(blank=True, null=True)  # This field type is a guess.
    magnificador = models.TextField(blank=True, null=True)  # This field type is a guess.
    reconocedorvoz = models.TextField(blank=True, null=True)  # This field type is a guess.

    class Meta:
        managed = False
        db_table = 'cuestionario'


class Estereotipo(models.Model):
    idestereotipo = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    descripcion = models.CharField(max_length=250)

    class Meta:
        managed = False
        db_table = 'estereotipo'


class Genero(models.Model):
    idgenero = models.AutoField(primary_key=True)
    descripcion = models.CharField(max_length=20)
    abreviatura = models.CharField(max_length=3)

    class Meta:
        managed = False
        db_table = 'genero'


class GrupoPregunta(models.Model):
    idgrupopregunta = models.AutoField(primary_key=True)
    descripcion = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'grupo_pregunta'


class Idioma(models.Model):
    ididioma = models.AutoField(primary_key=True)
    descripcion = models.CharField(max_length=40)
    abreviatura = models.CharField(max_length=5)

    class Meta:
        managed = False
        db_table = 'idioma'


class Pregunta(models.Model):
    idpregunta = models.AutoField(primary_key=True)
    textopredefinido = models.CharField(max_length=250)
    rutaimagen = models.CharField(max_length=1000)
    sentenciaprologpredeterminada = models.CharField(max_length=50)
    idtiporespuesta = models.ForeignKey('TipoRespuesta', models.DO_NOTHING, db_column='idtiporespuesta')
    idgrupopregunta = models.ForeignKey(GrupoPregunta, models.DO_NOTHING, db_column='idgrupopregunta')

    class Meta:
        managed = False
        db_table = 'pregunta'


class Respuesta(models.Model):
    idrespuesta = models.IntegerField(primary_key=True)
    idpregunta = models.ForeignKey(Pregunta, models.DO_NOTHING, db_column='idpregunta')
    resultado = models.CharField(max_length=100)
    sentenciaprolog = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'respuesta'


class RespuestaCuestionario(models.Model):
    idrespuesta_cuestionario = models.AutoField(primary_key=True)
    idcuestionario = models.ForeignKey(Cuestionario, models.DO_NOTHING, db_column='idcuestionario')
    idpregunta = models.ForeignKey(Pregunta, models.DO_NOTHING, db_column='idpregunta')
    resultado = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'respuesta_cuestionario'


class TipoRespuesta(models.Model):
    idtiporespuesta = models.AutoField(primary_key=True)
    descripcion = models.CharField(max_length=50)
    abreviatura = models.CharField(max_length=5)

    class Meta:
        managed = False
        db_table = 'tipo_respuesta'


class Usuario(models.Model):
    idusuario = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    apellido = models.CharField(max_length=50)
    fechanacimiento = models.DateField()
    idgenero = models.ForeignKey(Genero, models.DO_NOTHING, db_column='idgenero')
    nombreusuario = models.CharField(max_length=50)
    password = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'usuario'


class UsuarioEstereotipado(models.Model):
    idusuarioestereotipado = models.AutoField(primary_key=True)
    idusuario = models.OneToOneField(Usuario, models.DO_NOTHING, db_column='idusuario')
    idestereotipo = models.OneToOneField(Estereotipo, models.DO_NOTHING, db_column='idestereotipo')
    nivel = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'usuario_estereotipado'
