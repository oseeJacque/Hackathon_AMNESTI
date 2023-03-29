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
    name = models.CharField(max_length=200)
    description = models.TextField(verbose_name="Catégorie de la denonciation")

    def __str__(self) -> str:
        return  self.name


class Actor(models.Model):
    type = models.CharField(max_length=200,choices=VictimTypeEnum.items(),default=VictimTypeEnum.INDIVIDU) 
    name = models.TextField(verbose_name="Description de l'acteur")
    category = models.CharField(max_length=200,choices=ActorCategoryEnum.items(),default=ActorCategoryEnum.WITNESS) 
    whatsapp = models.TextField(verbose_name="Numéro whatsapp de l'Equipe")
    address =  models.JSONField(verbose_name="Localisation")

    

class Team(models.Model):
    code = models.CharField(max_length=200)
    name = models.TextField(verbose_name="Description de l'Equipe")
    contact = models.TextField(verbose_name="contact de l'Equipe")
    whatsapp = models.TextField(verbose_name="Numéro whatsapp de l'Equipe")
    address =  models.JSONField(verbose_name="Localisation")
    responsable = models.OneToOneField(to=Administrator,related_name="step_actors")

    def __str__(self) -> str:
        return  self.name 


class Denonciation(models.Model):
    title = models.CharField(max_length=200)
    description = models.CharField(max_length=200)
    pictures = models.ArrayField(models.ImageField(upload_to='images/denonciation_picture'), blank=True, null=True)
    audio =  models.FileField(upload_to='audios/denonciation_audios',blank=True,null=True)
    file =  models.FileField(upload_to='files/denonciation_files',blank=True,null=True)
    status = models.CharField(max_length=200,choices=StatutDenoEnum.items(),default=StatutDenoEnum.PENDING)
    address =  models.JSONField(verbose_name="Localisation") 
    priority = models.CharField(max_length=200,choices=PriorityDenoEnum.items(),default=PriorityDenoEnum.PASSED) 
    denonciator = models.ForeignKey(to=Denonciator,on_delete=models.SET_NULL,null=True) 
    category = models.ForeignKey(to=Category,on_delete=models.SET_NULL,null=True) 
    team = models.ForeignKey(to=Team,on_delete=models.SET_NULL,null=True) 
    actors = models.ManyToManyField(to=Actor,related_name="actors")
    created_at=models.DateTimeField(auto_now_add=True)  
    updated_at=models.DateTimeField(auto_now_add=True) 

    def __str__(self) -> str:
        return  self.title
    
class Step(models.Model):
    status = models.CharField(max_length=200,choices=EtapeStatutEnum.items(),default=EtapeStatutEnum.PENDING) 
    description = models.CharField(max_length=200)
    denonciation = models.ForeignKey(to=Denonciation,on_delete=models.SET_NULL,null=True) 
    actors = models.OneToOneField(to=Actor,related_name="step_actors")
    created_at=models.DateTimeField(auto_now_add=True)  
    updated_at=models.DateTimeField(auto_now_add=True) 

    def __str__(self) -> str:
        return  f'{self.status} {self.denonciation}'

class Publication(models.Model):  
    type = models.CharField(max_length=200,choices=TypePublishEnumEnum.items(),default=TypePublishEnumEnum.PENDING) 
    content = models.TextField(verbose_name="Description de la publication")
    administrator = models.ForeignKey(to=Administrator,on_delete=models.SET_NULL,null=True)
    created_at=models.DateTimeField(auto_now_add=True)  
    updated_at=models.DateTimeField(auto_now_add=True) 
     
    def __str__(self) -> str:
            return  f'{self.type} {self.content}'


class Petition(models.Model):
    content = models.TextField(verbose_name="Contenu de la publication")
    publication = models.ForeignKey(to=Publication,on_delete=models.SET_NULL,null=True)
    user = models.ForeignKey(to=Denonciator,on_delete=models.SET_NULL,null=True)
    created_at=models.DateTimeField(auto_now_add=True)  
    updated_at=models.DateTimeField(auto_now_add=True) 

    def __str__(self) -> str:
            return  f'{self.content} {self.publication} {self.user}'




