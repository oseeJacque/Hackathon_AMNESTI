from django.contrib import admin
from .models import *
# Register your models here.

@admin.register(Denonciator)
class EntiteAdmin(admin.ModelAdmin):
    pass

@admin.register(Denonciation)
class EntiteAdmin(admin.ModelAdmin):
    pass