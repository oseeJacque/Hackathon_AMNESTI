from django.contrib import admin
from .models import Administrator
# Register your models here.
@admin.register(Administrator)
class EntiteAdmin(admin.ModelAdmin):
    pass
