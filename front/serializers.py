from rest_framework import serializers

from .models import Wcag, Barrera, BarreraEstereotipo

class WcagSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Wcag
        fields = ('idwcag', 'numero','titulo','descripcion','nivel','uri')

class BarreraSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Barrera
        fields = ('idbarrera', 'nombre')

class BarreraEstereotipoSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = BarreraEstereotipo
        fields = ('idbarrera', 'idestereotipo', 'idwcag')