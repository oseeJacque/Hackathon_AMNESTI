from django.db import models
from utils.enums import *

from authentication.models import Administrator


class Denonciator(models.Model):
    first_name = models.CharField(max_length=200)
    last_name = models.CharField(max_length=200)
    phone = models.CharField(max_length=15,unique=True)
    address =  models.JSONField(verbose_name="Localisation")   
    updated_at=models.DateTimeField(auto_now_add=True) 

    REQUIRED_FIELDS=['first_name','last_name','address','phone']
 
    def __str__(self):
        return '{self.phone} {self.first_name} {self.last_name}'
    
    def has_perm(self, perm, obj=None):
            return self.is_admin
    
    def get_user_name(self):
        return f'{self.first_name} {self.last_name}'
    
    
    def get_address(self):
        return f'{self.address}'
    
    def has_module_perms(self, app_label) :
        return True
    

class Category(models.Model):
    code = models.CharField(max_length=200)
    description = models.TextField(verbose_name="Catégorie de la denonciation")


class Denonciation(models.Model):
    title = models.CharField(max_length=200)
    description = models.CharField(max_length=200)
    pictures = models.ArrayField(models.ImageField(upload_to='images/denonciation_picture'), blank=True, null=True)
    audio =  models.FileField(upload_to='audios/denonciation_audios',blank=True,null=True)
    file =  models.FileField(upload_to='files/denonciation_files',blank=True,null=True)
    statut = models.CharField(max_length=200,choices=StatutDenoEnum.items(),default=StatutDenoEnum.PENDING)
    address =  models.JSONField(verbose_name="Localisation") 
    priority = models.CharField(max_length=200,choices=PriorityDenoEnum.items(),default=PriorityDenoEnum.PASSED) 
    denonciator = models.ForeignKey(to=Denonciator,on_delete=models.SET_NULL,null=True) 
    created_at=models.DateTimeField(auto_now_add=True)  
    updated_at=models.DateTimeField(auto_now_add=True) 